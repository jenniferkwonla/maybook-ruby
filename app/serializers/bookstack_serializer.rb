class BookstackSerializer < ActiveModel::Serializer
  attributes :id, :books, :userids
end
