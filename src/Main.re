[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let secrets =
  try (
    Node.Fs.readFileAsUtf8Sync("./secrets.json")
    ->Js.Json.parseExn
    ->Config_bs.read_secrets
  ) {
  | _ => {eventbriteToken: "", facebookToken: ""}
  };

let fetchEventbrite = (latitude, longitude) => {
  let filename = "eventbrite.json";
  let url =
    "https://www.eventbriteapi.com/v3/events/search?"
    ++ {
         "token": secrets.eventbriteToken,
         "location.latitude": latitude,
         "location.longitude": longitude,
         "location.within": "1mi",
         /* "sort_by": "date", */
         "expand": "organizer,venue",
       }
       ->Utils.makeQueryString;

  JsPromise.(
    (
      if (Node.Fs.existsSync(filename)) {
        Node.Fs.readFileAsUtf8Sync(filename)->Js.Json.parseExn->resolve;
      } else {
        Fetch.fetch(url)
        ->then_(Fetch.Response.json)
        ->then_(json => {
             let text = json->Js.Json.stringifyWithSpace(2);
             Node.Fs.writeFileAsUtf8Sync(filename, text);
             resolve(json);
           });
      }
    )
    ->then_(json => json->Eventbrite_bs.read_searchResult->resolve)
  );
};

let fetchIpApi = () => {
  let url = "http://ip-api.com/json/";
  JsPromise.(
    Fetch.fetch(url)
    ->then_(Fetch.Response.json)
    ->then_(json => json->Ipapi_bs.read_result->resolve)
  );
};

/* Main */
JsPromise.(
  fetchIpApi()
  ->then_(result => {
       Printf.sprintf(
         "You are in %s, %s, %s",
         result.Ipapi_t.city,
         result.region,
         result.country,
       )
       ->Js.log;
       fetchEventbrite(result.lat, result.lon);
     })
  ->then_(result =>
       Js.log(result.Eventbrite_t.events->List.toArray)->resolve
     )
  ->catch(err => Js.log2("Caught error:", err)->resolve)
);
