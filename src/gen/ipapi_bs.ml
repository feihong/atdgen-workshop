(* Auto-generated from "ipapi.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type result = Ipapi_t.result = {
  country: string;
  region: string;
  city: string;
  lat: float;
  lon: float
}

let write_result = (
  Atdgen_codec_runtime.Encode.make (fun (t : result) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"country"
          t.country
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"region"
          t.region
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"city"
          t.city
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.float
            )
          ~name:"lat"
          t.lat
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.float
            )
          ~name:"lon"
          t.lon
      ]
    )
  )
)
let read_result = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          country =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "country"
            ) json;
          region =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "region"
            ) json;
          city =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "city"
            ) json;
          lat =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.float
              |> Atdgen_codec_runtime.Decode.field "lat"
            ) json;
          lon =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.float
              |> Atdgen_codec_runtime.Decode.field "lon"
            ) json;
      } : result)
    )
  )
)
