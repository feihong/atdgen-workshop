/* Auto-generated from "event.atd" */
[@ocaml.warning "-27-32-35-39"];

type address =
  Event_t.address = {
    address1: string,
    address2: option(string),
    city: option(string),
    region: option(string),
    postalCode: option(string),
  };

type venue =
  Event_t.venue = {
    name: option(string),
    address,
  };

type organizer =
  Event_t.organizer = {
    name: string,
    url: string,
    description: option(string),
  };

type datetime = Event_t.datetime;

type event =
  Event_t.event = {
    externalId: Wrap.ExternalId.t,
    name: string,
    description: string,
    url: string,
    start: datetime,
    end_: option(datetime),
    isSeries: bool,
    venue,
    organizer,
  };

type events = Event_t.events;

let write__5 =
  Atdgen_codec_runtime.Encode.nullable(Atdgen_codec_runtime.Encode.string);
let read__5 =
  Atdgen_codec_runtime.Decode.nullable(Atdgen_codec_runtime.Decode.string);
let write_address =
  Atdgen_codec_runtime.Encode.make((t: address) =>
    Atdgen_codec_runtime.Encode.obj([
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.string,
        ~name="address1",
        t.address1,
      ),
      Atdgen_codec_runtime.Encode.field(
        write__5,
        ~name="address2",
        t.address2,
      ),
      Atdgen_codec_runtime.Encode.field(write__5, ~name="city", t.city),
      Atdgen_codec_runtime.Encode.field(write__5, ~name="region", t.region),
      Atdgen_codec_runtime.Encode.field(
        write__5,
        ~name="postalCode",
        t.postalCode,
      ),
    ])
  );
let read_address =
  Atdgen_codec_runtime.Decode.make((json) =>
    (
      {
        address1:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.string
            |> Atdgen_codec_runtime.Decode.field("address1"),
            json,
          ),
        address2:
          Atdgen_codec_runtime.Decode.decode(
            read__5 |> Atdgen_codec_runtime.Decode.field("address2"),
            json,
          ),
        city:
          Atdgen_codec_runtime.Decode.decode(
            read__5 |> Atdgen_codec_runtime.Decode.field("city"),
            json,
          ),
        region:
          Atdgen_codec_runtime.Decode.decode(
            read__5 |> Atdgen_codec_runtime.Decode.field("region"),
            json,
          ),
        postalCode:
          Atdgen_codec_runtime.Decode.decode(
            read__5 |> Atdgen_codec_runtime.Decode.field("postalCode"),
            json,
          ),
      }: address
    )
  );
let write_venue =
  Atdgen_codec_runtime.Encode.make((t: venue) =>
    Atdgen_codec_runtime.Encode.obj([
      Atdgen_codec_runtime.Encode.field(write__5, ~name="name", t.name),
      Atdgen_codec_runtime.Encode.field(
        write_address,
        ~name="address",
        t.address,
      ),
    ])
  );
let read_venue =
  Atdgen_codec_runtime.Decode.make((json) =>
    (
      {
        name:
          Atdgen_codec_runtime.Decode.decode(
            read__5 |> Atdgen_codec_runtime.Decode.field("name"),
            json,
          ),
        address:
          Atdgen_codec_runtime.Decode.decode(
            read_address |> Atdgen_codec_runtime.Decode.field("address"),
            json,
          ),
      }: venue
    )
  );
let write_organizer =
  Atdgen_codec_runtime.Encode.make((t: organizer) =>
    Atdgen_codec_runtime.Encode.obj([
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.string,
        ~name="name",
        t.name,
      ),
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.string,
        ~name="url",
        t.url,
      ),
      Atdgen_codec_runtime.Encode.field(
        write__5,
        ~name="description",
        t.description,
      ),
    ])
  );
