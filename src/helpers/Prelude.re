include Belt;

module RR = ReasonReact;

module JsPromise = {
  include Js.Promise;

  [@bs.send] external then_: (t('a), 'a => t('b)) => t('b) = "then";

  [@bs.send] external catch: (t('a), error => t('a)) => t('a) = "";
};

module NodeFs = {
  include Node.Fs;

  type stats = {
    .
    "size": int,
    "mtime": Js.Date.t,
    "ctime": Js.Date.t,
  };

  [@bs.module "fs"] external statSync: string => stats = "";
};

module JsDate = {
  include Js.Date;

  let compare: (t, t) => int = [%bs.raw {|(a, b) => a - b|}];
};

module Utils = {
  let s = RR.string;

  let makeQueryString = params => UrlSearchParams.(make(params)->toString);

  /* return true if given file exists and less than 6 hours old */
  let isCached = filename =>
    !NodeFs.existsSync(filename) ?
      false :
      {
        let mtime = NodeFs.statSync(filename)##mtime->Js.Date.getTime;
        let delta = Js.Date.now() -. mtime;
        delta < 6. *. 3600. *. 1000.;
      };

  let writeCacheFile = (~filename, json) => {
    let text = json->Js.Json.stringifyWithSpace(2);
    NodeFs.writeFileAsUtf8Sync(filename, text);
    JsPromise.resolve(json);
  };

  let writeEventsToCacheFile = (~filename, events) => {
    events->Event_bs.write_events->writeCacheFile(~filename)->ignore;
    JsPromise.resolve(events);
  };
};
