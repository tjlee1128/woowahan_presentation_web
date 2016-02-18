class CreatePresentationViews < ActiveRecord::Migration[5.0]
  def change
    create_table :presentation_views, primary_key: 'presentation_view_id' do |t|
      t.references :presentation, foreign_key: true
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
