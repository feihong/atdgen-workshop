(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type venue = Eventbrite_t.venue = {
  id: string;
  name: string;
  address: string
}

type textHtml = Eventbrite_t.textHtml = { text: string; html: string }

type pagination = Eventbrite_t.pagination = {
  object_count: int;
  page_number: int;
  page_size: int;
  page_count: int;
  has_more_items: bool
}

type organizer = Eventbrite_t.organizer = {
  id: string;
  name: string;
  description: textHtml;
  url: string
}

type datetime = Eventbrite_t.datetime = {
  timezone: string;
  local: string;
  utc: string
}

type event = Eventbrite_t.event = {
  id: string;
  name: textHtml;
  description: textHtml;
  url: string;
  start: datetime;
  end_: datetime;
  is_series: bool;
  online_event: bool;
  venue: venue option;
  organizer: organizer option
}

type events = Eventbrite_t.events

type searchResult = Eventbrite_t.searchResult = {
  pagination: pagination;
  events: events
}

let write_venue = (
  Atdgen_codec_runtime.Encode.make (fun (t : venue) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"id"
          t.id
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
          id =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "id"
            ) json;
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          address =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "address"
            ) json;
      } : venue)
    )
  )
)
let write_textHtml = (
  Atdgen_codec_runtime.Encode.make (fun (t : textHtml) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"text"
          t.text
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"html"
          t.html
      ]
    )
  )
)
let read_textHtml = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          text =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "text"
            ) json;
          html =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "html"
            ) json;
      } : textHtml)
    )
  )
)
let write_pagination = (
  Atdgen_codec_runtime.Encode.make (fun (t : pagination) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"object_count"
          t.object_count
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"page_number"
          t.page_number
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"page_size"
          t.page_size
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"page_count"
          t.page_count
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.bool
            )
          ~name:"has_more_items"
          t.has_more_items
      ]
    )
  )
)
let read_pagination = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          object_count =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "object_count"
            ) json;
          page_number =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "page_number"
            ) json;
          page_size =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "page_size"
            ) json;
          page_count =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "page_count"
            ) json;
          has_more_items =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.bool
              |> Atdgen_codec_runtime.Decode.field "has_more_items"
            ) json;
      } : pagination)
    )
  )
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
          ~name:"id"
          t.id
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
            write_textHtml
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
      ]
    )
  )
)
let read_organizer = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          id =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "id"
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
              read_textHtml
              |> Atdgen_codec_runtime.Decode.field "description"
            ) json;
          url =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "url"
            ) json;
      } : organizer)
    )
  )
)
let write_datetime = (
  Atdgen_codec_runtime.Encode.make (fun (t : datetime) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"timezone"
          t.timezone
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"local"
          t.local
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"utc"
          t.utc
      ]
    )
  )
)
let read_datetime = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          timezone =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "timezone"
            ) json;
          local =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "local"
            ) json;
          utc =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "utc"
            ) json;
      } : datetime)
    )
  )
)
let write__3 = (
  Atdgen_codec_runtime.Encode.nullable (
    write_organizer
  )
)
let read__3 = (
  Atdgen_codec_runtime.Decode.nullable (
    read_organizer
  )
)
let write__2 = (
  Atdgen_codec_runtime.Encode.nullable (
    write_venue
  )
)
let read__2 = (
  Atdgen_codec_runtime.Decode.nullable (
    read_venue
  )
)
let write_event = (
  Atdgen_codec_runtime.Encode.make (fun (t : event) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"id"
          t.id
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_textHtml
            )
          ~name:"name"
          t.name
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_textHtml
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
            write_datetime
            )
          ~name:"end"
          t.end_
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.bool
            )
          ~name:"is_series"
          t.is_series
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.bool
            )
          ~name:"online_event"
          t.online_event
        ;
          Atdgen_codec_runtime.Encode.field_o
            (
            write_venue
            )
          ~name:"venue"
          t.venue
        ;
          Atdgen_codec_runtime.Encode.field_o
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
          id =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "id"
            ) json;
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              read_textHtml
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          description =
            Atdgen_codec_runtime.Decode.decode
            (
              read_textHtml
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
              read_datetime
              |> Atdgen_codec_runtime.Decode.field "end"
            ) json;
          is_series =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.bool
              |> Atdgen_codec_runtime.Decode.field "is_series"
            ) json;
          online_event =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.bool
              |> Atdgen_codec_runtime.Decode.field "online_event"
            ) json;
          venue =
            Atdgen_codec_runtime.Decode.decode
            (
              read_venue
              |> Atdgen_codec_runtime.Decode.fieldOptional "venue"
            ) json;
          organizer =
            Atdgen_codec_runtime.Decode.decode
            (
              read_organizer
              |> Atdgen_codec_runtime.Decode.fieldOptional "organizer"
            ) json;
      } : event)
    )
  )
)
let write__1 = (
  Atdgen_codec_runtime.Encode.list (
    write_event
  )
)
let read__1 = (
  Atdgen_codec_runtime.Decode.list (
    read_event
  )
)
let write_events = (
  write__1
)
let read_events = (
  read__1
)
let write_searchResult = (
  Atdgen_codec_runtime.Encode.make (fun (t : searchResult) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write_pagination
            )
          ~name:"pagination"
          t.pagination
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_events
            )
          ~name:"events"
          t.events
      ]
    )
  )
)
let read_searchResult = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          pagination =
            Atdgen_codec_runtime.Decode.decode
            (
              read_pagination
              |> Atdgen_codec_runtime.Decode.field "pagination"
            ) json;
          events =
            Atdgen_codec_runtime.Decode.decode
            (
              read_events
              |> Atdgen_codec_runtime.Decode.field "events"
            ) json;
      } : searchResult)
    )
  )
)
