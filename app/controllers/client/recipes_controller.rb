class Client::RecipesController < ApplicationController
  def index
    response = HTTP.get("http://localhost:3000/api/recipes")
    @recipes = response.parse
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    response = HTTP.post(
                          "http://localhost:3000/api/recipes", 
                          form: {
                                  title: params[:title],
                                  chef: params[:chef],
                                  ingredients: params[:ingredients],
                                  directions: params[:directions],
                                  prep_time: params[:prep_time],
                                  image_url: params[:image_url]
                                }
                          )
    @recipe = response.parse
    redirect_to "/client/recipes/#{@recipe["id"]}"
  end

  def show
    response = HTTP.get("http://localhost:3000/api/recipes/#{params[:id]}")
    @recipe = response.parse
    render 'show.html.erb'
  end

  def edit
    response = HTTP.get("http://localhost:3000/api/recipes/#{params[:id]}")
    @recipe = response.parse
    render 'edit.html.erb'
  end

  def update
    response = HTTP.patch(
                          "http://localhost:3000/api/recipes/#{params[:id]}",
                          form: {
                                  title: params[:title],
                                  chef: params[:chef],
                                  prep_time: params[:prep_time],
                                  ingredients: params[:ingredients],
                                  directions: params[:directions],
                                  image_url: params[:image_url]
                                }
                          )
    @recipe = response.parse
    redirect_to "/client/recipes/#{@recipe['id']}"
  end
end
