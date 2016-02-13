class Api::TeamsController < ApplicationController

  before_action :find_by_team, only: [:index]

  respond_to :json

  def index
  end

  def find_by_team
    @teams = CommonCode.find_by_common_code_type('TEAM')
  end
end
