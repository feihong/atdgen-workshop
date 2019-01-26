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

val read_address :  address Atdgen_codec_runtime.Decode.t

val write_address :  address Atdgen_codec_runtime.Encode.t

val read_venue :  venue Atdgen_codec_runtime.Decode.t

val write_venue :  venue Atdgen_codec_runtime.Encode.t

val read_result : 'a Atdgen_codec_runtime.Decode.t -> 'b Atdgen_codec_runtime.Decode.t -> ('a, 'b) result Atdgen_codec_runtime.Decode.t

val write_result : 'a Atdgen_codec_runtime.Encode.t -> 'b Atdgen_codec_runtime.Encode.t -> ('a, 'b) result Atdgen_codec_runtime.Encode.t

val read_organizer :  organizer Atdgen_codec_runtime.Decode.t

val write_organizer :  organizer Atdgen_codec_runtime.Encode.t

val read_datetime :  datetime Atdgen_codec_runtime.Decode.t

val write_datetime :  datetime Atdgen_codec_runtime.Encode.t

val read_event :  event Atdgen_codec_runtime.Decode.t

val write_event :  event Atdgen_codec_runtime.Encode.t

val read_events :  events Atdgen_codec_runtime.Decode.t

val write_events :  events Atdgen_codec_runtime.Encode.t

val read_error :  error Atdgen_codec_runtime.Decode.t

val write_error :  error Atdgen_codec_runtime.Encode.t

val read_eventOutput :  eventOutput Atdgen_codec_runtime.Decode.t

val write_eventOutput :  eventOutput Atdgen_codec_runtime.Encode.t

