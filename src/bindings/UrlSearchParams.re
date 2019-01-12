type t;

[@bs.module "url"] [@bs.new] external make: Js.Json.t => t = "URLSearchParams";

[@bs.send] external toString: t => string = "";
