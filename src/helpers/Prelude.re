module RemoteData = BsRemotedata.RemoteData;

module Console = Js.Console;

module RR = ReasonReact;

module FutureFetch = {
  let errorTransformer = err => `NetworkError(Js.String.make(err));

  let fetch = url =>
    Fetch.fetch(url)->FutureJs.fromPromise(errorTransformer);

  let fetchWithInit = (url, init) =>
    Fetch.fetchWithInit(url, init)->FutureJs.fromPromise(errorTransformer);

  let json = response =>
    response
    ->Fetch.Response.json
    ->FutureJs.fromPromise(err => `ParseError(Js.String.make(err)));
};

module Fs = {
  include Node.Fs;

  type stats = {
    .
    "size": int,
    "mtime": Js.Date.t,
    "ctime": Js.Date.t,
  };

  [@bs.module "fs"] external statSync: string => stats = "";
};

module Date = {
  include Js.Date;

  let compare: (t, t) => int = [%bs.raw {|(a, b) => a - b|}];
};

module QueryString = {
  module U = URLSearchParamsRe;

  [@bs.module "url"] [@bs.new]
  external makeWithJson: Js.Json.t => U.t = "URLSearchParams";

  let make = json => json->makeWithJson->U.toString;
};

module Utils = {
  let s = RR.string;

  let decode = (json, decoder) =>
    switch (json->decoder) {
    | exception err => Result.Error(`ParseError(Js.String.make(err)))
    | output => Result.Ok(output)
    };

  /* return true if given file exists and less than 6 hours old */
  let isCached = filename =>
    !Fs.existsSync(filename) ?
      false :
      {
        let mtime = Fs.statSync(filename)##mtime->Date.getTime;
        let delta = Date.now() -. mtime;
        delta < 6. *. 3600. *. 1000.;
      };

  let writeCacheFile = (~filename, json) => {
    let text = json->Js.Json.stringifyWithSpace(2);
    Fs.writeFileAsUtf8Sync(filename, text);
  };
};
