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

let filename = "results.json";

if (Node.Fs.existsSync(filename)) {
  let result =
    Node.Fs.readFileAsUtf8Sync(filename)
    ->Js.Json.parseExn
    ->Eventbrite_bs.read_result;
  Js.log(result.events->List.toArray);
} else {
  Js.Promise.(
    Fetch.fetch(url)
    |> then_(Fetch.Response.json)
    |> then_(json => {
         let text = json->Js.Json.stringifyWithSpace(2);
         Node.Fs.writeFileAsUtf8Sync(filename, text);
         resolve();
       })
  )
  ->ignore;
};
