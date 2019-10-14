require_relative '../services/weather_service'

class CitiesController < ApplicationController
  def index
  	 @cities = City.all
	   
  end

  def new
  end

  def create
    @w = WeatherService.get(params[:name])

     if @w
      @temperature = (9.0/5) * (@w[:temperature] - 273)+ 32

      city = City.new(
          name: params[:name],
          landmark: params[:landmark], 
          population: params[:population], 
          weather: @temperature, 
        )

      city.save
    end
  end

  def update
    # @cities = City.all
    # if @cities.key?(params[:name])
    #    @thiscity = @cities[params[:name]]
  

    #   @thiscity.update(
    #       #name: params[:name],
    #       landmark: params[:landmark], 
    #       population: params[:population], 
    #       #weather: @temperature, 
    #     )
    # end
  end

  def post_up
    @cities = City.all
    if @cities.key?((params[:name]).to_sym)
       @thiscity = @cities[(params[:name]).to_sym]
  

      @thiscity.update(
          #name: params[:name],
          landmark: params[:landmark], 
          population: params[:population], 
          #weather: @temperature, 
        )
    end
    redirect_to "/cities/"
  end

end
