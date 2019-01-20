function build {
  # Generate type definitions
  atdgen -t atd/$1.atd -o gen/$1
  # Generate JSON functions
  atdgen -bs atd/$1.atd -o gen/$1
}

# function convert_to_reason_syntax {
#   yarn bsrefmt $1 >
# }

# Build .ml and .mli files from .atd files
cd src
build eventbrite
build event
build config
build ipapi

yarn build
