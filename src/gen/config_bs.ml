(* Auto-generated from "config.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type secrets = Config_t.secrets = { eventbriteToken: string }

type config = Config_t.config = {
  keywords: string list;
  facebookPages: string list;
  eventbriteLocation: string
}

let write_secrets = (
  Atdgen_codec_runtime.Encode.make (fun (t : secrets) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"eventbriteToken"
          t.eventbriteToken
      ]
    )
  )
)
let read_secrets = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          eventbriteToken =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "eventbriteToken"
            ) json;
      } : secrets)
    )
  )
)
let write__1 = (
  Atdgen_codec_runtime.Encode.list (
    Atdgen_codec_runtime.Encode.string
  )
)
let read__1 = (
  Atdgen_codec_runtime.Decode.list (
    Atdgen_codec_runtime.Decode.string
  )
)
let write_config = (
  Atdgen_codec_runtime.Encode.make (fun (t : config) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__1
            )
          ~name:"keywords"
          t.keywords
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__1
            )
          ~name:"facebookPages"
          t.facebookPages
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"eventbriteLocation"
          t.eventbriteLocation
      ]
    )
  )
)
let read_config = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          keywords =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.field "keywords"
            ) json;
          facebookPages =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.field "facebookPages"
            ) json;
          eventbriteLocation =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "eventbriteLocation"
            ) json;
      } : config)
    )
  )
)
