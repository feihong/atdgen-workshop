function build {
  input="${1%.*}"
  base=$(basename $input)

  # Generate type definitions
  atdgen -t $1
  # Generate JSON functions
  atdgen -bs $1
  # Convert to reason syntax
  yarn bsrefmt --in-place ${input}_t.mli
  yarn bsrefmt --in-place ${input}_t.ml
  yarn bsrefmt --in-place ${input}_bs.mli
  yarn bsrefmt --in-place ${input}_bs.ml
  # Move to gen folder
  mv ${input}_t.mli src/gen/${base}_t.rei
  mv ${input}_t.ml src/gen/${base}_t.re
  mv ${input}_bs.mli src/gen/${base}_bs.rei
  mv ${input}_bs.ml src/gen/${base}_bs.re
}

# Build .ml and .mli files from .atd files
for file in src/atd/*.atd
do
  build $file
done

yarn build
