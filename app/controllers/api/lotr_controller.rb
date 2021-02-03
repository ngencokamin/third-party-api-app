class Api::LotrController < ApplicationController

  def show
    @quote = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.lotr_api[:api_key]}").get("https://the-one-api.dev/v2/quote/5cd96e05de30eff6ebcced9a").parse["docs"][0]["dialog"]
    @character = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.lotr_api[:api_key]}").get("https://the-one-api.dev/v2/character/5cdbdecb6dc0baeae48cfab2").parse["docs"][0]["name"]
    @movie = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.lotr_api[:api_key]}").get("https://the-one-api.dev/v2/movie/5cd95395de30eff6ebccde5b").parse["docs"][0]["name"]
    render "show.json.jb"
  end

end
