class Client
  include HTTParty
  base_uri "https://api.pexels.com/v1"

  def initialize
    @headers = { "Authorization" => ENV["pexels_key"] }
  end

  def collections(collections_id)
    self.class.get("/collections/#{collections_id}", headers: @headers)
  end
end
