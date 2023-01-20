
class CheckValidation < ActiveModel::Validator
    def validate(record)
        puts "call custom check.............."
        unless record.name.start_with? 'X'
            record.errors.add :name , "Need a name starting with x "
        end
    end
end

class Person < ApplicationRecord

    include  ActiveModel::Validations
    validates_with CheckValidation
    validate :check_date

    def check_date
        if(date1>date2)
            errors.add(:date1,"date1 is greaterthan date2"); #throw error
        end

    end


    validates :name, presence: true
    #validates :terms_of_service, acceptance: true
    #validates :terms_of_service, acceptance: {message: 'must be checked'}
    validates :terms_of_service, acceptance: { accept: 'yes' }
    validates :date1, comparison: {greater_than: :date2}
    validates :full_name, exclusion: {within: %w(gh do jp ), message: "%{value} is reserved."}
    validates :email, uniqueness: true,unless: Proc.new{|a| a.email.blank?}

    #custom validation
end

