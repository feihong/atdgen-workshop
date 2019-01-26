open Prelude;
open Utils;
open Printf;

type remoteEvents = RemoteData.t(Event_t.error, Event_t.events);

type state = {events: remoteEvents};

type action =
  | LoadEvents(remoteEvents);

let component = RR.reducerComponent(__MODULE__);

let make = _children => {
  ...component,

  initialState: () => {events: NotAsked},

  didMount: ({send}) =>
    Promise.(
      Fetch.fetch("/events/")
      ->then_(Fetch.Response.json)
      ->then_(json => {
          send @@ LoadEvents(Event_bs.read_eventOutput(json)->RemoteData.fromResult);
          resolve();
        })
      ->catch(err => Js.log2("Failed to fetch events:", err)->resolve)
      ->ignore
    ),

  reducer: (action, _state) =>
    switch (action) {
    | LoadEvents(events) => RR.Update({events: events})
    },

  render: ({state}) =>
    <div className="container p-4">
      <h1 className="mb-4"> "Events Near You"->s </h1>
      {switch (state.events) {
       | NotAsked | Loading => <div> "Loading event..."->s </div>
       | Failure(err) =>
         <div> {("Failed to load events: " ++ err->Js.String.make)->s} </div>
       | Success(events) =>
         <>
           <div className="font-bold mb-4">
             {("Showing " ++ events->List.length->string_of_int ++ " events")
              ->s}
           </div>
           <ol>
             {events
              ->List.map(event =>
                  <li
                    key={event.externalId->Wrap.ExternalId.unwrap}
                    className="mb-2">
                    <a className="mr-2" href={event.url} target="_blank">
                      event.name->s
                    </a>
                    <span className="mr-2">
                      {event.start->Js.Date.toLocaleString->s}
                    </span>
                    <div className="text-grey-dark text-sm">
                      {let addr = event.venue.address.address1
                       switch (event.venue.name) {
                       | Some(name) => sprintf("%s (%s)", name, addr)
                       | None => addr
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
