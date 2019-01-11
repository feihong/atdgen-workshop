open Prelude;

let {Config_t.eventbriteToken} =
  try (
    NodeFs.readFileAsUtf8Sync("./secrets.json")
    ->Js.Json.parseExn
    ->Config_bs.read_secrets
  ) {
  | _ => {eventbriteToken: ""}
  };
