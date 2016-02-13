class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations, primary_key: 'presentation_id' do |t|
      t.references :user, foreign_key: true
      t.integer :category_id
      t.text :title
      t.text :subtitle
      t.text :content

      t.timestamps
    end
  end
end