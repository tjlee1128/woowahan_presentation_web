class CreatePresentationFavoriteUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :presentation_favorite_users, primary_key: 'presentation_favorite_user_id' do |t|
      t.references :presentation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
