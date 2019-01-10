(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type address = {
  address_1: string;
  address_2: string option;
  city: string option;
  region: string option;
  postal_code: string option
}

type venue = { id: Wrap.VenueId.t; name: string option; address: address }

type textHtml = { text: string option; html: string option }

type pagination = {
  object_count: int;
  page_number: int;
  page_size: int;
  page_count: int;
  has_more_items: bool
}

type organizer = {
  id: Wrap.OrganizerId.t;
  name: string;
  description: textHtml;
  url: string
}

type datetime = { timezone: string; local: string; utc: Wrap.Datetime.t }

type event = {
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

type events = event list

type searchResult = { pagination: pagination; events: events }
