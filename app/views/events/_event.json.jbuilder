json.id event.id
json.start event.start
json.end event.end
json.title event.name[0..8] + (event.name.length > 8 ? '…' : '')
json.url event_url(event)
