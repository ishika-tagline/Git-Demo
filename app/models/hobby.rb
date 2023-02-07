class Hobby < ApplicationRecord
    has_and_belongs_to_many :people,join_table: :hobbies_people

end
