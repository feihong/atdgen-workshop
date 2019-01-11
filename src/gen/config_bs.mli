(* Auto-generated from "config.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type secrets = Config_t.secrets = { eventbriteToken: string }

type config = Config_t.config = {
  keywords: string list;
  facebookPages: string list;
  eventbriteLocation: string
}

val read_secrets :  secrets Atdgen_codec_runtime.Decode.t

val write_secrets :  secrets Atdgen_codec_runtime.Encode.t

val read_config :  config Atdgen_codec_runtime.Decode.t

val write_config :  config Atdgen_codec_runtime.Encode.t

