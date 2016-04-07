class ModelsController < ApplicationController
  def index
    @make = Make.find_by_webmotors_id(params[:webmotors_make_id])

    if @make
      Model.update_models_by_make_id(@make.webmotors_id)
      @models = Model.where(make_id: @make.id)
    end
  end
end
