class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]

  def home

  	if params[:query].present?
  	  sql_query = " \
  	    pokemons.name ILIKE :query \
  	    OR pokemons.location ILIKE :query \
  	    OR types.name ILIKE :query \
  	    OR moves.name ILIKE :query \
  	  "
  	  @pokemons = policy_scope(Pokemon).joins(:type).where(sql_query, query: "%#{params[:query]}%")
  	else
  	@pokemons = policy_scope(Pokemon)
  	end
  end
end
