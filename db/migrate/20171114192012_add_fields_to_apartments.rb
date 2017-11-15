class AddFieldsToApartments < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :country, :string
    add_column :apartments, :postal, :string
    add_column :apartments, :building_man, :string
    add_column :apartments, :phone, :string
    add_column :apartments, :hours, :string
  end
end
