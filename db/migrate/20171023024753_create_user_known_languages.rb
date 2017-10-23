class CreateUserKnownLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_known_languages do |t|
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true
      t.string :write
      t.string :speak

      t.timestamps
    end
  end
end
