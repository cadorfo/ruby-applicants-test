require 'spec_helper'
require 'rails_helper'

describe HomeController, type: :controller do
  describe "#index" do
    it "gets all brands" do
      get :index
      expect(Make.count).to be > 0
    end
  end

end