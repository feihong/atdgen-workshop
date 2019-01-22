/* Auto-generated from "eventbrite.atd" */
[@ocaml.warning "-27-32-35-39"];

type address = {
  address_1: string,
  address_2: option(string),
  city: option(string),
  region: option(string),
  postal_code: option(string),
};

type venue = {
  id: Wrap.VenueId.t,
  name: option(string),
  address,
};

type textHtmlNullable = {
  text: option(string),
  html: option(string),
};

type textHtml = {
  text: string,
  html: string,
};

type pagination = {
  object_count: int,
  page_number: int,
  page_size: int,
  page_count: int,
  has_more_items: bool,
};

type organizer = {
  id: Wrap.OrganizerId.t,
  name: option(string),
  description: textHtmlNullable,
  url: string,
};

type datetime = {
  timezone: string,
  local: string,
  utc: Wrap.Datetime.t,
};

type event = {
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

type events = list(event);

type searchOutput = {
  pagination,
  events,
};

type searchInput = {
  latitude: float,
  longitude: float,
  within: string,
  expand: string,
  page: int,
  sort_by: string,
};
