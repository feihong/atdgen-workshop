(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type address = Eventbrite_t.address = {
  address_1: string;
  address_2: string option;
  city: string option;
  region: string option;
  postal_code: string option
}

type venue = Eventbrite_t.venue = {
  id: Wrap.VenueId.t;
  name: string option;
  address: address
}

type textHtmlNullable = Eventbrite_t.textHtmlNullable = {
  text: string option;
  html: string option
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
  id: Wrap.OrganizerId.t;
  name: string option;
  description: textHtmlNullable;
  url: string
}

type datetime = Eventbrite_t.datetime = {
  timezone: string;
  local: string;
  utc: Wrap.Datetime.t
}

type event = Eventbrite_t.event = {
  id: Wrap.EventId.t;
  name: textHtml;
  description: textHtml;
  url: string;
  start: datetime;
  end_: datetime;
  is_series: bool;
  online_event: bool;
  venue: venue;
  organizer: organizer
}

type events = Eventbrite_t.events

type searchOutput = Eventbrite_t.searchOutput = {
  pagination: pagination;
  events: events
}

type searchInput = Eventbrite_t.searchInput = {
  latitude: float;
  longitude: float;
  within: string;
  expand: string
}

let write__4 = (
  Atdgen_codec_runtime.Encode.nullable (
    Atdgen_codec_runtime.Encode.string
  )
)
let read__4 = (
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
          ~name:"address_1"
          t.address_1
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"address_2"
          t.address_2
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"city"
          t.city
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"region"
          t.region
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"postal_code"
          t.postal_code
      ]
    )
  )
)
let read_address = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          address_1 =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "address_1"
            ) json;
          address_2 =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "address_2"
            ) json;
          city =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "city"
            ) json;
          region =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "region"
            ) json;
          postal_code =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "postal_code"
            ) json;
      } : address)
    )
  )
)
let write__3 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Wrap.VenueId.unwrap)
)
let read__3 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Wrap.VenueId.wrap))
)
let write_venue = (
  Atdgen_codec_runtime.Encode.make (fun (t : venue) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__3
            )
          ~name:"id"
          t.id
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
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
          id =
            Atdgen_codec_runtime.Decode.decode
            (
              read__3
              |> Atdgen_codec_runtime.Decode.field "id"
            ) json;
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
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
let write_textHtmlNullable = (
  Atdgen_codec_runtime.Encode.make (fun (t : textHtmlNullable) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"text"
          t.text
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"html"
          t.html
      ]
    )
  )
)
let read_textHtmlNullable = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          text =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "text"
            ) json;
          html =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "html"
            ) json;
      } : textHtmlNullable)
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
let write__5 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Wrap.OrganizerId.unwrap)
)
let read__5 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Wrap.OrganizerId.wrap))
)
let write_organizer = (
  Atdgen_codec_runtime.Encode.make (fun (t : organizer) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__5
            )
          ~name:"id"
          t.id
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__4
            )
          ~name:"name"
          t.name
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_textHtmlNullable
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
              read__5
              |> Atdgen_codec_runtime.Decode.field "id"
            ) json;
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              read__4
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          description =
            Atdgen_codec_runtime.Decode.decode
            (
              read_textHtmlNullable
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
let write__6 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Wrap.Datetime.unwrap)
)
let read__6 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Wrap.Datetime.wrap))
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
            write__6
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
              read__6
              |> Atdgen_codec_runtime.Decode.field "utc"
            ) json;
      } : datetime)
    )
  )
)
let write__2 = (
    Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap (Wrap.EventId.unwrap)
)
let read__2 = (
  (
    Atdgen_codec_runtime.Decode.string
  ) |> (Atdgen_codec_runtime.Decode.map (Wrap.EventId.wrap))
)
let write_event = (
  Atdgen_codec_runtime.Encode.make (fun (t : event) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__2
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
          id =
            Atdgen_codec_runtime.Decode.decode
            (
              read__2
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
let write_searchOutput = (
  Atdgen_codec_runtime.Encode.make (fun (t : searchOutput) ->
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
let read_searchOutput = (
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
      } : searchOutput)
    )
  )
)
let write_searchInput = (
  Atdgen_codec_runtime.Encode.make (fun (t : searchInput) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.float
            )
          ~name:"location.latitude"
          t.latitude
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.float
            )
          ~name:"location.longitude"
          t.longitude
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"location.within"
          t.within
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"expand"
          t.expand
      ]
    )
  )
)
let read_searchInput = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          latitude =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.float
              |> Atdgen_codec_runtime.Decode.field "location.latitude"
            ) json;
          longitude =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.float
              |> Atdgen_codec_runtime.Decode.field "location.longitude"
            ) json;
          within =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "location.within"
            ) json;
          expand =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "expand"
            ) json;
      } : searchInput)
    )
  )
)
