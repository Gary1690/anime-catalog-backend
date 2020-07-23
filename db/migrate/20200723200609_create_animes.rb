class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :img_url
      t.string :description
      t.string :screen
      t.string :age_rating

      t.timestamps
    end
  end
end
