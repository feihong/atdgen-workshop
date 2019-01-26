const Server = require('./src/Server.bs.js')
const Event_bs = require('./src/gen/event_bs.bs.js')

async function main() {
  let output = await Server.fetch()
  // console.log(output)
  let jsOutput = Event_bs.write_eventOutput(output)
  console.log(jsOutput)
}

main()
