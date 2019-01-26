[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let sortEvents =
  List.sort(_, (a, b) => Date.compare(a.Event_t.start, b.start));

let fetch = () => {
  let filename = "events.json";
  Promise.(
    if (Utils.isCached(filename)) {
      Fs.readFileAsUtf8Sync(filename)
      ->Js.Json.parseExn
      ->Event_bs.read_eventOutput
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
      ->then_(events => {
          let events = events->Result.map(sortEvents);
          events->Event_bs.write_eventOutput
          ->Utils.writeCacheFile(~filename)
          ->ignore;
          events->resolve;
      })
      ->catch(err => {
          Js.log2("Caught error:", err);
          Result.Error(`NetworkError(err->Js.String.make))->resolve;
        });
    }
  );
};
