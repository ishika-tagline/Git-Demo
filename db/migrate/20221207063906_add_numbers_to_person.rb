class AddNumbersToPerson < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :date1, :date
    add_column :people, :date2, :date
  end
end
