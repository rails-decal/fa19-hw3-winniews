class City
	attr_accessor :name, :landmark, :population, :weather
	$cities = {}
	
	def initialize(city_params)
		@w = WeatherService.get(city_params[:name])
		if @w
    		@weather = (9.0/5) * (@w[:temperature] - 273)+ 32
    	else
    		@weather = 0
    	end
		@name = city_params[:name]
		@landmark = city_params[:landmark]
		@population = city_params[:population]
		#@weather = @temperature
	end

	def save
		$cities[@name.to_sym] = self
		
	end

	def self.all
    	$cities
  	end

	def update(update_params)
		# Your code here, for Task 4
		# Use update_params (a hash) to update the model
		self.landmark = update_params[:landmark]
		self.population = update_params[:population]
		
	end
end