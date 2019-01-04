# Feihong's Atdgen Quickstart

A more fleshed-out example than the one presented in [this blog post](https://tech.ahrefs.com/getting-started-with-atdgen-and-bucklescript-1f3a14004081).

## Prerequisites

    brew install opam
    # Initialise the opam state, but don't setup any compiler switch yet
    opam init --bare
    # Create a switch in the current directory that uses version 4.07.1 of the OCaml compiler. Answer yes to all yes/no questions without prompting.
    opam switch create . 4.07.1 --yes

Note: Run `opam switch list-available` to get a list of all available compiler versions.
