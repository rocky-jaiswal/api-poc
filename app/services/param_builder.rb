require 'digest/sha1'

class ParamBuilder

  attr_reader :req_params

  def initialize
    @req_params = {}
  end

  def build_params(params, uid)
    merge_user_params(params)
    add_dynamic_params(params, uid)
    add_static_params()
    build_query_string()
  end

  def merge_user_params(params)
    no_of_params = params[:no_of_params].to_i
    (0..no_of_params-1).each do |idx|
      key = ("pub" + idx.to_s).to_sym
      @req_params[key.to_sym] = params[key.to_sym]
    end
    @req_params[:page] = params[:page]
  end

  def add_dynamic_params(params, uid)
    @req_params[:uid]       = uid
    @req_params[:timestamp] = Time.now.to_i
  end

  def add_static_params
    @req_params[:appid]       = Figaro.env.SP_APP_ID
    @req_params[:format]      = Figaro.env.SP_FORMAT
    @req_params[:device_id]   = Figaro.env.SP_DEVICE_ID
    @req_params[:ip]          = Figaro.env.SP_IP
    @req_params[:locale]      = Figaro.env.SP_LOCALE
    @req_params[:offer_types] = Figaro.env.SP_OFFER_TYPES
  end

  def build_query_string
    query = ""
    @req_params.keys.sort.each do |key|
      query = query + key.to_s + "=" + @req_params[key].to_s + "&"
    end
    add_hash_key(query)
  end

  def add_hash_key(query)
    to_be_hashed  = query + Figaro.env.SP_API_KEY
    hash = Digest::SHA1.hexdigest to_be_hashed
    query = query + "hashkey=" + hash
    puts "--> Query ==> " + query #just for logging
    query
  end

end