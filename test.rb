#!/usr/bin/env ruby
require 'active_record'
require 'yaml'
require 'require_all'
require 'pp'
require_all 'models/*.rb'

db_config = YAML::load(File.open('config/database.yml'))['default']
ActiveRecord::Base.establish_connection(db_config)

Person.find_each do |p|
  puts "------"
  pp p
  pp p.home_address
  pp p.work_address
end

