class Api::TeamsController < ApplicationController

  before_action :find_by_team, only: [:index]

  respond_to :json

  def index
  end

  def presentations
  	@users = User.all.where(team_id: params[:team_id])
  	@team_presentations ||= []
  	@users.each do |user|
  	  user.presentations.each do |presentation|
  	  	@team_presentations.push(presentation)
  	  end
  	end
  end

  def find_by_team
    @teams = CommonCode.find_by_common_code_type('TEAM')
  end
end
