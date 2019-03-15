function build {
  input="${1%.*}"
  base=$(basename $input)

  # Generate type definitions
  esy x atdgen -t $1
  # Generate JSON functions
  esy x atdgen -bs $1
  # Move to gen folder
  mv ${input}_t.mli src/gen/
  mv ${input}_t.ml src/gen/
  mv ${input}_bs.mli src/gen/
  mv ${input}_bs.ml src/gen/
}

# Build source files from .atd files
for file in src/atd/*.atd
do
  build $file
done

yarn build
