ReactDOMRe.renderToElementWithId(<App />, "index");

/* Sets up hot module replacement using Parcel */
[%bs.raw {|(module.hot) ? module.hot.accept() : console.log('Not hot')|}];
