require 'spec_helper'
require 'rails_helper'

describe ModelsController, type: :controller do
  describe "GET index" do
    context "brand exists" do
      let(:make){Make.create(webmotors_id: 2)}
      it "finds all models of certain brand" do
        models_before_count = Model.count
        get :index, {webmotors_make_id: make.webmotors_id}
        models_after_count = Model.count
        expect(models_after_count).to be > models_before_count
      end
      it "doesn't adds same models again on research" do
        models_before_count = Model.count
        get :index, {webmotors_make_id: make.webmotors_id}
        models_first_search = Model.count
        get :index, {webmotors_make_id: make.webmotors_id}
        models_after_count = Model.count

        expect(models_after_count).to be > models_before_count
        expect(models_after_count).to eq models_first_search
      end
    end
    context "brand nonexists" do

      it "finds no models" do
        models_before_count = Model.count
        get :index, {webmotors_make_id: 2}
        models_after_count = Model.count
        expect(models_after_count).to eq models_before_count
        expect(models_after_count).to eq 0
      end
    end
  end
end