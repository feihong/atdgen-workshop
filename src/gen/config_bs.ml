(* Auto-generated from "config.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type secrets = Config_t.secrets = { eventbriteToken: string }

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
