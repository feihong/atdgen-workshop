open Prelude;

let fetch = (latitude, longitude) => {
  let filename = "eventbrite.json";
  let url =
    "https://www.eventbriteapi.com/v3/events/search?"
    ++ {
         "location.latitude": latitude,
         "location.longitude": longitude,
         "location.within": "1mi",
         "expand": "organizer,venue",
       }
       ->Utils.makeQueryString;

  JsPromise.(
    (
      if (Utils.isCached(filename)) {
        NodeFs.readFileAsUtf8Sync(filename)->Js.Json.parseExn->resolve;
      } else {
        Fetch.fetchWithInit(
          url,
          Fetch.RequestInit.make(
            ~method_=Fetch.Post,
            ~headers=Fetch.HeadersInit.make({"Authorization": "Bearer " ++ Config.eventbriteToken}),
            (),
          )
        )
        ->then_(Fetch.Response.json)
        ->then_(Utils.writeCacheFile(filename))
      }
    )
    ->then_(json => json->Eventbrite_bs.read_searchResult->resolve)
  );
};
