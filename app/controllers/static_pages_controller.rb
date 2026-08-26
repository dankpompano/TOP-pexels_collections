class StaticPagesController < ApplicationController
  def index
    @client = Client.new
    if params[:collections_id].present?
      @collection = @client.collections(params[:collections_id])
      Rails.logger.debug "STATUS: #{@collection.code}"
      Rails.logger.debug "BODY: #{@collection.body}"
    end
  end
end
