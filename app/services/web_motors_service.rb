class WebMotorsService
  MODELS_URL = 'http://www.webmotors.com.br/carro/modelos'
  BRANDS_URL = 'http://www.webmotors.com.br/carro/marcas'

  def self.get_brands
    do_post(BRANDS_URL,{})
  end

  def self.find_models_by_brand_id id
    do_post(MODELS_URL, { marca: id })
  end

  private
  def self.do_post(uri, params)
    response = Net::HTTP.post_form(URI(uri), params)
    JSON.parse(response.body)
  end
end