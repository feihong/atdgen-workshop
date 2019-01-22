/* Auto-generated from "event.atd" */
[@ocaml.warning "-27-32-35-39"];

type address = {
  address1: string,
  address2: option(string),
  city: option(string),
  region: option(string),
  postalCode: option(string),
};

type venue = {
  name: option(string),
  address,
};

type organizer = {
  name: string,
  url: string,
  description: option(string),
};

type datetime = Wrap.Datetime.t;

type event = {
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

type events = list(event);
