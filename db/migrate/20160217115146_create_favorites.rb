class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites, primary_key: 'favorite_id' do |t|
      t.references :presentation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
