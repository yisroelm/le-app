class Client < ApplicationRecord
  has_many :products
  has_many :appointments
  has_many :les, through: :appointments
end
