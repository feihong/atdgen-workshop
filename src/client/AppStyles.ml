open Emotion

let container = [%css [
  maxWidth (`px 800);
  margin2 (`px 0) `auto;
]]

let showing = [%css [
  color (`hex "444")
]]

let events = [%css [
  paddingLeft (`rem 1.);
]]

let event = [%css [
  marginBottom (`rem 0.5)
]]

let eventName = [%css [
  marginRight (`rem 0.5)
]]

let eventDate = [%css [
  marginRight (`rem 0.5)
]]

let eventLocation = [%css [
  fontSize (`rem 0.8);
  color (`hex "888");
]]
