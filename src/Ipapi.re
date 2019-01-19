open Prelude;

type result = {
  country: string,
  region: string,
  city: string,
  lat: float,
  lon: float,
};

/* This is just to show how you can use bs-json to decode JSON, but you should
   avoid writing decoders by hand */
let decode = json => {
  module D = Json.Decode;
  let field = D.field;
  {
    country: json |> field("country", D.string),
    region: json |> field("region", D.string),
    city: json |> field("city", D.string),
    lat: json |> field("lat", D.float),
    lon: json |> field("lon", D.float),
  };
};

let fetch = () => {
  let url = "http://ip-api.com/json/";
  JsPromise.(
    Fetch.fetch(url)
    ->then_(Fetch.Response.json)
    /* ->then_(json => json->decode->resolve) */
    ->then_(json => json->Ipapi_bs.read_result->resolve)
  );
};

let mockFetch = () => {
  {Ipapi_t.city: "Chicago", region: "IL", country: "USA", lat: 0., lon: 0.}
  ->JsPromise.resolve;
};
