include Belt;

module Utils = {
  let makeQueryString = params => UrlSearchParams.(make(params)->toString);
};

module JsPromise = {
  include Js.Promise;

  [@bs.send] external then_: (t('a), 'a => t('b)) => t('b) = "then";

  [@bs.send] external catch: (t('a), error => t('a)) => t('a) = "";

  /* Modeled after Bluebird's Promise.reduce */
  let rec reduce = (lst, acc, fn) =>
    switch (lst) {
    | [] => resolve(acc)
    | [head, ...rest] =>
      fn(acc, head)->then_(newAcc => reduce(rest, newAcc, fn))
    };
};

module NodeFs = {
  include Node.Fs;

  type stats = Js.t({
    .
    size: int,
    mtime: Js.Date.t,
    ctime: Js.Date.t,
  });

  [@bs.module "fs"] external statSync: string => stats = "";
};
