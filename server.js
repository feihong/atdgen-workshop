const Bundler = require('parcel-bundler')
const Events = require('./src/Events.bs.js')
const Event_bs = require('./src/gen/event_bs.bs.js')

const app = require('express')()
const bundler = new Bundler('index.html', {})

app.get('/events/', async (req, res) => {
  let output = await Events.fetch()
  res.status(200).json(Event_bs.write_eventOutput(output))
})

app.use(bundler.middleware())

const listener = app.listen(8000, () => {
  console.log('Serving at http://localhost:' + listener.address().port)
})
