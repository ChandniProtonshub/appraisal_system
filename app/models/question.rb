class Question < ApplicationRecord
	belongs_to :question_type
	# has_many :questions_users
 #    has_many :users, through: :questions_users
      has_many :answers
   # accepts_nested_attributes_for :questions_users, :allow_destroy => true, :reject_if => :all_blank
end
