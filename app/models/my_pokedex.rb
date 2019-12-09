class MyPokedex < ApplicationRecord
	belongs_to :user
	has_many :teams

end
