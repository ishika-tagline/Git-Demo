class AccSerializer
  include JSONAPI::Serializer
  attributes :name,:user_id
end
