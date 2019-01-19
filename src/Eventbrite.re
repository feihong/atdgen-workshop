open Prelude;
module ExternalId = Wrap.ExternalId;

let fetchSource = (latitude, longitude) => {
  let filename = "eventbrite.json";
  let url =
    "https://www.eventbriteapi.com/v3/events/search?"
    ++ {
         Eventbrite_t.latitude,
         longitude,
         within: "1mi",
         expand: "organizer,venue",
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
    ->then_(json => json->Eventbrite_bs.read_searchOutput->resolve)
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
      let a = venue.address;
      {
        address1: a.address_1,
        address2: a.address_2,
        city: a.city,
        region: a.region,
        postalCode: a.postal_code,
      };
    },
  },
};

let fetch = (latitude, longitude) => {
  JsPromise.(
    fetchSource(latitude, longitude)
    ->then_(results => results.events->List.map(convert)->resolve)
  );
};
