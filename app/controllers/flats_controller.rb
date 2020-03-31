require "open-uri"

class FlatsController < ApplicationController
  FLATS_URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

  # DRY, Don't Repeat Yourself! This method will execute before each action in this controller
  before_action :set_flats

  # index -> display all the records
  def index; end

  # show -> display one record
  def show
    @flat = @flats.select { |flat| flat["id"] == params[:id].to_i }.first # params[:something] is always a string! Here we need to turn it into an integer
  end

  private

  # Keep private all your methods without a view (in fact they're call `methods`, not `actions`!)
  def set_flats
    response = open(FLATS_URL)
    @flats = JSON.parse(response.read)
  end
end
