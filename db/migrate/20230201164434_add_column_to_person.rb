class AddColumnToPerson < ActiveRecord::Migration[7.0]
  def change
    add_column :people,:city,:string
    add_column :people,:state,:string
    add_column :people,:country,:string
    add_column :people,:hobby,:string
    add_column :people,:gender,:string
    add_column :people,:phone_number,:string
    remove_column :people, :date2, :date
    remove_column :people, :full_name, :string
  end
end
