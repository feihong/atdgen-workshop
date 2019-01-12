[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let fetchIpApi = () => {
  let url = "http://ip-api.com/json/";
  JsPromise.(
    Fetch.fetch(url)
    ->then_(Fetch.Response.json)
    ->then_(json => json->Ipapi_bs.read_result->resolve)
  );
};

/* Main */
let filename = "events.json";
JsPromise.(
  (
    if (Utils.isCached(filename)) {
      NodeFs.readFileAsUtf8Sync(filename)
      ->Js.Json.parseExn
      ->Event_bs.read_events
      ->resolve;
    } else {
      fetchIpApi()
      ->then_(result => {
          Printf.sprintf(
            "You are in %s, %s, %s",
            result.Ipapi_t.city,
            result.region,
            result.country,
          )
          ->Js.log;
          Eventbrite.fetch(result.lat, result.lon);
        })
      ->then_(Utils.writeEventsToCacheFile(~filename))
      ->catch(err => {
          Js.log2("Caught error:", err);
          resolve([]);
        });
    }
  )
  ->then_(events => Js.log(events->List.toArray)->resolve)
);
