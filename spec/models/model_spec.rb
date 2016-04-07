require 'spec_helper'

describe Model do
  describe "#update_models_by_make_id" do

    let(:webmotors_id) {2}
    let!(:make){Make.create(webmotors_id: webmotors_id)}

    it "gets all models by make and save it" do
      Model.update_models_by_make_id(webmotors_id)
      webmotors_models_counter = WebMotorsService.find_models_by_brand_id(webmotors_id).count
      models_count = Model.where(make_id: make.id).count
      expect(models_count).to eq webmotors_models_counter
    end
  end
end