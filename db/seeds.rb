# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

myTask = Task.new(name: "My Title", description: "Something")
myTask.save

myTask.errors.each do |attribute, message|
  puts "#{attribute}: #{message}"  # This message will print out in the terminal by running "rake db:seed"
  Rails.logger.error "#{attribute}: #{message}" # This will print out in the log file. 
end
