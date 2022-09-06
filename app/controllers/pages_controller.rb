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
      Review.create(rating: 5, user: @user, spirit: el.spirit) if @user.reviews.select { |review| review.spirit.name.include?(el.spirit.name) }.empty?
    end
    @user.experiences.each do |el|

      @base.map do |key, value|
        multiple = Review.find_by(user: @user, spirit: el.spirit).rating / 5
        @base[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
      end
    end

    profile = @base
    AlcoolProfile.create(user: @user) if @user.alcool_profile.nil?
    profile.each { |k, v| @user.alcool_profile[:"#{k}"] = v } unless profile.reject { |k, v| v == @user.alcool_profile[:"#{k}"]}.empty?

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
        diff = ((value - spirit[:"#{key}"]))
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
      @result.reject{ |k, v| @forbidden.include?(("#{k}").to_i) }.sort_by { |_, v| v }.first(5).map(&:first).each do |k, v|
        Recommendation.create(spirit: Spirit.find("#{k}"), user: @user, percentages: (100 - @result[k].round(2)))
      end
    end

    epice = {
      clef: "epice",
      family: "Épice",
      accroche: "Vous êtes un Aventurier",
      description: "Les spiritueux épicés sont des spiritueux auxquels ont été associées des épices telles que la cannelle, la muscade, du poivre, de la vanille... Ce mariage heureux a pour effet de produire des spiritueux très doux et incroyablement ronds en bouche, qui sont également très appréciés comme base de cocktails",
      stars: "Un Aventurier célèbre : Jack Sparrow",
      photo_one: "https://www.effets-speciaux.info/img/photo/497-10.jpg",

    }



    boise = {
      clef: "boise",
      family: "Boisé",
      accroche: "Vous êtes Bucheron",
      description: "Ses saveurs de pin, de cire et de  lui donnent un côté très nature. Ces arômes acquis grâce à une maturation en fut de chêne permet d'obtenir un spiritueux de charactère et rond.",
      stars: "Un Bucheron célèbre : Tyron Lannister",
      photo_one: "https://www.lbvselection.com/img/cms/Tyrion%20Wine.png",

    }


    animal = {
      clef: "animal",
      family: "Animal",
      accroche: "Vous êtes Vétérinaire",
      description: "Les spiritueux au profil animal procure un spiritueux très rond rappelant le cuir ou les écuries, un charactère unique qui reste en bouch",
      stars: "Une Vétérinaire célèbre : Amy Winehouse",
      photo_one: "https://www.dailymail.co.uk/tvshowbiz/article-9817505/Amy-Winehouses-haunting-words-unearthed-tape.html",
    }

    fruite = {
      clef: "fruite",
      family: "Fruité",
      accroche: "Vous êtes Maraicher",
      description: "Que vous soyez plutôt fruits secs, fruits rouges, fruits exotiques ou agrumes,
      un spiritueux fruité pourra vous offrir toutes ces saveurs en une seule gorgée. Cela lui donne un côté rond très apprécié par les gourmands",
      stars: "Une Maraichere célèbre : Britney Spears",
      photo_one: 'https://www.dhnet.be/resizer/QpXlM-j5wwUosOJBo9Fbv3Tl5S0=/0x0:2192x1460/768x512/cloudfront-eu-central-1.images.arcpublishing.com/ipmgroup/O53EYCBHXBEVJI6KGDXNKTULEY.jpg',
    }


    floral = {
      clef: "floral",
      family: "Floral",
      accroche: "Vous êtes Fleuriste",
      description: "Ces spiritueux seront très appréciés par celles et ceux qui recherchent de la légèreté.
      À la dégustation vous retrouverez des saveurs prinanières, non sans rappeler la lavande, la menthe ou encore la violette",
      stars: "Un fleuriste célèbre : Gatsby",
      photo_one: 'https://static.750g.com/images/1200-630/1415cc2bf4fe458c6cb743714ac5a54e/gatsby-1024x576.jpg',
    }



    herbace = {
      clef: "herbace",
      family: "Herbacé",
      accroche: "Vous êtes Herboriste",
      description: "Ces spiritueux sont un voyage sur les plaines alpines. En bouche, son bouquet aromatique procure une fraicheur inélgalée. Les Gin sont généralement les spiritueux les plus herbacés ",
      stars: "Un Herboriste célèbre : Hemingway",
      photo_one: 'https://www.eataly.com/wp/wp-content/uploads/2015/07/Hemingway_drink.jpg',
    }

    cereale = {
      clef: "cereale",
      family: "Céréale",
      accroche: "Vous êtes Agriculteur",
      description: "Ses arômes de malt, d'orge et de blé apportent douceur à ces spiritueux avec une légère aspérité. Les matières premieres utilisées sont la raison de ces saveurs champêtres.",
      stars: "Un Agriculteur célèbre : Daniel Craig et  Paul",
      photo_one: 'https://img.20mn.fr/pz_bMYKpSmq2NwrMv8lLCQ/768x492_capture-ecran-film-casino-royale-o-james-bond-incarne-daniel-craig-trinque-vodka-martini',

    }

    empyreumatique = {
      clef: "empyreumatique",
      family: "Empyreumatique",
      accroche: "Vous êtes Enigmatique ",
      description: "Sous ce mot savant se cachent des notes gourmandes, de chocolat, de café et de pain toasté. Ces spiritueux procurent un doux plaisir.",
      stars: "Un Enigmatique célèbre : Don Draper",
      photo_one: 'https://pinkcorn.fr/wp-content/uploads/2021/11/Sans-titre-3.jpg',
    }

    tourbe = {
      clef: "tourbe",
      family: "Tourbé",
      accroche: "Vous êtes Connaisseur",
      description: "On parle aussi de whisky fumé, dont les saveurs peuvent être associées à l’iode, à l’air marin, à de la mousse ou à des racines. On peut aussi l’associer à de l’encens, ce qui peut lui donner un petit côté médicinal",
      stars: "Un Connaisseur célèbre : Winston Churchill",
      photo_one:'https://www.generations-plus.ch/sites/default/files/styles/image_principal_article/public/article/field/image/winston.jpg?itok=xrh-Mhwp',

    }


    vineux = {
      clef: "vineux",
      family: "Vineux",
      accroche: "Vous êtes Surprenant",
      description: "Les spiritueux vineux sont souvet mal associé au vinaigre, cette acidité que vous aimé provient des barrique contenant du Xérès ou du Porto, dans lequel a été maturé vos spiritueux préférés",
      stars: "Les acides célèbres : Serge Gainsbourg",
      photo_one: "https://img-3.journaldesfemmes.fr/gY6uYRUbjqNf3z7Os-ItWJeC5l8=/1500x/smart/4fe5699682ec4b40acda85cef5bff9a3/ccmcms-jdf/27506355.jpg",
    }

    @families = [epice, boise, animal, fruite, floral, herbace, cereale, empyreumatique, tourbe, vineux]
    @choice = boise
    @families.each do |el|
      @choice = el if el[:clef] == @familie_order[0].to_s
    end
    @choice.each do |k, v|
      @user.alcool_profile["#{k.to_sym}"] = v
      @user.alcool_profile.save
    end
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
        multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5
        @base[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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

          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @whisky[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @gin[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @rhum[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @tequila[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @cognac[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @calvados[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @mezcal[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @vodka[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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
          multiple = (@user.reviews.select{ |review| review.spirit == el.spirit }[0].rating) / 5

          @armagnac[key] += (((el.spirit[:"#{key}"]) * multiple ).fdiv(@user.experiences.size + (multiple > 0 ? multiple : multiple * (-1) )))
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


    def reco_modal(alcool_category)
      unless @user.experiences.empty?
        @forbidden = []
        resueach = @result
        @user.orders.each { |el| @forbidden << el.spirit.id } unless @user.orders.empty?
        @user.experiences.each { |el| @forbidden << el.spirit.id } unless @user.experiences.empty?
        @user.recommendations.each { |el| @forbidden << el.spirit.id } unless @user.recommendations.empty?
        return resueach.reject{ |k, v| @forbidden.include?(k) }.select { |k, v| Spirit.find("#{k}").category == alcool_category }.sort_by { |_, v| v }.first(3).map(&:first).each do |k, v|
        end
      end
    end

    @modal_whisky = reco_modal('Whisky')
    @modal_armagnac = reco_modal('Armagnac')
    @modal_vodka = reco_modal('Vodka')
    @modal_gin = reco_modal('Gin')
    @modal_cognac = reco_modal('Cognac')
    @modal_calvados = reco_modal('Clavados')
    @modal_rhum = reco_modal('Rhum')
    @modal_tequila = reco_modal('Tequila')
    @modal_mezcal = reco_modal('Mezcal')

    def alcool_aromas(alcool_category)
      sum = []
      total = {}
      spirits = []
      User.last.experiences.each{ |recommendation| spirits << recommendation.spirit if recommendation.spirit.category == alcool_category }
      spirits.each do |spirit|
        spirit.aromas.each { |aroma| sum << aroma}
      end
      sum.each { |v| total.store(v, total[v].nil? ? total[v] = 0 : total[v] + 1) }
      return total.sort_by { |_, v| -v }.first(4)
    end

    @aromas_whisky = alcool_aromas('Whisky')
    @aromas_armagnac = alcool_aromas('Armagnac')
    @aromas_vodka = alcool_aromas('Vodka')
    @aromas_gin = alcool_aromas('Gin')
    @aromas_cognac = alcool_aromas('Cognac')
    @aromas_calvados = alcool_aromas('Clavados')
    @aromas_rhum = alcool_aromas('Rhum')
    @aromas_tequila = alcool_aromas('Tequila')
    @aromas_mezcal = alcool_aromas('Mezcal')
  end
end
