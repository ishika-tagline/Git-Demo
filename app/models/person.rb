class CheckValidation < ActiveModel::Validator
  def validate(record)
    puts 'call custom check..............'
    return if record.name.start_with? 'X'

    record.errors.add :name, 'Need a name starting with x '
  end
end

class Person < ApplicationRecord
  has_and_belongs_to_many :hobbies,join_table: :hobbies_people

  validates :name, :email, :phone_number, :city, :state, :country, :hobby, :gender, presence: true
  validates :email, uniqueness: true, unless: proc { |a| a.email.blank? }
  validates :phone_number, length: { is: 10 }

  include ActiveModel::Validations
  # validates_with CheckValidation
  # validate :check_date

  # def check_date
  #     if(date1>date2)
  #         errors.add(:date1,"date1 is greaterthan date2"); #throw error
  #     end
  # end
  # validates :terms_of_service, acceptance: true
  # validates :terms_of_service, acceptance: {message: 'must be checked'}
  # validates :terms_of_service, acceptance: { accept: 'yes' }

  # custom validation
end
