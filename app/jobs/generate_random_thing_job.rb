class GenerateRandomThingJob < ApplicationJob
  queue_as :default

  def perform
    puts 'GenerateRandomThingJob - PERFORM'
    sleep 5
    thing = Thing.new
    thing.name = Faker::Name.last_name
    thing.email = Faker::Internet.email
    thing.save!
  end
end
