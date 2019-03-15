# Feihong's Atdgen Workshop

This is the repo for a workshop that guides you through creating a simple "events near you" app using ReasonML. Since we are creating a complete app, we will cover a good number of topics, but there is a particular emphasis on [atd and atdgen](https://atd.readthedocs.io/). Atd is a DSL for defining types, and atdgen is a command line tool that takes atd type definitions and generates serialization boilerplate for them. Never write JSON encoders and decoders by hand again!

Other topics covered by this workshop:

- Write JSON decoder by hand
- Use a prelude
- Invoke BuckleScript-generated functions from JS
- Turn on warnings as errors
- Wrap types in atd
- Create bindings to Node APIs
- Make requests using bs-fetch
- Set up parcel with hot module reloading
- Functors

## Prerequisites

We assume that you are using a Unix operating system, and have [yarn installed](https://yarnpkg.com/lang/en/docs/install/).

Install esy

    npm install -g esy

Create the following `esy.json` configuration file in the project root folder:

```json
{
  "dependencies": {
    "@opam/atd": "*",
    "@opam/atdgen": "*"
  },
  "resolutions": {
    "@opam/atd": "github:mjambon/atd:atd.opam#8089d9e",
    "@opam/atdgen": "github:mjambon/atd:atdgen.opam#8089d9e"
  },
  "devDependencies": {
    "ocaml": "~4.7.1"
  }
}
```

Install atdgen

    esy install && esy build

Install BuckleScript

    yarn init

    # Install bs-platform
    yarn add bs-platform --dev

    # Add runtime to be used by generated code
    yarn add @ahrefs/bs-atdgen-codec-runtime

## Suggested approach

1. Create an Eventbrite account and [get your API key](https://www.eventbrite.com/platform/api-keys/). Put your API key in a file called `api-key.txt`.
1. Write a function that gets your location by fetching from `http://ip-api.com/json/`. Use `bs-json` to decode the JSON response. The function should return a Promise that wraps a record of this type:
   ```reason
   type result = {
      country: string,
      region: string,
      city: string,
      lat: float,
      lon: float,
   };
   ```
1. Now use atd to generate the decoder for you. You will likely need to refer to the [documentation](https://atd.readthedocs.io/en/latest/) at some point.
1. With coordinates in hand, you can now query for local events using the [Eventbrite search events endpoint](https://www.eventbrite.com/platform/api#/reference/event-search/search-events). Remember to include the include your API key in the request, either in the header or the `token` query string parameter. You will likely want to dump the JSON to a file so that you can use it to write the atd file. Note that you can use atd to encode your query string as well. Here are the fields you'll need to include in the query string:
   ```reason
   // Not the exact names expected by API, use atd to generate proper names
   {
     latitude,
     longitude,
     within: "1mi",
     expand: "organizer,venue",
     sort_by: "date",
     page,
   }
   ```
1. It might be a good idea to cache the JSON file to disk so you don't have to wait for the fetch to complete over the network.
1. If you haven't already, modify your Eventbrite fetch function to fetch all pages and return a Promise that wraps a list of event records.
1. The Eventbrite schema is pretty unwieldy, so create a canonical event schema that is easier to work with. Write a fetch function that queries the Eventbrite API but returns event records in your own format.
1. Create a simple express server that returns events at the `/events/` route. You don't have to use Reason for  this.
1. Write a simple frontend using ReasonReact that displays all the events you fetched.

## Commands

Run program

    yarn main

Install JS dependencies as well as atd binaries

    yarn install

Generate OCaml source files from .atd definitions and build

    yarn gen

Build .re and .ml files

    yarn build

## Links

[Atdgen BuckleScript support blog post](https://tech.ahrefs.com/getting-started-with-atdgen-and-bucklescript-1f3a14004081)
