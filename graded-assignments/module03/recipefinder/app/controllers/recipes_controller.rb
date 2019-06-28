class RecipesController < ApplicationController

	def index 
		@search_param = params['search'] || 'chocolate'
		#We perform the search with the param
		@recipes = Recipe.for @search_param
	end

end
