class AddOmniauthToLes < ActiveRecord::Migration[5.2]
  def change
    add_column :les, :provider, :string
    add_column :les, :uid, :string
  end
end
