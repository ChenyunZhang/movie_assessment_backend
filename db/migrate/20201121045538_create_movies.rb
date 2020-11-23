class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :poster
      t.string :original_Language
      t.string :overview
      t.string :release
      t.boolean :adult

      t.timestamps
    end
  end
end
