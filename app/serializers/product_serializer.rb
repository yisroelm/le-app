class ProductSerializer < ActiveModel::Serializer
  attributes :name, :id


  belongs_to :client
end
