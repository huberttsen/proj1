class PokemonController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer= current_trainer
		if @pokemon.save
			redirect_to root_path
		end 
	end
	def index
		@pokemon = Pokemon.all
	end 
	def create 
		@pokemon = Pokemon.create(pokemon_params)
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer = current_trainer
		if @pokemon.save
			redirect_to trainer_path(current_trainer)
		else 
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to error_path
		end 
	end 

	def new
		render "new"
	end 
  def pokemon_params
    params.require(:pokemon).permit(:name) #Returns a hash that was the value of "name" and "email" from the value of "user" in params.
  end

end
