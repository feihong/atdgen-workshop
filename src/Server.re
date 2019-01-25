[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let fetch = () => {
  let filename = "events.json";
  Promise.(
    if (Utils.isCached(filename)) {
      Fs.readFileAsUtf8Sync(filename)
      ->Js.Json.parseExn
      ->Event_bs.read_events
      ->resolve;
    } else {
      /* Ipapi.fetch() */
      Ipapi.mockFetch()
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
          Utils.writeEventsToCacheFile(
            ~filename,
            events->List.sort((a, b) => Date.compare(a.start, b.start)),
          )
        )
      ->catch(err => {
          Js.log2("Caught error:", err);
          resolve([]);
        });
    }
  );
};
