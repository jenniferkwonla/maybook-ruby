class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description1, :description2, :description3, :category1, :category2, :category3, :updated_at, :image, :googlevolumeid
  attributes :googlevolumeid
end
