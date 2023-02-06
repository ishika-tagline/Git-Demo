#json.partial! 'admin/accounts/account', account: @accounts

#same as array
#json.partial! 'admin/accounts/account', collection: @accounts, as: :account

json.array! @accounts, partial: 'admin/accounts/account',as: :account, cached: true

#json.accounts @user.acc, partial: 'admin/accounts/account', as: :account
#{"accounts":[{"account_list":{"id":39,"name":"HDFC","user_id":64,"created_at":"2023-02-02T09:46:18.963Z","updated_at":"2023-02-02T09:46:18.963Z"}},{"account_list":{"id":40,"name":"RBI","user_id":64,"created_at":"2023-02-02T09:46:41.780Z","updated_at":"2023-02-02T09:46:41.780Z"}}]}

#json.partial! @accounts, as: :account
#only 1 record show
#{"account_list":{"id":40,"name":"RBI","user_id":64,"created_at":"2023-02-02T09:46:41.780Z","updated_at":"2023-02-02T09:46:41.780Z"}}

# json.account do 
#     json.partial! "admin/accounts/account", account: @accounts
# end

#{"account":{"account_list":[{"id":39,"name":"HDFC","user_id":64,"created_at":"2023-02-02T09:46:18.963Z","updated_at":"2023-02-02T09:46:18.963Z"},{"id":40,"name":"RBI","user_id":64,"created_at":"2023-02-02T09:46:41.780Z","updated_at":"2023-02-02T09:46:41.780Z"}]}}

#json.partial! "admin/accounts/account", locals: {account: @accounts}

