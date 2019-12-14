class PokemonPolicy < ApplicationPolicy

  def show?
    record.user = user
  end
end

