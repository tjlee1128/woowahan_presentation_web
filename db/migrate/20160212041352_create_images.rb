class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images, primary_key: 'image_id' do |t|
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
