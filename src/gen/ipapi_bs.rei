/* Auto-generated from "ipapi.atd" */
[@ocaml.warning "-27-32-35-39"];

type result =
  Ipapi_t.result = {
    country: string,
    region: string,
    city: string,
    lat: float,
    lon: float,
  };

let read_result: Atdgen_codec_runtime.Decode.t(result);

let write_result: Atdgen_codec_runtime.Encode.t(result);
