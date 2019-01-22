/* Auto-generated from "event.atd" */
[@ocaml.warning "-27-32-35-39"];

type address =
  Event_t.address = {
    address1: string,
    address2: option(string),
    city: option(string),
    region: option(string),
    postalCode: option(string),
  };

type venue =
  Event_t.venue = {
    name: option(string),
    address,
  };

type organizer =
  Event_t.organizer = {
    name: string,
    url: string,
    description: option(string),
  };

type datetime = Event_t.datetime;

type event =
  Event_t.event = {
    externalId: Wrap.ExternalId.t,
    name: string,
    description: string,
    url: string,
    start: datetime,
    end_: option(datetime),
    isSeries: bool,
    venue,
    organizer,
  };

type events = Event_t.events;

let read_address: Atdgen_codec_runtime.Decode.t(address);

let write_address: Atdgen_codec_runtime.Encode.t(address);

let read_venue: Atdgen_codec_runtime.Decode.t(venue);

let write_venue: Atdgen_codec_runtime.Encode.t(venue);

let read_organizer: Atdgen_codec_runtime.Decode.t(organizer);

let write_organizer: Atdgen_codec_runtime.Encode.t(organizer);

let read_datetime: Atdgen_codec_runtime.Decode.t(datetime);

let write_datetime: Atdgen_codec_runtime.Encode.t(datetime);

let read_event: Atdgen_codec_runtime.Decode.t(event);

let write_event: Atdgen_codec_runtime.Encode.t(event);

let read_events: Atdgen_codec_runtime.Decode.t(events);

let write_events: Atdgen_codec_runtime.Encode.t(events);
