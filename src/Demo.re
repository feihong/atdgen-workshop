let secrets =
  Node.Fs.readFileAsUtf8Sync("./secrets.json")
  ->Js.Json.parseExn
  ->Config_bs.read_secrets;
secrets.eventbriteToken->Js.log;
