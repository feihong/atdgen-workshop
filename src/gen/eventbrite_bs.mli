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

val read_venue :  venue Atdgen_codec_runtime.Decode.t

val write_venue :  venue Atdgen_codec_runtime.Encode.t

val read_textHtml :  textHtml Atdgen_codec_runtime.Decode.t

val write_textHtml :  textHtml Atdgen_codec_runtime.Encode.t

val read_pagination :  pagination Atdgen_codec_runtime.Decode.t

val write_pagination :  pagination Atdgen_codec_runtime.Encode.t

val read_organizer :  organizer Atdgen_codec_runtime.Decode.t

val write_organizer :  organizer Atdgen_codec_runtime.Encode.t

val read_datetime :  datetime Atdgen_codec_runtime.Decode.t

val write_datetime :  datetime Atdgen_codec_runtime.Encode.t

val read_event :  event Atdgen_codec_runtime.Decode.t

val write_event :  event Atdgen_codec_runtime.Encode.t

val read_events :  events Atdgen_codec_runtime.Decode.t

val write_events :  events Atdgen_codec_runtime.Encode.t

val read_searchResult :  searchResult Atdgen_codec_runtime.Decode.t

val write_searchResult :  searchResult Atdgen_codec_runtime.Encode.t

