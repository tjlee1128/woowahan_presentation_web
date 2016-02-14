class Api::CategoriesController < ApplicationController
  
  before_action :find_by_category, only: [:index]

  respond_to :json
  
  def index
  end

  private

  def find_by_category
    @categories = CommonCode.find_by_common_code_type('CATEGORY')
  end
end