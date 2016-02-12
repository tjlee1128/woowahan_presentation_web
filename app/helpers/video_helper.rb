module VideoHelper
  def self.create_single_video(video, id)
    return unless video
    add_single_video(video, id)
  end

  def self.update_single_video(video, id)
    return unless video
    delete_single_video(id)
    add_single_video(video, id)
  end

  def self.add_single_video(video, id)
    @video = Video.new
    @video.video = video
    @video.presentation_id = id
    @video.save
  end

  def self.delete_single_video(id)
    Video.find_by(presentation_id: id).destroy
  end
end
