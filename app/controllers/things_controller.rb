class ThingsController < ApplicationController
  def index
    @things = Thing.all()
  end

  def create_random
    GenerateRandomThingJob.set(wait: 10.seconds).perform_later
    redirect_to action: :index
  end

  def destroy_all
    Thing.all.destroy_all
    redirect_to action: :index
  end
end