class CreateCommonCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :common_codes, primary_key: 'common_code_id' do |t|
      t.text :common_code_type
      t.integer :common_code_detail_id
      t.text :name_korean
      t.boolean :yn_use, default: true

      t.timestamps
    end
  end
end
