class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instructions
      t.integer :minutes_to_complete
      # needs to be added so the connection will be made between the user and recipe in the schema
      # generates the line 'add_foreign_key "recipes", "users"' in the schema after 'rails db:migrate' is ran in terminal
      # generates the 'user_id' field in the schema after 'rails db:migrate' is ran in terminal
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
