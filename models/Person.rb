class Person < ActiveRecord::Base
  belongs_to :home_address, :class_name => 'Location'
  belongs_to :work_address, :class_name => 'Location'
end
