class AttacksController < ApplicationController
  def index
  	@attacks = Attack.all
  end

  def show
  	@attack = Attack.find_by(id: params[:id])
  end
end
