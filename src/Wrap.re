module type MakeIdType =
  () => {
         type t;
         let wrap: string => t;
         let unwrap: t => string;
       };

module MakeId: MakeIdType =
  (()) => {
    type t = string;
    let wrap = x => x;
    let unwrap = x => x;
  };

module EventId =
  MakeId({});

module VenueId =
  MakeId({});

module OrganizerId =
  MakeId({});

module Datetime = {
  type t = Js.Date.t;
  let wrap = Js.Date.fromString;
  let unwrap = Js.Date.toUTCString;
}

module ExternalId = {
  type t = {
    source: string,
    id: string,
  };
  let wrap = s =>
    switch (s->Js.String.split(":", _)) {
    | [|source, id|] => {source, id}
    | _ => failwith("external id has incorrect format: " ++ s)
    };
  let unwrap = ({source, id}) => source ++ ":" ++ id;
}
