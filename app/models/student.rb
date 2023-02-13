class Student < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                     :omniauthable,:confirmable
            include DeviseTokenAuth::Concerns::User
  has_and_belongs_to_many :courses
  belongs_to :section
end
