function build {
  atdgen -t atd/$1.atd -o gen/$1
  atdgen -bs atd/$1.atd -o gen/$1
}

cd src
build eventbrite
build config
