class CreatePdfs < ActiveRecord::Migration[5.0]
  def change
    create_table :pdfs, primary_key: 'pdf_id' do |t|
      t.references :presentation, foreign_key: true

      t.timestamps
    end
  end
end
