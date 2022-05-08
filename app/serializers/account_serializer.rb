class AccountSerializer < ActiveModel::Serializer
  attributes :id, :userid, :password
end
