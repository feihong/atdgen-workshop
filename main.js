const Events = require('./src/Events.bs.js')
const Event_bs = require('./src/gen/event_bs.bs.js')

async function main() {
  let output = await Events.fetchAsPromise()
  // console.log(output)
  let jsOutput = Event_bs.write_eventOutput(output)
  console.log(jsOutput)
}

main()
