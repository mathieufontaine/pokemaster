class PokemonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    record.user = user
  end

  def create?
    record.user = user
  end

  def edit?
    user_is_trainer_or_admin
  end

  def update?
    user_is_trainer_or_admin
  end

  def destroy?
    user_is_trainer_or_admin
  end

  private

  def user_is_trainer_or_admin
    record.user = user
  end
end

