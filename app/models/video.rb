class Video < ApplicationRecord
  belongs_to :presentation

  has_attached_file :video, styles: {
    :medium => {
  	  :geometry => "640x480",
  	  :format => 'mp4'
      },
      :thumb => { :geometry => "120x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end
