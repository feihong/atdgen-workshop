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
  expand: string;
  page: int;
  sort_by: string
}

type errorOutput = Eventbrite_t.errorOutput = {
  status_code: int;
  error_description: string;
  error: string
}

val read_address :  address Atdgen_codec_runtime.Decode.t

val write_address :  address Atdgen_codec_runtime.Encode.t

val read_venue :  venue Atdgen_codec_runtime.Decode.t

val write_venue :  venue Atdgen_codec_runtime.Encode.t

val read_textHtmlNullable :  textHtmlNullable Atdgen_codec_runtime.Decode.t

val write_textHtmlNullable :  textHtmlNullable Atdgen_codec_runtime.Encode.t

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

val read_searchOutput :  searchOutput Atdgen_codec_runtime.Decode.t

val write_searchOutput :  searchOutput Atdgen_codec_runtime.Encode.t

val read_searchInput :  searchInput Atdgen_codec_runtime.Decode.t

val write_searchInput :  searchInput Atdgen_codec_runtime.Encode.t

val read_errorOutput :  errorOutput Atdgen_codec_runtime.Decode.t

val write_errorOutput :  errorOutput Atdgen_codec_runtime.Encode.t

