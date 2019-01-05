open Belt;

module Utils = {
  let makeQueryString = params => UrlSearchParams.(make(params)->toString);
};
