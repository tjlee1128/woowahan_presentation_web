class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos, primary_key: 'video_id' do |t|
      t.references :presentation, foreign_key: true

      t.timestamps
    end
  end
end
