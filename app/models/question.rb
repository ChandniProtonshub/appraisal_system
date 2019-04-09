class Question < ApplicationRecord
	belongs_to :question_type
    has_many :answers
    validates :description, :question_type_id, presence: true
    accepts_nested_attributes_for :answers
 end
