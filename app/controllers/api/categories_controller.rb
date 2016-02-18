class Api::CategoriesController < ApplicationController
  
  before_action :find_by_category, only: [:index, :presentations]

  respond_to :json
  
  def index
  end

  # GET api/categories/presentations.json
  def presentations
  	@presentations = Presentation.all.order(created_at: :desc)
  end

  private

  def find_by_category
    @categories = CommonCode.find_by_common_code_type('CATEGORY')
  end
end