# Feihong's Atdgen Workshop

This is the repo for a workshop that guides you through creating a simple "events near you" app using ReasonML. Since we are creating a complete app, we will cover a good number of topics, but there is a particular emphasis on [atd and atdgen](https://atd.readthedocs.io/). Atd is a DSL for defining types, and atdgen is a command line tool that takes atd type definitions and generates serialization boilerplate for them. Never write JSON encoders and decoders by hand again!

Other topics covered by this workshop:

- Use a prelude
- Invoke BuckleScript-generated functions from JS
- Turn on warnings as errors
- Wrap types in atd
- Write JSON decoder by hand
- Create bindings to Node APIs
- Make requests using bs-fetch
- Set up parcel with hot module reloading
- Functors

## Prerequisites

We assume that you are using a Unix operating system, and have [yarn installed](https://yarnpkg.com/lang/en/docs/install/).

Install opam and OCaml switch

    brew install opam

    # Initialise the opam state, but don't setup any compiler switch yet
    opam init --bare --shell-hook --enable-completion --enable-shell-hook

    # Create a switch in the current directory that uses version 4.07.1 of the OCaml compiler. Answer yes to all yes/no questions without prompting.
    opam switch create . 4.07.1 --yes

    # Install atd and atdgen from master instead of using official release.
    opam pin add atd --dev-repo --yes
    opam pin add atdgen --dev-repo --yes

Note: Run `opam switch list-available` to get a list of all available compiler versions. The `opam switch create` command tends to take a long time.

Install BuckleScript

    yarn init

    # Install bs-platform
    yarn add bs-platform --dev

    # Add runtime to be used by generated code
    yarn add @ahrefs/bs-atdgen-codec-runtime

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
