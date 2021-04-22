# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p  = Post.create(title: "Registration test", short_description: "Used to test the participation model creation")
et = EventType.create(name: "Basic event type", form_data: '{"name":{"type":"text","required":true},"card_id":{"type":"text","maxlength":15,"required":true},"secondary_email":{"type":"email"},"phone_number":{"type":"phone","pattern":"[0-9]{3}-[0-9]{2}-[0-9]{3}","placeholder":"123-45-678"},"fegyver_kolcsonzes":{"type":"radio_group","items":["igen","nem","talán"]},"height":{"type":"number"},"glasses":{"type":"checkbox"},"your_opinion":{"type":"textarea","size":"40x20"},"kedvenc_kutyafajtak":{"type":"select","items":["Husky","Golden Retriver","Macska"],"multiple":true},"Kar":{"type":"select","items":["VIK","TTK","Egyeb"]}}')
Event.create(post: p, event_type: et)

p2 = Post.create(title: "Short registration test", short_description: "With way less form input")
et2 = EventType.create(name: "Basic short event type", form_data:  '{ "name": { "type": "text", "required":true }, "card_id": { "type": "text", "maxlength": 15 } } ')
Event.create(post:p2,event_type: et2)
