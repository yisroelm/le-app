class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :products


  has_many :products
end
