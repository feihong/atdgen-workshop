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
       Eventbrite.fetch(result.lat, result.lon);
     })
  ->then_(events =>
       Js.log(events->List.toArray)->resolve
     )
  ->catch(err => Js.log2("Caught error:", err)->resolve)
);
