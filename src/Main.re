[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let secrets =
  try (
    NodeFs.readFileAsUtf8Sync("./secrets.json")
    ->Js.Json.parseExn
    ->Config_bs.read_secrets
  ) {
  | _ => {eventbriteToken: ""}
  };

let fetchEventbrite = (latitude, longitude) => {
  let filename = "eventbrite.json";
  let url =
    "https://www.eventbriteapi.com/v3/events/search?"
    ++ {
         "location.latitude": latitude,
         "location.longitude": longitude,
         "location.within": "1mi",
         "expand": "organizer,venue",
       }
       ->Utils.makeQueryString;

  JsPromise.(
    (
      if (Utils.isCached(filename)) {
        NodeFs.readFileAsUtf8Sync(filename)->Js.Json.parseExn->resolve;
      } else {
        Fetch.fetchWithInit(
          url,
          Fetch.RequestInit.make(
            ~method_=Fetch.Post,
            ~headers=Fetch.HeadersInit.make({"Authorization": "Bearer " ++ secrets.eventbriteToken}),
            (),
          )
        )
        ->then_(Fetch.Response.json)
        ->then_(Utils.writeCacheFile(filename))
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
