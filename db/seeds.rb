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

#generate worlds
ruby_world = World.create name: "Ruby"
js_world = World.create name: "Javascript"

#generate houses
loop_house = House.new place_id: 1, title: 'Loops'
loop_house.user = user
loop_house.base_layout_code = "<div style='width:200px; height: 400px; border: 1px solid black; background: green;'>%-lesson_layout-%</div>"
loop_house.lesson_list_layout_code = "<a href='%-link_to_lesson-%'>%-lesson_title-%</a>  </br>"
loop_house.save
ruby_world.houses << loop_house
ruby_world.save

loop_room = Room.new
loop_room.house = loop_house
loop_room.user = user
loop_room.title = "How to create new variable"
loop_room.description = "This tutorial will help us to create new variable in ruby programm"
loop_room.base_layout_code = "<div style='width: 100%; border: 1px solid black;'><h1> This is my tutorial. <a href='%-link_to_quiz-%'>Take Quiz</a> </h1><p>%-tutorial_viewer-%</p></div>"
loop_room.viewer_layout_code = "<div style='width: 100%; border: 1px solid black;'><h1> This is my tutorial </h1><p>Step 1. </p><p>Step 2 </p></div>"
loop_room.video_enabled = 0
loop_room.quiz_base_layout_code = "<div style='width: 100%; border: 1px solid black;'><h1>This is my quiz</h1><p>%-quiz_question_layout-%</p></div>"
loop_room.quiz_question_code = "<div style='width: 100%; border: 1px solid black;'><h1>This is my quiz</h1><p>%-quiz_question_title-%</p><p>%-answer_1-%</br>%-answer_2-%</br>%-answer_3-%</br>%-answer_4-%</br></p></div>"
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

#generate skills

skill1 = Skill.new :name => "Ruby Loop"
skill1.save

skill2 = Skill.new :name => "Ruby Variables"
skill2.save

skill3 = Skill.new :name =>"Proc & Lambdas"
skill3.save

experience = Experience.new :skill_id => skill1.id, :status => 0
loop_room.experiences << experience

experience = Experience.new :skill_id => skill3.id, :status => 1
loop_room.experiences << experience

experience = Experience.new :skill_id => skill3.id, :status => 1
loop_room.experiences << experience

loop_room.save





