class Client < ApplicationRecord
  has_many :appointments
  has_many :les, through: :appointments
  has_many :products
end
