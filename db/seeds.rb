#generate user
user = User.create full_name: "Jon Doe", email: "user@mail.com", password: "qwerasdf"

#generate worlds
ruby_world = World.create name: "Ruby"
js_world = World.create name: "Javascript"

#generate houses
loop_house = House.new place_id: 1, title: 'Loops'
loop_house.user = user
ruby_world.houses << loop_house
ruby_world.save

loop_house = House.new place_id: 3, title: 'Hashes'
loop_house.user = user
ruby_world.houses << loop_house
ruby_world.save

loop_house = House.new place_id: 4, title: 'IO'
loop_house.user = user
ruby_world.houses << loop_house
ruby_world.save



