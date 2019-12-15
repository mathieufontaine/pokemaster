class TypesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
   before_action :skip_authorization

  def index
	if params[:query].present?
		 sql_query = " \
		   OR types.name ILIKE :query \
		 "
		 @types = policy_scope(Type).where(sql_query, query: "%#{params[:query]}%")
	else
		@types = policy_scope(Type)
	end
  end

  def show
  	@type = Type.find_by(id: params[:id])
  end
end