class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, primary_key: 'comment_id' do |t|
      t.references :presentation, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
