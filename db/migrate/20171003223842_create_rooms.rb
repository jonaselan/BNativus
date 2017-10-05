class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true
      t.string :link
      t.string :level
      t.string :ip

      t.timestamps
    end
  end
end
