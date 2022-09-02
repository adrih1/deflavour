class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end


  def dashboard
    @user = current_user
    #On met une base à 0
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
    # Recupérer les champs que le USER a rempli sur le form precedent
    @user.experiences.each do |el|


      @base.map do |key, value|
        @base[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
      end
    end
    profile = @base
    AlcoolProfile.create(user: @user) if @user.alcool_profile.nil?
    profile.each { |k, v| @user.alcool_profile[:"#{k}"] = v }  unless profile.reject { |k, v| v == @user.alcool_profile[:"#{k}"]}.empty?

    @familie_order = []
    profile.sort_by { |_, v| -v }.each { |k, _| @familie_order << k }

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
        diff = ((value - spirit[:"#{key}"]) * 3)
        diff = diff * (-1) if diff < 0
        difference += diff
      end
      @result[:"#{spirit.id}"] = difference
    end

    @user.recommendations.each { |el| el.destroy }
    unless @user.experiences.empty?
      @forbidden = []
      @user.orders.each { |el| @forbidden << el.spirit.id } unless @user.orders.empty?
      @user.experiences.each { |el| @forbidden << el.spirit.id } unless @user.experiences.empty?
      @result.reject{ |k, v| @forbidden.include?(k) }.sort_by { |_, v| v }.first(5).map(&:first).each do |k, v|
        Recommendation.create(spirit: Spirit.find("#{k}"), user: @user, percentages: (100 - @result[k].round(2)))
      end
    end
  end



    epice = {
      clef: "epice",
      family: "Épice",
      accroche: "Vous êtes un Aventurier",
      description: "Les aventuriers aiment avoir les papilles en feu et voyager lors d’une
      dégustation, n’hésitez pas à rajouter un piment dans votre rhum arrangé
      pour l’apprécier encore plus.",
      stars: "Les aventuriers célèbres : Jack Sparrow et Martial",
      photo_one: "https://www.effets-speciaux.info/img/photo/497-10.jpg",
      photo_two: "https://avatars.githubusercontent.com/u/10807969?v=4"

    }



    boise = {
      clef: "boise",
      family: "Boisé",
      accroche: "Vous êtes un Bucheron",
      description: "Vous aimez les balades en forêt et sentir le sapin tout en appréciant la
      force et le charactère d’un spiritueux provenant de fûts en chêne. Plus
      c’est vieux plus vous aimez.",
      stars: "Les Bucherons célèbres : Tyron et Sunny",
      photo_one: "https://www.lbvselection.com/img/cms/Tyrion%20Wine.png",
      photo_two: "https://avatars.githubusercontent.com/u/132?v=4"

    }


    animal = {
      clef: "animal",
      family: "Animal",
      accroche: "Vétérinaires",
      description: "Vous aimez monter des chevaux et nettoyer le crottin des écuries avec
      votre sac en cuir. Ne vous mentez pas à vous-mêmes, vous préférez tout
      ce qui est bestial.",
      stars: "Les Vétérinaires célèbres : Amy Winehouse et Thibaud",
      photo_one: "https://www.dailymail.co.uk/tvshowbiz/article-9817505/Amy-Winehouses-haunting-words-unearthed-tape.html",
      photo_two: "https://avatars.githubusercontent.com/u/30435844?v=4"

    }

    fruite = {
      clef: "fruite",
      family: "Fruité",
      accroche: "Maraicher",
      description: "Les vergers n’ont aucun secret pour vous, vous mangez des salades de
      fruits matin, midi et soir. Attention cependant à ne pas finir en compote.",
      stars: "Les Maraichers célèbres : Bitney Spears et Nadia",
      photo_one: 'https://medias.spotern.com/wanted/w640/74/74162-1658386405.jpg',
      photo_two: 'https://avatars.githubusercontent.com/u/54894352?v=4'
    }


    floral = {
      clef: "floral",
      family: "Floral",
      accroche: "Fleuristes",
      description: "Marguerite, Rose, Tulipe, Jasmin, Lavande, Lilas, Lisianthus... Ce ne sont
      pas les prénoms les plus portés en 2022 mais bien les arômes que vous
      appréciez dans votre spiritueux. Quel beau bouquet",
      stars: "Les fleuristes célèbres : Gatsby et Laura",
      photo_one: 'https://static.750g.com/images/1200-630/1415cc2bf4fe458c6cb743714ac5a54e/gatsby-1024x576.jpg',
      photo_two: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633938231/ycpb4rool2hxfgvybtrj.jpg'

    }



    herbace = {
      clef: "herbace",
      family: "Herbacé",
      accroche: "Dealer",
      description: "Nul besoin de décrire ce qu’est un dealer, toutes les herbes qui agitent vos
      papilles vous rendent heureux, voire stone. Attention à ne pas en abuser
      car les herbes comme l’alcool est à consommer avec modération.",
      stars: "Les Dealers célèbres : Hemingway et Jérémy",
      photo_one: 'https://www.eataly.com/wp/wp-content/uploads/2015/07/Hemingway_drink.jpg',
      photo_two: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1656901924/jzqmofhsooeqp40uwocw.jpg'
    }

    cereale = {
      clef: "cereale",
      family: "Céréale",
      accroche: "Agriculteur",
      description: "Vous êtes proches de la nature et récoltez ce que vous semez
      (essentiellement du blé, de l’orge et du malt). Vous ne dites pas non à des
      galipettes dans du foin... Cela vous rappelle cette bouteille de spiritueux
      aux arômes de biscuits et maïs qui vous met en extase",
      stars: "Les Agriculteurs célèbres : Daniel Craig et  Paul",
      photo_one: 'https://img.20mn.fr/pz_bMYKpSmq2NwrMv8lLCQ/768x492_capture-ecran-film-casino-royale-o-james-bond-incarne-daniel-craig-trinque-vodka-martini',
      photo_two: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1583704409/r5cbmwhshuvafp3v7jmm.jpg'
    }

    empyreumatique = {
      clef: "empyreumatique",
      family: "Empyreumatique",
      accroche: "Incompréhensible",
      description: "Personnes ne sait ce que ça veut dire, tout ce qu’on sait c’est que vous
      êtes gourmands : chocolat, café, toast. Un verre de votre spiritueux
      préféré peut se prendre au petit déjeuner.",
      stars: "Les Incompréhensibles célèbres : Don Draper et Cécile",
      photo_one: 'https://pinkcorn.fr/wp-content/uploads/2021/11/Sans-titre-3.jpg',
      photo_two: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1538141857/pqtix54ml90iabvewwsv.jpg'
    }

    tourbe = {
      clef: "tourbe",
      family: "Tourbé",
      accroche: "Fumiste",
      description: "Aucun rapport avec les arômes de coriandre mais soit on adore soit on
      déteste la Tourbe ! Vous êtes un fumiste, une personnes aux gouts
      hasardeux, qui mangeait de la terre étant jeune, qui met sa tête contre la
      mousse d’arbre et qui se fait des masques d’algues lors de vos vacances à
      La Baule.",
      stars: "Les Fumistes célèbres : Barney et Diane",
      photo_one:'https://www.simpsonspark.com/images/persos/contributions/barney-gumble-25364.jpg',
      photo_two:'https://avatars.githubusercontent.com/u/43373459?v=4 '
    }


    vineux = {
      clef: "vineux",
      family: "Vineux",
      accroche: "Fumiste",
      description: "Dis-moi ce que tu bois, je te dirai qui tu es, » vous buvez du
      vinaigre, vous êtes donc acide. Mais personne ne vous juge, surtout pas nous.",
      stars: "Les acides célèbres : Romain et Roger",
      photo_one: "https://phraseculte.files.wordpress.com/2017/05/f9395552e3c2c9175e614e9263eb8110.jpg?w=768",
      photo_two: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1544604383/pnqv3gmdpbtqrstpqgls.jpg",
    }

    @families = [epice, boise, animal, fruite, floral, herbace, cereale, empyreumatique, tourbe, vineux]
    @families.each { |el| @choice = el if el[:clef] == @familie_order[0].to_s }


  end


  def maindashboard

    @user = current_user
    @test = {
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

    #Pour le dashboard general
    @base = @test
    @user.experiences.each do |el|
      @base.map do |key, value|
        @base[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
      end
    end
    @user.alcool_profile.nil? ? @affichage = "d-none" || @demande = "" : @affichage = "" || @demande = "d-none"
    @popo = []
    @papa = []
    @base.each do |k, v|
      @popo << k
      @papa << v
    end

    @valued = @popo.join("-")
    @datad = @papa.join("-")

    #Pour le dashboard whisky
    @affichagew = "d-none"
    @demandew = ""
    @whisky = {}
    @test.map { |k, _| @whisky[:"#{k}"] = 0 }

    @user.experiences.each do |el|
      @whisky.map do |key, value|
        if el.spirit.category == "Whisky"
          @whisky[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichagew = ""
          @demandew = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @whisky.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuew = @popo.join("-")
    @dataw = @papa.join("-")

    #Pour le dashboard gin
    @affichageg = "d-none"
    @demandeg = ""
    @gin = {}
    @test.map { |k, _| @gin[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @gin.map do |key, value|
        if el.spirit.category == "Gin"
          @gin[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichageg = ""
          @demandeg = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @gin.each do |k, v|
      @popo << k
      @papa << v
    end
    @valueg = @popo.join("-")
    @datag = @papa.join("-")


    #Pour le dashboard rhum
    @affichager = "d-none"
    @demander = ""
    @rhum = {}
    @test.map { |k, _| @rhum[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @rhum.map do |key, value|
        if el.spirit.category == "Rhum"
          @rhum[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichager = ""
          @demander = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @rhum.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuer = @popo.join("-")
    @datar = @papa.join("-")

    #Pour le dashboard tequila

    @affichaget = "d-none"
    @demandet = ""
    @tequila = {}
    @test.map { |k, _| @tequila[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @tequila.map do |key, value|
        if el.spirit.category == "Tequila"
          @tequila[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichaget = ""
          @demandet = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @tequila.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuet = @popo.join("-")
    @datat = @papa.join("-")

    #Pour le dashboard cognac

    @affichagec = "d-none"
    @demandec = ""
    @cognac = {}
    @test.map { |k, _| @cognac[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @cognac.map do |key, value|
        if el.spirit.category == "Cognac"
          @cognac[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichagec = ""
          @demandec = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @cognac.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuec = @popo.join("-")
    @datac = @papa.join("-")


    #Pour le dashboard calvados
    @affichageca = "d-none"
    @demandeca = ""
    @calvados = {}
    @test.map { |k, _| @calvados[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @calvados.map do |key, value|
        if el.spirit.category == "Calvados"
          @calvados[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichageca = ""
          @demandeca = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @calvados.each do |k, v|
      @popo << k
      @papa << v
    end
    @valueca = @popo.join("-")
    @dataca = @papa.join("-")



    #Pour le dashboard mezcal
    @affichagem = "d-none"
    @demandem = ""
    @mezcal = {}
    @test.map { |k, _| @mezcal[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @mezcal.map do |key, value|
        if el.spirit.category == "Mezcal"
          @mezcal[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichagem = ""
          @demandem = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @mezcal.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuem = @popo.join("-")
    @datam = @papa.join("-")



    #Pour le dashboard vodka
    @affichagev = "d-none"
    @demandev = ""
    @vodka = {}
    @test.map { |k, _| @vodka[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @vodka.map do |key, value|
        if el.spirit.category == "Vodka"
          @vodka[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichagev = ""
          @demandev = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @vodka.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuev = @popo.join("-")
    @datav = @papa.join("-")

    #Pour le dashboard armagnac
    @affichagea = "d-none"
    @demandea = ""
    @armagnac = {}
    @test.map { |k, _| @armagnac[:"#{k}"] = 0 }
    @user.experiences.each do |el|
      @armagnac.map do |key, value|
        if el.spirit.category == "Armagnac"
          @armagnac[key] += ((el.spirit[:"#{key}"]).fdiv(@user.experiences.size))
          @affichagea = ""
          @demandea = "d-none"
        end
      end
    end
    @popo = []
    @papa = []
    @armagnac.each do |k, v|
      @popo << k
      @papa << v
    end
    @valuea = @popo.join("-")
    @dataa = @papa.join("-")



  end
end
