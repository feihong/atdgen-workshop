open Prelude;
open Printf;
module ExternalId = Wrap.ExternalId;

let rec fetchSource = (latitude, longitude, page, acc) => {
  let filename = sprintf("eventbrite-%d.json", page);
  let url =
    "https://www.eventbriteapi.com/v3/events/search?"
    ++ {
         Eventbrite_t.latitude,
         longitude,
         within: "1mi",
         expand: "organizer,venue",
         sort_by: "date",
         page,
       }
       ->Eventbrite_bs.write_searchInput
       ->Utils.makeQueryString;
  JsPromise.(
    Fetch.fetchWithInit(
      url,
      Fetch.RequestInit.make(
        ~method_=Fetch.Post,
        ~headers=
          Fetch.HeadersInit.make({
            "Authorization": "Bearer " ++ Config.eventbriteToken,
          }),
        (),
      ),
    )
    ->then_(Fetch.Response.json)
    ->then_(Utils.writeCacheFile(~filename))
    ->then_(json => {
        let output = json->Eventbrite_bs.read_searchOutput;
        let newAcc = [output.events, ...acc];
        output.pagination.has_more_items ?
          fetchSource(latitude, longitude, page + 1, newAcc) :
          newAcc->List.flatten->resolve;
      })
  );
};

let convert =
    (
      {
        Eventbrite_t.id,
        name,
        description,
        url,
        start,
        end_,
        is_series,
        organizer,
        venue,
      },
    ) => {
  Event_t.externalId: {
    ExternalId.source: "eventbrite",
    id: id->Wrap.EventId.unwrap,
  },
  name: name.text,
  description: description.text,
  url,
  start: start.utc,
  end_: Some(end_.utc),
  isSeries: is_series,
  organizer: {
    name: organizer.name->Option.getWithDefault("N/A"),
    description: organizer.description.text,
    url: organizer.url,
  },
  venue: {
    name: venue.name,
    address: {
      let {Eventbrite_t.city, region, postal_code, address_1, address_2} =
        venue.address;
      {
        address1: address_1,
        address2: address_2,
        city,
        region,
        postalCode: postal_code,
      };
    },
  },
};

let fetch = (latitude, longitude) => {
  JsPromise.(
    fetchSource(latitude, longitude, 1, [])
    ->then_(events => events->List.map(convert)->resolve)
  );
};
