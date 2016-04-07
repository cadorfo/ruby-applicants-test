class Model < ActiveRecord::Base
  belongs_to :make

  def self.update_models_by_make_id id
    WebMotorsService.find_models_by_brand_id(id).each do |json|
      Model.joins(:make).includes(:make).references(:make)
          .where(makes: {webmotors_id: id})
          .find_or_create_by(name: json["Nome"]) do |model|
        model.make = Make.find_by_webmotors_id id
      end
    end
  end
end

