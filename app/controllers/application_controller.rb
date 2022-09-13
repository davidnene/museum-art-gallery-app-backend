class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/arts" do
    arts = Art.all 
    arts.to_json(include: :ratings)
  end

  get "/arts/:id" do
    art = Art.find(params[:id])
    art.to_json(include: :ratings)
  end

  post "/ratings" do
    rating = Rating.create(
      art_rating: params[:art_rating],
      comment: params[:comment],
      art_id: params[:art_id]
    )
    rating.to_json
  end

  patch "/ratings/:id" do 
    rating = Rating.find(params[:id])
    rating.update(
      art_rating: params[:art_rating],
      comment: params[:comment]
    )
    rating.to_json
  end

  delete "/ratings/:id" do
    rating = Rating.find(params[:id])
    rating.destroy
    rating.to_json
  end
end
