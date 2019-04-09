class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable
   validates :fname, :lname, :pnumber, :gender,  presence: true
   has_many :answers
   accepts_nested_attributes_for :answers
end
