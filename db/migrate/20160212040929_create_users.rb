class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, primary_key: 'user_id' do |t|
      t.text :email
      t.text :password
      t.text :fullname
      t.integer :team_id

      t.integer :presentations_count, default: 0
      
      t.timestamps
    end
  end
end
