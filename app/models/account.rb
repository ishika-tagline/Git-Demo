class Account < ApplicationRecord
  resourcify
  belongs_to :user, counter_cache: true  # count account using size, default generate accounts_count col in users tble
  # default_scope{where("name=?",'BOB')}
  scope :get_only_bob_bank, -> { where(name: 'BOB') }
  scope :get_account_by_bank_name, ->(bank_name) { where('name=?', bank_name) }
  # scope :get_by_bank_name, ->(bank_name){where("name=?", bank_name) if bank_name.present? }
end
