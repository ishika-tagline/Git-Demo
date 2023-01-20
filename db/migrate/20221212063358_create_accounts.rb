class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|

      t.string :name
      t.string :type
      t.belongs_to :user ,foreign_key: true
      t.timestamps
    end
  end
end
