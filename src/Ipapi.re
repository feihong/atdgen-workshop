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
  "http://ip-api.com/json/"
  ->FutureFetch.fetch
  ->Future.flatMapOk(FutureFetch.json)
  ->Future.mapOk(json => json->Ipapi_bs.read_result);
};

let mockFetch = () => {
  {
    Ipapi_t.city: "Chicago",
    region: "IL",
    country: "USA",
    lat: 41.972441,
    lon: (-87.659131),
  }
  ->Result.Ok
  ->Future.value;
};
