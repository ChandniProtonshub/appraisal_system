class Question < ApplicationRecord
	belongs_to :question_type
    has_many :answers
    validates :description, :question_type_id, presence: true
    validates :description, :uniqueness => true, :length => {:within => 8..10}
     
    # validates :description, :uniqueness => true, :length => {:minimum => 10}
    accepts_nested_attributes_for :answers
 end



