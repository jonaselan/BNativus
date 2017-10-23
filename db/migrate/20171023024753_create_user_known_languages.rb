class CreateUserKnownLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_known_languages do |t|
      t.references :user, foreign_key: true
      t.references :known_languages
      t.integer :write
      t.integer :speak

      t.timestamps
    end
    add_foreign_key :user_known_languages, :languages, column: :known_languages_id, primary_key: :id
  end
end
