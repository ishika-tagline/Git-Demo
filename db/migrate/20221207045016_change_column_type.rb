class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :people, :terms_of_service, :boolean
  end
end
