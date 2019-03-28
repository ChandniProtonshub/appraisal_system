class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable
    # has_many :questions_users
    # has_many :questions, through: :questions_users
    has_many :answers
   
    # accepts_nested_attributes_for :questions_users, :allow_destroy => true, :reject_if => :all_blank
end
