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

type searchResult = Eventbrite_t.searchResult = {
  pagination: pagination;
  events: events
}

type requestMethod = Eventbrite_t.requestMethod =  Get | Post 

type batchResult = Eventbrite_t.batchResult = { body: string; code: int }

type batchResults = Eventbrite_t.batchResults

type batchRequest = Eventbrite_t.batchRequest = {
  method_: requestMethod;
  relative_url: string
}

type batchInput = Eventbrite_t.batchInput

val read_textHtml :  textHtml Atdgen_codec_runtime.Decode.t

val write_textHtml :  textHtml Atdgen_codec_runtime.Encode.t

val read_pagination :  pagination Atdgen_codec_runtime.Decode.t

val write_pagination :  pagination Atdgen_codec_runtime.Encode.t

val read_datetime :  datetime Atdgen_codec_runtime.Decode.t

val write_datetime :  datetime Atdgen_codec_runtime.Encode.t

val read_event :  event Atdgen_codec_runtime.Decode.t

val write_event :  event Atdgen_codec_runtime.Encode.t

val read_events :  events Atdgen_codec_runtime.Decode.t

val write_events :  events Atdgen_codec_runtime.Encode.t

val read_searchResult :  searchResult Atdgen_codec_runtime.Decode.t

val write_searchResult :  searchResult Atdgen_codec_runtime.Encode.t

val read_requestMethod :  requestMethod Atdgen_codec_runtime.Decode.t

val write_requestMethod :  requestMethod Atdgen_codec_runtime.Encode.t

val read_batchResult :  batchResult Atdgen_codec_runtime.Decode.t

val write_batchResult :  batchResult Atdgen_codec_runtime.Encode.t

val read_batchResults :  batchResults Atdgen_codec_runtime.Decode.t

val write_batchResults :  batchResults Atdgen_codec_runtime.Encode.t

val read_batchRequest :  batchRequest Atdgen_codec_runtime.Decode.t

val write_batchRequest :  batchRequest Atdgen_codec_runtime.Encode.t

val read_batchInput :  batchInput Atdgen_codec_runtime.Decode.t

val write_batchInput :  batchInput Atdgen_codec_runtime.Encode.t

