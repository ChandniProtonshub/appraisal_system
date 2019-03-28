# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# #
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin_user = User.new( :email => admin@gmail.com, :password => admin1, :name => Ganesh )
# admin_user.admin = true
# admin_user.save!


 # User.create(:email => 'admin@gmail.com', :password => 'password123', :password_confirmation => 'password123')
# questions = Question.create(question_type: 'Self_Evaluation_Questions', question_name: 'Question1')
# questions = Question.create(question_type: 'Team_Evaluation_Questions', question_name: 'Question2')

questions = QuestionType.create(name: 'self_question')
questions = QuestionType.create(name: 'team_question')