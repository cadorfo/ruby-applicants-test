require 'spec_helper'


describe Make do
  describe "#update_all_brands" do
    it "get all brands and save it" do
      webmotors_brand_counter = WebMotorsService.get_brands.uniq{|item| item["Nome"]}.count
      Make.update_all_brands
      expect(Make.count).to eq webmotors_brand_counter
    end
  end
end