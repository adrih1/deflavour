# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning DB"
Spirit.destroy_all
puts "DB cleaned"

puts 'Creating 6 spirits...'
spirit1 = Spirit.new({
    name: "Benromach Organic",
    category: "Whisky",
    color: "Dorée foncée",
    price: 67.00,
    producer: "Benromach",
    description: "Les distilleries du Speyside sont connues pour produire leur propre malt d'orge depuis des centaines d'années. Cachés dans des vallées reculées, les distillateurs avaient l'habitude de jeter de la tourbe sur le feu lorsque le charbon s'épuisait : aujourd'hui, cette coutume est devenue une caractéristique particulière des whiskies de la région, qui se distinguent par leur goût fumé. Les whiskies de la distillerie Benromach, appartenant à la famille Urquharts sont à classer parmi ces derniers.",
    country: "Ecosse",
    degrees: 43,
    bio: false
  })

  spirit1.save!


  spirit2 = Spirit.new({
      name: "Angostura 1919",
      category: "Rhum",
      color: "Ambrée dorée",
      price: 51.60,
      producer: "Angostura Distillery",
      description: "Angostura 1919 est un rhum traditionnel originaire de l'île de Trinidad par la Distillerie Angostura internationalement connue pour son bitter. Son nom fait référence à l'histoire de la Distillerie qui en 1932 rachète de fûts suite à un incendie dans les entrepôts des douanes. Il se trouve que les fûts contenaient des rhums de 1919. Après tant d'année dans un flacon aux épaules carrées, la distillerie a décidée de changer pour une bouteille aux formes arrondies et élégantes.",
      country: "Trinité-Et-Tobago",
      degrees: 40,
      bio: false
    })

    spirit2.save!


spirit3 = Spirit.new({
    name: "Père Labat Rhum Blanc",
    category: "Rhum",
    color: "Incolore",
    price: 29.00,
    producer: "Pere Labat",
    description: "Fameux rhum de Marie-Galante en Guadeloupe, il rend hommage au Père Labat qui fut pionnier dans les techniques d'élaboration du rhum au XVIIe siècle. Élaboré selon des méthodes artisanales de distillation, ce rhum agricole est fabriqué à partir de pur jus de canne. Végétal et intense, il est concentré en arômes.",
    country: "France",
    degrees: 59,
    bio: false
  })

  spirit3.save!

  spirit4 = Spirit.new({
    name: "Inverroche Classic Gin",
    category: "Gin",
    color: "Incolore",
    price: 52.00,
    producer: "Inverroche",
    description: "Un gin d'Afrique du Sud vif et frais réalisé entre autres avec des plantes de la région, appelées fynbos. Récoltées à la main, elles donnent à ce spiritueux un profil aromatique singulier. Un bouquet d'agrumes, de pétales de rose et de fleurs d'oranger...",
    country: "Afrique Du Sud",
    degrees: 43,
    bio: false
  })

    spirit4.save!


spirit5 = Spirit.new({
    name: "Del Maguey Vida",
    category: "Mezcal",
    color: "Incolore",
    price: 48.00,
    producer: "Del Maguey",
    description: "Ce mezclal Vida est produit par Del Maguey, spécialiste reconnu dans la fabrication du Mezcal mexicain. Le Mezcal Vida 100 % agave de la variété « espadin » et certifié bio est distillé deux fois. Il s'en dégage des notes médicinales et légèrement fumées. Il est marqué par des notes de fruits rouges, d'épices, de fleurs et même de sapin. Il est ensuite mis en bouteille à 42°C sans être mélangé, selon une tradition séculaire vieille de 400 ans. Il s'agit de l'un des rares mezcals traditionnels produits de façon continue.",
    country: "Mexique",
    degrees: 42,
    bio: true
  })

  spirit5.save!



spirit6 = Spirit.new({
    name: "Rémy Martin 1738 Accord Royal",
    category: "Cognac",
    color: "Cuivrée",
    price: 55.79,
    producer: "Rémy Martin",
    description: "Ce cognac réalisé par le maître de chai Georges Clot est inspiré des techniques pionnières de la maison : des eaux-de-vie distillées sur lies dans de petits alambics en cuivre et vieillies en fûts de chênes toastés de la forêt du Limousin sont utilisées.",
    country: "France",
    degrees: 43,
    bio: false
  })

  spirit6.save!

puts 'Finished!'
