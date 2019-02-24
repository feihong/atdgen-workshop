(* Auto-generated from "event.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type address = {
  address1: string option;
  address2: string option;
  city: string option;
  region: string option;
  postalCode: string option
}

type venue = { name: string option; address: address }

type ('a, 'b) result = ('a, 'b) Belt.Result.t =  Ok of 'a | Error of 'b 

type organizer = { name: string; url: string; description: string option }

type datetime = Wrap.Datetime.t

type event = {
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

type events = event list

type error = [
    `NotAuthorized of string
  | `NetworkError of string
  | `UnknownError of string
  | `ParseError of string
]

type eventOutput = (events, error) result
