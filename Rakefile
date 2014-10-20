require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require_relative 'connection.rb'
# rake db:create_migration NAME=create_parties_table


namespace :db do
  desc "Create restaurant_database database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE restaurant_database;')
    conn.close
  end

  desc "Drop restaurant_database database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE restaurant_database;')
    conn.close
  end
  
  desc 'migrate tables for '
  task :migrate do
    conn = PG::Connection.open({dbname:'restaurant_database'})
    conn.exec("CREATE TABLE parties (id SERIAL PRIMARY KEY, name varchar(255), paid varchar(10), num_guests INTEGER);")
    conn.exec("CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(255), price INTEGER, cuisine VARCHAR(255));")
    conn.exec("CREATE TABLE orders (id SERIAL PRIMARY KEY, party_id INTEGER, food_id INTEGER);")
    conn.close
  end
  
  desc "create junk data for development"
  task :junk_data do

    require_relative 'connection'
    require_relative 'models/food'
    require_relative 'models/party'
    require_relative 'models/order'

    Food.create({name: 'Braised Toucan', price: 1400})
    Food.create({name: 'Escargot', price: 17})
    Food.create({name: 'Octopus', price: 24})
    Food.create({name: 'Ceviche', price: 18})
    Food.create({name: 'Old Fashioned', price: 11})
    Food.create({name: 'Fizzy Water', price: 4})

    Party.create({name: "Golbez",  number: 3, paid: "No"})
    Party.create({name: "Krampus",  number: 2, paid: "No"})
    Party.create({name: "Sleastak", number: 4, paid: "No"})
    Party.create({name: "Gargiulo", number: 7, paid: "No"})
  

    parties = Party.all
    foods = Food.all

    parties.each do |party|
      party.number.times do
        Order.create({party: party, food: foods.sample}) if [true, false].sample
      end
    end
  end
end









#
