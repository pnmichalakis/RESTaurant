class CreatePartiesTable < ActiveRecord::Migration
  def change
  	create_table :parties do |t|
      t.string :name
      t.integer :number
      t.string :paid
     end
  end
end
