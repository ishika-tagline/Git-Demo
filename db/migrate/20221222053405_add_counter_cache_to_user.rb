class AddCounterCacheToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :accounts_count, :integer, default: 0

    User.find_each { |user| User.reset_counters(user.id, :accounts) }
  end
end
