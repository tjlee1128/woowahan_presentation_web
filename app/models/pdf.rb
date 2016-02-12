class Pdf < ApplicationRecord
  belongs_to :presentation

  has_attached_file :pdf
  validates_attachment_content_type :pdf, :content_type => ['application/pdf', 'application/msword', 'text/plain']
end
