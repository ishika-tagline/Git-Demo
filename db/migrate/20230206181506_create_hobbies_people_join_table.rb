class CreateHobbiesPeopleJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table  :hobbies,:people 

  end

end
