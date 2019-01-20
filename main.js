const Server = require('./src/Server.bs.js')
const Event_bs = require('./src/gen/event_bs.bs.js')

async function main() {
  let eventRecords = await Server.fetch()
  // console.log(eventRecords)
  let events = Event_bs.write_events(eventRecords)
  console.log(events)
  console.log("\nNumber of events:", events.length)
}

main()
