open Prelude;
open Utils;
open Printf;
module Css = AppStyles;

type remoteEvents = RemoteData.t(Event_t.error, Event_t.events);

type state = {events: remoteEvents};

type action =
  | LoadEvents(remoteEvents);

let component = RR.reducerComponent(__MODULE__);

let make = _children => {
  ...component,

  initialState: () => {events: NotAsked},

  didMount: ({send}) =>
    FutureFetch.fetch("/events/")
    ->Future.flatMapOk(FutureFetch.json)
    ->Future.mapOk(json =>
        json
        ->Utils.decode(Event_bs.read_eventOutput)
        ->Result.map(output => {
            send @@ LoadEvents(output->RemoteData.fromResult);
            output;
          })
      )
    ->Future.tapError(err => Console.error2("Failed to fetch events:", err))
    ->ignore,

  reducer: (action, _state) =>
    switch (action) {
    | LoadEvents(events) => RR.Update({events: events})
    },

  render: ({state}) =>
    <div className=Css.container>
      <h1> "Events Near You"->s </h1>
      {switch (state.events) {
       | NotAsked
       | Loading => <div> "Loading event..."->s </div>
       | Failure(err) =>
         <div> {("Failed to load events: " ++ err->Js.String.make)->s} </div>
       | Success(events) =>
         <>
           <div className=Css.showing>
             {("Showing " ++ events->List.length->string_of_int ++ " events")
              ->s}
           </div>
           <ol className=Css.events>
             {events
              ->List.map(event =>
                  <li
                    key={event.externalId->Wrap.ExternalId.unwrap}
                    className=Css.event>
                    <a
                      className=Css.eventName href={event.url} target="_blank">
                      event.name->s
                    </a>
                    <span className=Css.eventDate>
                      {event.start->Js.Date.toLocaleString->s}
                    </span>
                    <div className=Css.eventLocation>
                      {switch (event.venue.name, event.venue.address.address1) {
                       | (Some(name), Some(addr)) =>
                         sprintf("%s (%s)", name, addr)
                       | (None, Some(addr)) => addr
                       | (Some(name), None) => name
                       | _ => "N/A"
                       }}
                      ->s
                    </div>
                  </li>
                )
              ->List.toArray
              ->RR.array}
           </ol>
         </>
       }}
    </div>,
};
