class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :products


  has_many :products
end
