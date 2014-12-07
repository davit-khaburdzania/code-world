#generate user
user = User.create fullname: "Jon Doe", email: "user@mail.com", password: "qwerasdf"

#generate badges

badge_student = Badge.new :name => "Student" 
badge_student.save

badge_teacher = Badge.new :name => "Teacher"
badge_teacher.save

badge_doctor = Badge.new :name => "Doctor"
badge_doctor.save

badge_entrepreneur = Badge.new :name => "Entrepreneur"
badge_entrepreneur.save

#assign badge to user
user.badges << badge_teacher

#generate skills

skill = Skill.new :name => "Ruby Loop"
skill.save

skill = Skill.new :name => "Ruby Variables"
skill.save

skill = Skill.new :name =>"Proc & Lambdas"
skill.save

#generate worlds
ruby_world = World.create name: "Ruby"
js_world = World.create name: "Javascript"

#generate houses
loop_house = House.new place_id: 1, title: 'Loops'
loop_house.user = user
loop_house.base_layout_code = "<div style='width:200px; height: 400px; border: 1px solid black; background: green;'>%-lesson_layout-%</div>"
loop_house.lesson_list_layout_code = "<a href='%-link_to_lesson-%'>%-lesson_title-%</a></br>"
loop_house.save
ruby_world.houses << loop_house
ruby_world.save

loop_room = Room.new
loop_room.house = loop_house
loop_room.user = user
loop_room.title = "How to fuck ruby loops"
loop_room.description = "We will learn jurking with stolen cheese"
loop_room.base_layout_code = "<div style='width:200px; height: 400px; border: 1px solid black; background: green;'><h2> This is Lesson Base layout </h2>%-tutorial_viewer_layout-%</div>"
loop_room.viewer_layout_code = "<div style='padding: 10px;'><h2> This is tutorial itself</h2> Today we will learn some crazy stupid shit!</div>"
loop_room.video_enabled = 0
loop_room.quiz_base_layout_code = ""
loop_room.quiz_question_code = ""
loop_room.is_paid = 0
loop_room.save

loop_house.rooms << loop_room
loop_house.save

loop_house = House.new place_id: 3, title: 'Hashes'
loop_house.base_layout_code = "<div style='width:200px; height: 400px; border: 1px solid black; background: red;'>%-lesson_layout-%</div>"
loop_house.lesson_list_layout_code = "<p><a href='%-link_to_lesson-%'>%-lesson_title-%</a></p>"
loop_house.save
ruby_world.houses << loop_house
ruby_world.save

loop_house = House.new place_id: 4, title: 'IO'
loop_house.base_layout_code = "<div style='width:600px; height: 500px; border: 1px solid black; background: gray;'>%-lesson_layout-%</div>"
loop_house.lesson_list_layout_code = "<p><a href='%-link_to_lesson-%'>%-lesson_title-%</a></p>"
loop_house.save
ruby_world.houses << loop_house
ruby_world.save





