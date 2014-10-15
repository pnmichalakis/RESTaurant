class Order < ActiveRecord::Base
	belongs_to(:party)
	belongs_to(:food)

	def to_s
		"#{Order.food.name}"
	end
end