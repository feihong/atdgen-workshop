[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let sortEvents = events =>
  events->List.sort((a, b) => Date.compare(a.Event_t.start, b.start));

let fetch = () => {
  let filename = "events.json";
  if (Utils.isCached(filename)) {
    Fs.readFileAsUtf8Sync(filename)
    ->Js.Json.parseExn
    ->Event_bs.read_eventOutput
    ->Future.value;
  } else {
    Ipapi.fetch()
    // Ipapi.mockFetch()
    ->Future.flatMapOk(result => {
        Js.log(
          Printf.sprintf(
            "You are in %s, %s, %s",
            result.Ipapi_t.city,
            result.region,
            result.country,
          ),
        );
        Eventbrite.fetch(result.lat, result.lon);
      })
    ->Future.tapOk(events =>
        events
        ->sortEvents
        ->Result.Ok
        ->Event_bs.write_eventOutput
        ->Utils.writeCacheFile(~filename)
      )
    ->Future.tapError(err => Console.error2("Caught error:", err));
  };
};

let fetchAsPromise = () => fetch()->FutureJs.toPromise;
