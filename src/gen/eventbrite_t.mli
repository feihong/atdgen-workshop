(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type venue = { id: string; name: string; address: string }

type textHtml = { text: string; html: string }

type pagination = {
  object_count: int;
  page_number: int;
  page_size: int;
  page_count: int;
  has_more_items: bool
}

type organizer = {
  id: string;
  name: string;
  description: textHtml;
  url: string
}

type datetime = { timezone: string; local: string; utc: string }

type event = {
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

type events = event list

type searchResult = { pagination: pagination; events: events }
