/* Auto-generated from "config.atd" */
[@ocaml.warning "-27-32-35-39"];

type secrets = Config_t.secrets = {eventbriteToken: string};

let read_secrets: Atdgen_codec_runtime.Decode.t(secrets);

let write_secrets: Atdgen_codec_runtime.Encode.t(secrets);
