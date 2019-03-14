// Print all events as well as the number of events.

Events.fetch()
->Future.tapOk(events => {
    // Js.log(events->Event_bs.write_events->Js.log;
    events->List.forEach(event => {
      Js.log(event.name);
      Js.log(
        event.description |> Js.String.substrAtMost(~from=0, ~length=300),
      );
      Js.log("=============");
    });
    Js.log(Printf.sprintf("Fetched %d events", events->List.length));
  })
->Future.tapError(err => Js.log2("ERROR:", err));
