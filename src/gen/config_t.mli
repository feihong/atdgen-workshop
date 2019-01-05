(* Auto-generated from "config.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type secrets = { eventbriteToken: string; facebookToken: string }

type config = {
  keywords: string list;
  facebookPages: string list;
  eventbriteLocation: string
}
