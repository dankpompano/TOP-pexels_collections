class Client
  include Faraday
  def initialize
    options = {
    url: "https://api.pexels.com/v1",
    headers: {
      "Accept" => "application/json",
      "Authorization:" => Figaro.env.pexels_key
    }
  }
  @conn = Faraday.new(options) do |builder|
    builder.response :json
    builder.response :logger
    end
  end

  def collections(collections_id)
    response = @conn.get("collections/#{collections_id}")
    response
  end
end
