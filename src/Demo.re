[%bs.raw {|require('isomorphic-fetch')|}];
open Prelude;

let secrets =
  Node.Fs.readFileAsUtf8Sync("./secrets.json")
  ->Js.Json.parseExn
  ->Config_bs.read_secrets;

let queryString =
  {
    "token": secrets.eventbriteToken,
    "location.address": "2100 S Wentworth Ave, Chicago, IL 60616",
    "location.within": "1mi",
    "sort_by": "date",
  }
  ->Utils.makeQueryString;

let url = "https://www.eventbriteapi.com/v3/events/search?" ++ queryString;
Js.log(url);
Js.Promise.(
  Fetch.fetch(url)
  |> then_(Fetch.Response.text)
  |> then_(json => {
       /* Js.log(json); */
       Node.Fs.writeFileAsUtf8Sync("sample.json", json);
       resolve();
     })
);
