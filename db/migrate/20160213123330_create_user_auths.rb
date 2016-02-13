class CreateUserAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :user_auths, primary_key: 'user_auth_id' do |t|
      t.references :user, foreign_key: true
      t.text :access_token

      t.timestamps
    end
  end
end
