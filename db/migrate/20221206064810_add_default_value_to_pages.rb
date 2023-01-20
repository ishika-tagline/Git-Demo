class AddDefaultValueToPages < ActiveRecord::Migration[7.0]
  def change

    change_column_default(:pages,:visible,false)
    change_column_default(:subjects,:visible,false)
  end
end
