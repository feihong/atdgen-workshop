(* Auto-generated from "event.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type address = Event_t.address = {
  address1: string;
  address2: string option;
  city: string option;
  region: string option;
  postalCode: string option
}

type venue = Event_t.venue = { name: string option; address: address }

type ('a, 'b) result = ('a, 'b) Belt.Result.t =  Ok of 'a | Error of 'b 

type organizer = Event_t.organizer = {
  name: string;
  url: string;
  description: string option
}

type datetime = Event_t.datetime

type event = Event_t.event = {
  externalId: Wrap.ExternalId.t;
  name: string;
  description: string;
  url: string;
  start: datetime;
  end_: datetime option;
  isSeries: bool;
  venue: venue;
  organizer: organizer
}

type events = Event_t.events

type error = Event_t.error

type eventOutput = Event_t.eventOutput

let write__6 = (
  Atdgen_codec_runtime.Encode.nullable (
    Atdgen_codec_runtime.Encode.string
  )
)
let read__6 = (
  Atdgen_codec_runtime.Decode.nullable (
    Atdgen_codec_runtime.Decode.string
  )
)
let write_address = (
  Atdgen_codec_runtime.Encode.make (fun (t : address) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"address1"
          t.address1
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__6
            )
          ~name:"address2"
          t.address2
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__6
            )
          ~name:"city"
          t.city
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__6
            )
          ~name:"region"
          t.region
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__6
            )
          ~name:"postalCode"
          t.postalCode
      ]
    )
  )
)
let read_address = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          address1 =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "address1"
            ) json;
          address2 =
            Atdgen_codec_runtime.Decode.decode
            (
              read__6
              |> Atdgen_codec_runtime.Decode.field "address2"
            ) json;
          city =
            Atdgen_codec_runtime.Decode.decode
            (
              read__6
              |> Atdgen_codec_runtime.Decode.field "city"
            ) json;
          region =
            Atdgen_codec_runtime.Decode.decode
            (
              read__6
              |> Atdgen_codec_runtime.Decode.field "region"
            ) json;
          postalCode =
            Atdgen_codec_runtime.Decode.decode
            (
              read__6
              |> Atdgen_codec_runtime.Decode.field "postalCode"
            ) json;
      } : address)
    )
  )
)
let write_venue = (
  Atdgen_codec_runtime.Encode.make (fun (t : venue) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__6
            )
          ~name:"name"
          t.name
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_address
            )
          ~name:"address"
          t.address
      ]
    )
  )
)
let read_venue = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              read__6
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          address =
            Atdgen_codec_runtime.Decode.decode
            (
              read_address
              |> Atdgen_codec_runtime.Decode.field "address"
            ) json;
      } : venue)
    )
  )
)
let write_result write__a write__b = (
  Atdgen_codec_runtime.Encode.make (fun (x : ('a, 'b) result) -> match x with
    | Ok x ->
    Atdgen_codec_runtime.Encode.constr1 "Ok" (
      write__a
    ) x
    | Error x ->
    Atdgen_codec_runtime.Encode.constr1 "Error" (
      write__b
    ) x
  )
)
let read_result read__a read__b = (
  Atdgen_codec_runtime.Decode.enum
  [
      (
      "Ok"
      ,
        `Decode (
        read__a
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((Ok x) : ('a, 'b) result))
        )
      )
    ;
      (
      "Error"
      ,
        `Decode (
        read__b
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((Error x) : ('a, 'b) result))
        )
      )
  ]
)
let write_organizer = (
  Atdgen_codec_runtime.Encode.make (fun (t : organizer) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"name"
          t.name
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"url"
          t.url
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__6
            )
          ~name:"description"
          t.description
      ]
    )
  )
)
let read_organizer = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          url =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "url"
            ) json;
          description =
            Atdgen_codec_runtime.Decode.decode
            (
              read__6
              |> Atdgen_codec_runtime.Decode.field "description"
            ) json;
      } : organizer)
    )
  )
)
let write__1 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Wrap.Datetime.unwrap)
)
let read__1 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Wrap.Datetime.wrap))
)
let write_datetime = (
  write__1
)
let read_datetime = (
  read__1
)
let write__4 = (
  Atdgen_codec_runtime.Encode.nullable (
    write_datetime
  )
)
let read__4 = (
  Atdgen_codec_runtime.Decode.nullable (
    read_datetime
  )
)
let write__3 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Wrap.ExternalId.unwrap)
)
let read__3 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Wrap.ExternalId.wrap))
)
let write_event = (
  Atdgen_codec_runtime.Encode.make (fun (t : event) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__3
            )
          ~name:"externalId"
          t.externalId
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"name"
          t.name
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"description"
          t.description
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"url"
          t.url
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_datetime
            )
          ~name:"start"
          t.start
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"end"
          t.end_
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.bool
            )
          ~name:"isSeries"
          t.isSeries
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_venue
            )
          ~name:"venue"
          t.venue
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_organizer
            )
          ~name:"organizer"
          t.organizer
      ]
    )
  )
)
let read_event = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          externalId =
            Atdgen_codec_runtime.Decode.decode
            (
              read__3
              |> Atdgen_codec_runtime.Decode.field "externalId"
            ) json;
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          description =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "description"
            ) json;
          url =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "url"
            ) json;
          start =
            Atdgen_codec_runtime.Decode.decode
            (
              read_datetime
              |> Atdgen_codec_runtime.Decode.field "start"
            ) json;
          end_ =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "end"
            ) json;
          isSeries =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.bool
              |> Atdgen_codec_runtime.Decode.field "isSeries"
            ) json;
          venue =
            Atdgen_codec_runtime.Decode.decode
            (
              read_venue
              |> Atdgen_codec_runtime.Decode.field "venue"
            ) json;
          organizer =
            Atdgen_codec_runtime.Decode.decode
            (
              read_organizer
              |> Atdgen_codec_runtime.Decode.field "organizer"
            ) json;
      } : event)
    )
  )
)
let write__5 = (
  Atdgen_codec_runtime.Encode.list (
    write_event
  )
)
let read__5 = (
  Atdgen_codec_runtime.Decode.list (
    read_event
  )
)
let write_events = (
  write__5
)
let read_events = (
  read__5
)
let write_error = (
  Atdgen_codec_runtime.Encode.make (fun (x : _) -> match x with
    | `NotAuthorized x ->
    Atdgen_codec_runtime.Encode.constr1 "NotAuthorized" (
      Atdgen_codec_runtime.Encode.string
    ) x
    | `NetworkError x ->
    Atdgen_codec_runtime.Encode.constr1 "NetworkError" (
      Atdgen_codec_runtime.Encode.string
    ) x
    | `UnknownError x ->
    Atdgen_codec_runtime.Encode.constr1 "UnknownError" (
      Atdgen_codec_runtime.Encode.string
    ) x
  )
)
let read_error = (
  Atdgen_codec_runtime.Decode.enum
  [
      (
      "NotAuthorized"
      ,
        `Decode (
        Atdgen_codec_runtime.Decode.string
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((`NotAuthorized x) : _))
        )
      )
    ;
      (
      "NetworkError"
      ,
        `Decode (
        Atdgen_codec_runtime.Decode.string
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((`NetworkError x) : _))
        )
      )
    ;
      (
      "UnknownError"
      ,
        `Decode (
        Atdgen_codec_runtime.Decode.string
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((`UnknownError x) : _))
        )
      )
  ]
)
let write__2 = (
  Atdgen_codec_runtime.Encode.make (fun (x : (_, _) result) -> match x with
    | Ok x ->
    Atdgen_codec_runtime.Encode.constr1 "Ok" (
      write_events
    ) x
    | Error x ->
    Atdgen_codec_runtime.Encode.constr1 "Error" (
      write_error
    ) x
  )
)
let read__2 = (
  Atdgen_codec_runtime.Decode.enum
  [
      (
      "Ok"
      ,
        `Decode (
        read_events
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((Ok x) : (_, _) result))
        )
      )
    ;
      (
      "Error"
      ,
        `Decode (
        read_error
        |> Atdgen_codec_runtime.Decode.map (fun x -> ((Error x) : (_, _) result))
        )
      )
  ]
)
let write_eventOutput = (
  write__2
)
let read_eventOutput = (
  read__2
)
