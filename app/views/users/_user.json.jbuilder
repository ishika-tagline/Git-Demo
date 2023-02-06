json.extract! user, :id, :name, :age, :created_at, :updated_at
#json.url user_url(user, format: :json) #:json add extension .json

#{"content":"janu12"}
json.content user.name

if current_user.has_role? :admin
    json.role "Admin"
end

#{"content":"janu12","user_detail":{"name":"janu12","email":"ishika57@gmail.com","age":21}}
json.user_detail do
    json.name user.name
    json.email user.email
    json.age user.age
end

#"accounts":[{"name":"SBI","created_at":"2023-02-02T10:19:12.356Z"},{"name":"RBI","created_at":"2023-02-02T10:19:19.020Z"}]
json.accounts user.acc, :name, :created_at

#[{"account_name":"SBI"},{"account_name":"RBI"}]
json.user_accounts user.acc  do |account|
    json.account_name account.name
    #json.url url_for(account.user)
end

#"author":{"name":"ishika"}
json.set! :author do
    json.set! :name, "ishika"
end

#"user_detail":{"name":"janu12","email":"ishika57@gmail.com","age":21,"bank_address":{"name":"Near DS point"}}
hash = {bank_address: {name:"Near DS point"}}
json.user_detail do
json.merge! hash
end

json.set! :user_array do
    json.array! user.acc do |account|
    
        json.user_body user #show all user data
        json.account_body do
            json.acc_name account.name
        end
    end
end

#extract attributes from array directly.

json.set! :my_account do
 json.array! user.acc, :name,:created_at
end

json.people do
  json.child! do #child is keyword
    json.id 1
    json.name 'David'
  end
  json.child! do
    json.id 2
    json.name 'Jamie'
  end
end

#"created_at":"2022-12-09T10:53:27.239Z","updated_at":"2023-02-01T06:40:12.805Z"
json.(user, :created_at, :updated_at)




