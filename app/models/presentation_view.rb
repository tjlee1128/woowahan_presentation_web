class PresentationView < ApplicationRecord
  belongs_to :presentation

  def self.find_by_presentation_id(presentation_id)
    find_by(presentation_id: presentation_id).nil? if presentation_id.present?
  end
end
