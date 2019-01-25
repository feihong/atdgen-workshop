open Prelude;

let {Config_t.eventbriteToken} =
  try (
    Fs.readFileAsUtf8Sync("./secrets.json")
    ->Js.Json.parseExn
    ->Config_bs.read_secrets
  ) {
  | _ => {eventbriteToken: ""}
  };
