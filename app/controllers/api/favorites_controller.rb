class Api::FavoritesController < ApplicationController
  
  respond_to :json

  # GET api/favorites.json
  def index
  	@top5_presentations ||= []
  	@presentations = Presentation.all
  	@presentation_top5 = Presentation.top5
  	@top5_presentations.push(@presentations.find(@presentation_top5[0].presentation_id))
  	@top5_presentations.push(@presentations.find(@presentation_top5[1].presentation_id))
  	@top5_presentations.push(@presentations.find(@presentation_top5[2].presentation_id))
  	@top5_presentations.push(@presentations.find(@presentation_top5[3].presentation_id))
  	@top5_presentations.push(@presentations.find(@presentation_top5[4].presentation_id))
  end
end
