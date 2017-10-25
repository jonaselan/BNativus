class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string, default: ""
    add_column :users, :last_name, :string
    add_column :users, :gender, :integer
    add_column :users, :avatar, :string, default: ""
    add_column :users, :age, :string
    add_column :users, :born_on, :date, default: ""
    add_column :users, :bio, :string
    add_column :users, :country, :string, default: ""
    add_column :users, :created_rooms, :integer, default: 0
    add_column :users, :phone, :string, default: ""
  end
end
