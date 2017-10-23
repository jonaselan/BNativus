class CreateUserLanguagesStudieds < ActiveRecord::Migration[5.1]
  def change
    create_table :user_languages_studieds do |t|
      t.references :user, foreign_key: true
      t.references :languages_studied
      t.integer :write
      t.integer :speak

      t.timestamps
    end
    add_foreign_key :user_languages_studieds, :languages, column: :languages_studied_id, primary_key: :id
  end
end
