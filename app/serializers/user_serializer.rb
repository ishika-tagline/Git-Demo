class UserSerializer
  include JSONAPI::Serializer

  #default id and type show
  #set_key_transform :camel
  #set_type :user  # optional default added

  attributes :name, :email, :age,:full_name
  
  #add custom field
  attributes :full_name do |object|
    "#{object.name} | #{object.email}"
  end

  #override model field
  attributes :name do |object|
    "new name: #{object.name}"
  end

  #new attribure with passing model attribute
  attributes :my_name, &:name

  # "links": {
  #   "name": "ishika49",
  # }
  link :name

  # "links": {
  #   "self": "ishika49"
  # }
  link :self, :name

  link :custom_url do |object|
    "http://localhost:3000/users/#{object.id}"
  end

  # "relationships": {
  #   "acc": {
  #     "data": [

  #     ],
  #     "links": {
  #       "self": "janu15",
  #       "related": "http://localhost:3000/users/18"
  #     }
  #   }
  # }

  
  has_many :acc, links:{
    self: :name,
    related: -> (object){
      "http://localhost:3000/users/#{object.id}"
    }
  }

  has_many :acc, lazy_load_data: true, links:{
    self: :name,
    related: -> (object){
      "http://localhost:3000/users/#{object.id}/accounts"
    }
  }

  attributes :current_user do |object,params|
    params[:current_user][:name]
  end
 
  set_id do |object, params|
    # in here, params is a hash containing the `:admin` key
    params[:current_user] ? object.name : "name-#{object.id}"
  end

  #Conditional Attributes
  attribute :age, if: Proc.new { |object,params|
   params[:current_user][:age] > 50
  }
    

  #Relational Attributes
  has_many :acc, if: Proc.new {|record| record.acc.any? }


  attributes :date do |user|
  end

  #Meta information
  meta do |user|
    {
      date: Date.current.year
    }
  end
end
