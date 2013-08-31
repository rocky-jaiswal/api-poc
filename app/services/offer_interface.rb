require 'net/http'
require 'multi_json'

class OfferInterface

  def get_offers(query_string)
    begin
      uri = URI(Figaro.env.SP_URL + query_string)
      Net::HTTP.get_response(uri).body
    rescue Exception => ex
      return MultiJson.dump({'message' => "Whoops .. an error has occured! Please try again later."})
    end
  end

end