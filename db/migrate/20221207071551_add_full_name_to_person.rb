class AddFullNameToPerson < ActiveRecord::Migration[7.0]
  def change

    add_column :people, :full_name, :string
  end
end
