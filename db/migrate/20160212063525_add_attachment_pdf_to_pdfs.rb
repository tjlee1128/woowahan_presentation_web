class AddAttachmentPdfToPdfs < ActiveRecord::Migration
  def self.up
    change_table :pdfs do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :pdfs, :pdf
  end
end
