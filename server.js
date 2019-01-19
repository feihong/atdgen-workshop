const Bundler = require('parcel-bundler')
const app = require('express')()

const bundler = new Bundler('index.html', {})

app.use(bundler.middleware())

const listener = app.listen(8000, () => {
  console.log('Serving at http://localhost:' + listener.address().port)
})
