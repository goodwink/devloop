# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl'
Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

p = Factory.create(:project)
#v1 = FactoryGirl.create(:version)
#v2 = FactoryGirl.create(:version, name: "2.0.0", slug: "2_0_0")
#v1.project = p
#v2.project = p
#v1.save
#v2.save
t1 = Factory.create(:task)
t2 = Factory.create(:task)
t3 = Factory.create(:task)
t4 = Factory.create(:task)
t5 = Factory.create(:task)
t6 = Factory.create(:task)
t1.project = p
t2.project = p
t3.project = p
t4.project = p
t5.project = p
t6.project = p
t1.save
t2.save
t3.save
t4.save
t5.save
t6.save
