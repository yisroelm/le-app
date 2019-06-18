class ProductSerializer < ActiveModel::Serializer
  attributes :name


  belongs_to :client
end
