class PokemonsController < ApplicationController
  
  def capture
  	@trainer = current_trainer
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.trainer_id = @trainer.id
  	@pokemon.save
  	redirect_to root_path
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.health = @pokemon.health - 10
  	@pokemon.save

  	redirect_to trainer_path(id: @pokemon.trainer_id)
  end

  def heal
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.health == 100
      flash[:error] = "Your pokemon is already at full health!"
    elsif @pokemon.health >= 90
      @pokemon.health = 100
      @pokemon.save
    else
      @pokemon.health = @pokemon.health + 10
      @pokemon.save
    end

    redirect_to trainer_path(id: @pokemon.trainer_id)
  end

  def new
  	@trainer = current_trainer
  	@pokemon = Pokemon.new
  end

  def create
  	@pokemon = Pokemon.new(pokemon_params)
  	if @pokemon.save
  	  @pokemon.level = 1
  	  @pokemon.health = 100
  	  @pokemon.trainer_id = current_trainer.id
  	  @pokemon.save
  	  redirect_to trainer_path(id: @pokemon.trainer_id)
  	else
  	  redirect_to new_pokemon_path
  	  flash[:error] = @pokemon.errors.full_messages.to_sentence
  	end
  end

  private

  def pokemon_params
  	params.require(:pokemon).permit(:name)
  end

end
