# Notes for Workshop Runner

Compile atdgen using js_of_ocaml:

```
git clone git@github.com:mjambon/atd.git
cd atd/
echo '{
  "dependencies": {
    "@opam/js_of_ocaml": "*",
    "@opam/dune": "*",
    "@opam/menhir": "*",
    "@opam/easy-format": "*",
    "@opam/re": "*"
  },
  "devDependencies": {
    "ocaml": "~4.7.1"
  }
}' > esy.json
esy install && esy build
esy x dune build atdgen/bin/ag_main.bc.js --profile=release
node _build/default/atdgen/bin/ag_main.bc.js --help
```
