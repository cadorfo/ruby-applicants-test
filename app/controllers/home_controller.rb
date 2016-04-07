class HomeController < ApplicationController
  def index
    Make.update_all_brands
    @makes = Make.all
  end
end
