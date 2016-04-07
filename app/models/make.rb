class Make < ActiveRecord::Base
  has_many :models

  def self.update_all_brands
    WebMotorsService.get_brands.each do |make_params|
      Make.find_or_create_by(
          name: make_params["Nome"], webmotors_id: make_params["Id"])
    end
  end
end
