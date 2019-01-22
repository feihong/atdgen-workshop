/* Auto-generated from "eventbrite.atd" */
[@ocaml.warning "-27-32-35-39"];

type address =
  Eventbrite_t.address = {
    address_1: string,
    address_2: option(string),
    city: option(string),
    region: option(string),
    postal_code: option(string),
  };

type venue =
  Eventbrite_t.venue = {
    id: Wrap.VenueId.t,
    name: option(string),
    address,
  };

type textHtmlNullable =
  Eventbrite_t.textHtmlNullable = {
    text: option(string),
    html: option(string),
  };

type textHtml =
  Eventbrite_t.textHtml = {
    text: string,
    html: string,
  };

type pagination =
  Eventbrite_t.pagination = {
    object_count: int,
    page_number: int,
    page_size: int,
    page_count: int,
    has_more_items: bool,
  };

type organizer =
  Eventbrite_t.organizer = {
    id: Wrap.OrganizerId.t,
    name: option(string),
    description: textHtmlNullable,
    url: string,
  };

type datetime =
  Eventbrite_t.datetime = {
    timezone: string,
    local: string,
    utc: Wrap.Datetime.t,
  };

type event =
  Eventbrite_t.event = {
    id: Wrap.EventId.t,
    name: textHtml,
    description: textHtml,
    url: string,
    start: datetime,
    end_: datetime,
    is_series: bool,
    online_event: bool,
    venue,
    organizer,
  };

type events = Eventbrite_t.events;

type searchOutput =
  Eventbrite_t.searchOutput = {
    pagination,
    events,
  };

type searchInput =
  Eventbrite_t.searchInput = {
    latitude: float,
    longitude: float,
    within: string,
    expand: string,
    page: int,
    sort_by: string,
  };

let read_address: Atdgen_codec_runtime.Decode.t(address);

let write_address: Atdgen_codec_runtime.Encode.t(address);

let read_venue: Atdgen_codec_runtime.Decode.t(venue);

let write_venue: Atdgen_codec_runtime.Encode.t(venue);

let read_textHtmlNullable: Atdgen_codec_runtime.Decode.t(textHtmlNullable);

let write_textHtmlNullable: Atdgen_codec_runtime.Encode.t(textHtmlNullable);

let read_textHtml: Atdgen_codec_runtime.Decode.t(textHtml);

let write_textHtml: Atdgen_codec_runtime.Encode.t(textHtml);

let read_pagination: Atdgen_codec_runtime.Decode.t(pagination);

let write_pagination: Atdgen_codec_runtime.Encode.t(pagination);

let read_organizer: Atdgen_codec_runtime.Decode.t(organizer);

let write_organizer: Atdgen_codec_runtime.Encode.t(organizer);

let read_datetime: Atdgen_codec_runtime.Decode.t(datetime);

let write_datetime: Atdgen_codec_runtime.Encode.t(datetime);

let read_event: Atdgen_codec_runtime.Decode.t(event);

let write_event: Atdgen_codec_runtime.Encode.t(event);

let read_events: Atdgen_codec_runtime.Decode.t(events);

let write_events: Atdgen_codec_runtime.Encode.t(events);

let read_searchOutput: Atdgen_codec_runtime.Decode.t(searchOutput);

let write_searchOutput: Atdgen_codec_runtime.Encode.t(searchOutput);

let read_searchInput: Atdgen_codec_runtime.Decode.t(searchInput);

let write_searchInput: Atdgen_codec_runtime.Encode.t(searchInput);
