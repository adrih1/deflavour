class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # TEST DE MOYENNE D'ECHANTILLONAGE A METTRE DANS PAGE DU QUIZZ (A RETRAVAILLER RAPIDO TU COCO)
    # test = {
    #   vineux: 0,
    #   epicee: 0,
    #   boise: 0,
    #   animale: 0,
    #   noix: 0,
    #   sucre: 0,
    #   fruite: 0,
    #   floral: 0,
    #   herbace: 0,
    #   cereale: 0,
    #   empyreumatique: 0,
    #   tourbe: 0
    # }
    # [Spirit.find(1),Spirit.find(2),Spirit.find(3)].each do |el|
    #   test.map do |key, value|
    #     p key
    #     p (el[:"#{key}"])
    #     test[key] += (el[:"#{key}"])
    #   end
    #   p test
    # end


  end


  def dashboard
    @user = current_user
  end



    # TEST DE MOYENNE D'ECHANTILLONAGE A METTRE DANS PAGE DU QUIZZ (A RETRAVAILLER RAPIDO TU COCO)
    # test = {
    #   vineux: 0,
    #   epicee: 0,
    #   boise: 0,
    #   animale: 0,
    #   noix: 0,
    #   sucre: 0,
    #   fruite: 0,
    #   floral: 0,
    #   herbace: 0,
    #   cereale: 0,
    #   empyreumatique: 0,
    #   tourbe: 0
    # }
    # [Spirit.find(1),Spirit.find(2),Spirit.find(3)].each do |el|
    #   test.map do |key, value|
    #     p key
    #     p (el[:"#{key}"])
    #     test[key] += (el[:"#{key}"])
    #   end
    #   p test
    # end


  end



end
