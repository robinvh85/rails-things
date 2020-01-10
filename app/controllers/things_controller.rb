include Pagy::Backend

class ThingsController < ApplicationController
  def index
    @pagy, @things = pagy(Thing.all)
  end

  def index_ajax
    @pagy, @things = pagy(Thing.all, link_extra: 'data-remote="true"')
  end

  def create_random
    GenerateRandomThingJob.set(wait: 10.seconds).perform_later
    redirect_to action: :index
  end

  def destroy_all
    Thing.all.destroy_all
    redirect_to action: :index
  end

  def cookie_show
    cookies[:normal_cookie] = 'normal cookie'
    cookies.permanent[:demo_permanent] = 'permanent cookie'
    cookies.encrypted[:demo_encrypted] = 'encrypted cookie'
    cookies.signed[:demo_signed] = 'signed cookie'
    cookies[:demo_httponly] = {value: 'http only', expires: Time.current + 1.hour, httponly: true}

    # SameSite
    cookies[:demo_samesite_lax] = {value: 'SameSite Lax', expires: Time.current + 2.hour, same_site: :lax}
    cookies[:demo_samesite_strict] = {value: 'SameSite Strict', expires: Time.current + 2.hour, same_site: :strict}

    session[:user_id] = 100
  end
end
