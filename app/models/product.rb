class Product < ApplicationRecord
  belongs_to :client, optional: true
end
