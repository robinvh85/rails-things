class GenerateRandomThingJob < ApplicationJob
  queue_as :default

  def perform(obj)
    puts 'GenerateRandomThingJob - PERFORM'
    p obj
    sleep 5
    thing = Thing.new
    thing.name = Faker::Name.last_name
    thing.email = Faker::Internet.email
    thing.save!
  end
end