let read_organizer =
  Atdgen_codec_runtime.Decode.make((json) =>
    (
      {
        name:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.string
            |> Atdgen_codec_runtime.Decode.field("name"),
            json,
          ),
        url:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.string
            |> Atdgen_codec_runtime.Decode.field("url"),
            json,
          ),
        description:
          Atdgen_codec_runtime.Decode.decode(
            read__5 |> Atdgen_codec_runtime.Decode.field("description"),
            json,
          ),
      }: organizer
    )
  );
let write__1 =
  Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap(Wrap.Datetime.unwrap);
let read__1 =
  Atdgen_codec_runtime.Decode.string
  |> Atdgen_codec_runtime.Decode.map(Wrap.Datetime.wrap);
let write_datetime = write__1;
let read_datetime = read__1;
let write__3 = Atdgen_codec_runtime.Encode.nullable(write_datetime);
let read__3 = Atdgen_codec_runtime.Decode.nullable(read_datetime);
let write__2 =
  Atdgen_codec_runtime.Encode.string
  |> Atdgen_codec_runtime.Encode.contramap(Wrap.ExternalId.unwrap);
let read__2 =
  Atdgen_codec_runtime.Decode.string
  |> Atdgen_codec_runtime.Decode.map(Wrap.ExternalId.wrap);
let write_event =
  Atdgen_codec_runtime.Encode.make((t: event) =>
    Atdgen_codec_runtime.Encode.obj([
      Atdgen_codec_runtime.Encode.field(
        write__2,
        ~name="externalId",
        t.externalId,
      ),
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.string,
        ~name="name",
        t.name,
      ),
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.string,
        ~name="description",
        t.description,
      ),
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.string,
        ~name="url",
        t.url,
      ),
      Atdgen_codec_runtime.Encode.field(
        write_datetime,
        ~name="start",
        t.start,
      ),
      Atdgen_codec_runtime.Encode.field(write__3, ~name="end", t.end_),
      Atdgen_codec_runtime.Encode.field(
        Atdgen_codec_runtime.Encode.bool,
        ~name="isSeries",
        t.isSeries,
      ),
      Atdgen_codec_runtime.Encode.field(write_venue, ~name="venue", t.venue),
      Atdgen_codec_runtime.Encode.field(
        write_organizer,
        ~name="organizer",
        t.organizer,
      ),
    ])
  );
let read_event =
  Atdgen_codec_runtime.Decode.make((json) =>
    (
      {
        externalId:
          Atdgen_codec_runtime.Decode.decode(
            read__2 |> Atdgen_codec_runtime.Decode.field("externalId"),
            json,
          ),
        name:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.string
            |> Atdgen_codec_runtime.Decode.field("name"),
            json,
          ),
        description:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.string
            |> Atdgen_codec_runtime.Decode.field("description"),
            json,
          ),
        url:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.string
            |> Atdgen_codec_runtime.Decode.field("url"),
            json,
          ),
        start:
          Atdgen_codec_runtime.Decode.decode(
            read_datetime |> Atdgen_codec_runtime.Decode.field("start"),
            json,
          ),
        end_:
          Atdgen_codec_runtime.Decode.decode(
            read__3 |> Atdgen_codec_runtime.Decode.field("end"),
            json,
          ),
        isSeries:
          Atdgen_codec_runtime.Decode.decode(
            Atdgen_codec_runtime.Decode.bool
            |> Atdgen_codec_runtime.Decode.field("isSeries"),
            json,
          ),
        venue:
          Atdgen_codec_runtime.Decode.decode(
            read_venue |> Atdgen_codec_runtime.Decode.field("venue"),
            json,
          ),
        organizer:
          Atdgen_codec_runtime.Decode.decode(
            read_organizer |> Atdgen_codec_runtime.Decode.field("organizer"),
            json,
          ),
      }: event
    )
  );
let write__4 = Atdgen_codec_runtime.Encode.list(write_event);
let read__4 = Atdgen_codec_runtime.Decode.list(read_event);
let write_events = write__4;
let read_events = read__4;
