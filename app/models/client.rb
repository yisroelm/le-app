class Client < ApplicationRecord
  has_many :products
  has_many :les
  has_many :appointments, through: :les
end
