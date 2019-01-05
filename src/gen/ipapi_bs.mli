(* Auto-generated from "ipapi.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type result = Ipapi_t.result = {
  country: string;
  region: string;
  city: string;
  lat: float;
  lon: float
}

val read_result :  result Atdgen_codec_runtime.Decode.t

val write_result :  result Atdgen_codec_runtime.Encode.t

