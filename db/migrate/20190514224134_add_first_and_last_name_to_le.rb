class AddFirstAndLastNameToLe < ActiveRecord::Migration[5.2]
  def change
    add_column :les, :first_name, :string
    add_column :les, :last_name, :string
  end
end
