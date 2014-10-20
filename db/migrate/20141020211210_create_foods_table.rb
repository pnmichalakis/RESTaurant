class CreateFoodsTable < ActiveRecord::Migration
  def change
  	create_table :foods do |t|
      t.string :name
      t.string :type
      t.integer :price
    end
  end
end
