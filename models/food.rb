class Food < ActiveRecord::Base
	has_many(:orders)
	has_many(:parties, :through => :orders)

	validates :name, :price, presence: true
	validates :name, uniqueness: true
	
	def to_s
		"#{food.name}"
	end

end