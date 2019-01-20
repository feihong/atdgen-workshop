const Server = require('./src/Server.bs.js')
const Event_bs = require('./src/gen/event_bs.bs.js')

async function main() {
  let events = await Server.fetch()
  // console.log(events)
  console.log(Event_bs.write_events(events))
}

main()
