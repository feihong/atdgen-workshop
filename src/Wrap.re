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
