(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type textHtml = { text: string; html: string }

type pagination = {
  object_count: int;
  page_number: int;
  page_size: int;
  page_count: int;
  has_more_items: bool
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
  venue_id: string
}

type events = event list

type searchResult = { pagination: pagination; events: events }

type requestMethod =  Get | Post 

type batchResult = { body: string; code: int }

type batchResults = batchResult list

type batchRequest = { method_: requestMethod; relative_url: string }

type batchInput = batchRequest list
