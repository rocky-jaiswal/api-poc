module PagesHelper

  def get_offer_class(offers)
    if offers.nil? || offers.empty?
      "no_offers"
    else
      "offers"
    end
  end

  def build_offers_ui(offers)
    return "" if offers.nil? || offers.empty?
    templ = ''
    offers.each do |offer|
      templ = templ + '<div class="offer-container">'
      templ = templ + '<div class="title">'     + offer["title"]   + '</div>'
      templ = templ + '<div class="payout">'    + offer["payout"].to_s  + '</div>'
      templ = templ + '<img src="' + offer["thumbnail"]["lowres"] + '"/>'
      templ = templ + '</div>'
    end
    templ.html_safe
  end
end
