class StaticPagesController < ApplicationController
  def index
    @client = Client.new
    if params[:collections_id].present?
      response = @client.collections(params[:collections_id])
      # data = JSON.parse(response.body)
      Rails.logger.debug "STATUS: #{response.status}"
      Rails.logger.debug "BODY: #{response.body}"
      photos = response["media"].select { |item| item.map("type") == "Photo" }
      @collections = photos.map { |item | item["src"]["original"] }
    end
  end
end
