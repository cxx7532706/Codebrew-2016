# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(:item => "Potatoes", :quantity => 10, :expir => DateTime.new(2016,2,3,4,5,6), 
  :picktime => DateTime.new(2016,2,3,4,5,6), :loc => "Loc", :super => "IGA", :org => "org1", 
  :available_time_start => DateTime.new(2016,2,3,4,5,6), :available_time_end => DateTime.new(2016,2,3,5,5,6), 
  :status => 0, :image => nil, :description => "Potatoes")
