class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end


  def dashboard
    @user = current_user
    @base = {
      vineux: 0,
      epicee: 0,
      boise: 0,
      animale: 0,
      fruite: 0,
      floral: 0,
      herbace: 0,
      cereale: 0,
      empyreumatique: 0,
      tourbe: 0
    }

    @user.experiences.each do |el|

      @base.map do |key, value|
        @base[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
      end
    end
    profile = @base
    AlcoolProfile.create(user: @user) if @user.alcool_profile.nil?
    profile.each { |k, v| @user.alcool_profile[:"#{k}"] = v }  unless profile.reject { |k, v| v == @user.alcool_profile[:"#{k}"]}.empty?
    @popo = []
    @papa = []
    @base.each do |k, v|
      @popo << k
      @papa << v
    end
    @value = @popo.join("-")
    @data = @papa.join("-")


    @result = {}
    Spirit.all.each do |spirit|
      difference = 0
      @base.each do |key, value|
        spirit[:"#{key}"] == 0 ? diff = 1 : diff = (((value - spirit[:"#{key}"]) / spirit[:"#{key}"]) * (value.zero? ? 1 : value))
        diff * (-1) if diff < 0
        difference += diff
      end
      @result[:"#{spirit.id}"] = difference
    end
    @user.recommendations.each { |el| el.destroy }
    @forbidden = []
    @user.orders.each { |el| @forbidden << el.spirit.id } unless @user.orders.empty?
    @result.reject{ |k, v| @forbidden.include?(k) }.sort_by { |_, v| v }.first(5).map(&:first).each do |k, v|

      Recommendation.create(spirit: Spirit.find("#{k}"), user: @user, percentages: (100 - (@result[k] * 2)))
    end
  end
end
