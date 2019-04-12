class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable
   validates :fname, :lname, :pnumber, :gender,  presence: true
validates_presence_of   :fname, :message => 'Please enter First Name.'
validates_presence_of   :lname, :message => 'Please enter Last  Name.'
validates_presence_of   :pnumber, :message => 'Please enter your phone number.'
validates_presence_of   :gender, :message => 'Please select your gender.'
validates_presence_of   :email, :message => 'Please enter your Email'
validates_presence_of   :password, :message => 'Please enter your password.'
validates_presence_of   :password_confirmation, :message => 'Please enter your confirm-password'


   validate :password_complexity
   has_many :answers
   accepts_nested_attributes_for :answers


def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
 return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/
  errors.add :password, 'Complexity requirement not met. Length should be 6-20 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end




