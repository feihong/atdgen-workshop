(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type textHtml = Eventbrite_t.textHtml = { text: string; html: string }

type pagination = Eventbrite_t.pagination = {
  object_count: int;
  page_number: int;
  page_size: int;
  page_count: int;
  has_more_items: bool
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
  venue_id: string
}

type events = Eventbrite_t.events

type result = Eventbrite_t.result = {
  pagination: pagination;
  events: events
}

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
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"venue_id"
          t.venue_id
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
          venue_id =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "venue_id"
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
let write_result = (
  Atdgen_codec_runtime.Encode.make (fun (t : result) ->
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
let read_result = (
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
      } : result)
    )
  )
)
