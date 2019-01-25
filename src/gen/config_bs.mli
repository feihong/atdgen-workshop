(* Auto-generated from "config.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type secrets = Config_t.secrets = { eventbriteToken: string }

val read_secrets :  secrets Atdgen_codec_runtime.Decode.t

val write_secrets :  secrets Atdgen_codec_runtime.Encode.t

