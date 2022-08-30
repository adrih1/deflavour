# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "nokogiri"

puts "Cleaning DB"
SpiritAroma.destroy_all
Aroma.destroy_all
Family.destroy_all
Spirit.destroy_all
puts "DB cleaned"





# Hash data regroupant toute les données. Clefs: Nom de la famille, Valueurs: un hash qui pour clefs: descriptions et aromes. Respectivement pour valeur string et array.

data = {

  "Vineux" => { description: "coucou",
    aromas: ["Résine",	"Sherry",	"Balsamique",	"Porto",	"Xeres"]},
  "Epicée"	=> { description: "coucou",
    aromas: ["Canelle",	"Clou de girofle",	"Graine de coriandre",	"Noix de muscade",	"Poivre",	"Gingembre ",	"Anis",	"Curry",	"Safran",	"Piment",	"Epice"]},
  "Boisé" => { description: "coucou",
    aromas: [	"Pin ",	"Cedre",	"Bois de santal",	"Chêne",	"Encens",	"bote à cigare",	"Bois brulé",	"Tannique",	"Réglisse"]},
  "Animale" => { description: "coucou",
    aromas:	["Cuir",	"Musc"]},
  "Noix" => { description: "coucou",
    aromas:	["Noix de muscade",	"Noisette",	"amande",	"Nois de coco"]},
  "Sucré" =>	{ description: "coucou",
    aromas: ["Cacahuette",	"Vanille",	"Miel",	"Caramel"]},
  "Fruité" =>	{ description: "coucou",
    aromas: ["Citron vert",	"Citron",	"Pamplemousse",	"Mandarine",	"Ecorce d'orange",	"Peau d'orange",	"Bergamotte",	"Goyave",	"Melon",	"Mangue",	"Banane",	"Ananas",	"Fruit de la passion",	"Kiwi",	"Poire ",	"Pomme verte",	"Pomme",	"Cerise",	"Peche",	"Prune",	"abricot",	"Framboise",	"Cassis",	"Müre",	"Fruis noirs",	"Fraises",	"Myrtille",	"Groseille",	"Canneberge",	"Pruneau",	"Figue sèche",	"abricot sec",	"Compote",	"Confiture",	"Marmelade"]},
  "Floral" =>	{ description: "coucou",
    aromas: ["Fleur d'oranger",	"Rose",	"Bruyère",	"Géranium",	"Lavande ",	"Violette",	"Marguerite",	"pétunia",	"fleur de vigne",	"Iris",	"Lilas",	"œillet",	"Jasmin",	"Fleur d'oranger",	"Chevrefeuille",	"Mentholé",	"Menthe",	"Cire d'abeille"]},
  "Herbacé"	=> { description: "coucou",
    aromas: ["Herbe coupée",	"Fougère",	"Menthe",	"Eucalyptus",	"Genévrier",	"Feuille de cassis",	"Feuille de laurier",	"Basilique",	"Herbe fraiche",	"Canne fraiche",	"Sous-bois",	"Feuillage",	"Fenouille",	"Celery",	"Aneth"]},
  "Céréale" =>	{ description: "coucou",
    aromas: ["Pomme de terre",	"Foin",	"Malt",	"Biscuit",	"Maïs"]},
  "Empyreumatique" =>	{ description: "coucou",
    aromas: ["Toast",	"Chocolat",	"Café",	"Pain grillé",	"Caramel",	"Cacao",	"Pain"]},
  "Tourbé" =>	{ description: "coucou",
    aromas: ["Terre",	"Mouse d'arbre",	"Fumé",	"Médicinal",	"Vieux bandage",	"Bacon",	"caoutchouc",	"goudron",	"silex",	"algues",	"iode",	"fruits de mer",	"Kérosène",	"Fumé"]},

}

puts "Creating Families and Aromas"
# Iterating through the hash to create the family and the aroma.
data.each do |family, infos|
  family = Family.create!(name: family, description: infos[:description])
  infos[:aromas].each do |aroma|
    Aroma.create!(name: aroma, family: family)
  end
end
puts "Families and Aromas created"

puts 'Scraping spirits'
i = 1
# permet de changer de page
while i <= 1

  # find image url
  def liquor_image(element)
    element.search('.lazy').each do |e|
     return e.attribute('data-src').text
    end
  end

 # Scrap country
  def scrape_liquor_country(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.search("#elaboration-collapsible").each do |element|
    result = element.at('meta').attribute('content').value.split(":")[6]
    split_result = result.split(" ")[0] if result && result.include?(" ")
    return  split_result
    end
  end


  # Scrap aromas
  def scrape_liquor_aromas(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.search("#elaboration-collapsible").each do |element|
      return "#{element.at('meta').attribute('content').value.split(":")[4].strip}"
    end
  end

  # #scrap if bio
  # def bio?(url)
  #   html = URI.open(url)
  #   doc = Nokogiri::HTML(html)
  #   doc.search(".bio").each do |element|
  #     return true if element
  #   end
  # end

  # scrap colors
  def scrape_liquor_colors(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.search("#elaboration-collapsible").each do |element|
      return "#{element.at('meta').attribute('content').value.split(":")[2].strip.split(".")[0]}"
    end
  end

  # scrap degrees
  def scrape_liquor_degrees(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.search("#elaboration-collapsible").each do |element|
      return "#{element.at('meta').attribute('content').value.split(":")[8]}"
    end
  end

  #scrap description
  def scrape_liquor_description(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.search(".text-read-more").each do |element|
      return "#{element.text.strip}"
    end
  end

  #scrap price
  def scrape_liquor_price(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    doc.search(".price").each do |element|
      return "#{element.text.strip}"
    end
  end



  # scrap drinksco
  html_content = URI.open("https://www.drinksco.fr/spiritueux:#{i}").read
  doc = Nokogiri::HTML(html_content)

  doc.search('.image').each do |element|
    liquor_url = element.at('.image-wrapper').children.attribute('href').value
    spirit = Spirit.new({

      name: element.at('.image-wrapper').children.attribute('data-name').value,
      category: element.at('.image-wrapper').children.attribute('data-category').value,
      price:  scrape_liquor_price(liquor_url).to_i,
      producer: element.at('.image-wrapper').children.attribute('data-cellar').value,
      description: scrape_liquor_description(liquor_url),
      color: scrape_liquor_colors(liquor_url),
      image_url: liquor_image(element),
      country: scrape_liquor_country(liquor_url),
      degrees: scrape_liquor_degrees(liquor_url).to_i,

    })
    spirit.save!

    spirit_aroma = scrape_liquor_aromas(liquor_url).downcase

    Aroma.all.each do |aroma|
      if  spirit_aroma.include?(aroma.name.downcase)
        SpiritAroma.create(spirit: spirit, aroma: aroma)
      end
    end
    # bio = bio?(liquor_url)
    # p aromas
  end
  i += 1
end

puts 'Finished!'
