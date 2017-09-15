class SearchController < ApplicationController
  def index
    @presenter = Presenter.new(params[:zipcode])
  end
end
