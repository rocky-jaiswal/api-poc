require 'net/http'

class OfferInterface

  def get_offers(query_string)
    uri = URI(Figaro.env.SP_URL + query_string)
    Net::HTTP.get_response(uri).body
  end

end