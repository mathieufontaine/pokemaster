class AttacksController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
   before_action :skip_authorization

  def index
	if params[:query].present?
		 sql_query = " \
		   attacks.name ILIKE :query \
		   OR types.name ILIKE :query \
		 "
		 @attacks = policy_scope(Attack).joins(:type).where(sql_query, query: "%#{params[:query]}%")
	else
		@attacks = policy_scope(Attack)
	end
  end

  def show
  	@attack = Attack.find_by(id: params[:id])
  end
end