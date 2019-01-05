(* Auto-generated from "eventbrite.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type pagination = {
  object_count: int;
  page_number: int;
  page_size: int;
  page_count: int;
  continuation: string
}

type event = { name: string; description: string; url: string }
