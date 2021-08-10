# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Store.destroy_all
Category.destroy_all
Product.destroy_all

stores = Store.create!([
  {
    name: "Apple",
    street: "One Infinite Loop",
    number: "3445",
    zip_code: "95014-12312",
    city: "CA",
    country: "United States"
  },
  {
    name: "Amazon",
    street: "Bellevue",
    number: "3 Apt",
    zip_code: "45687-4654",
    city: "Seatle",
    country: "United States"
  },
  {
    name: "Google",
    street: "Amphitheatre Parkway",
    number: "1600",
    zip_code: "3453-23423",
    city: "Mountain View",
    country: "United States"
  }
])

p "Created #{Store.count} stores"

categories = Category.create([
  {name: "Hardware"}, 
  {name: "Tech"},
  {name: "Service"},
  {name: "Clothes"},
  {name: "Book"},
])

p "Created #{Category.count} categories"

Keyword.create([
  {
    name: "laptop",
    category: categories[0]
  },
  {
    name: "phone",
    category: categories[0]
  },
  {
    name: "pad",
    category: categories[0]
  },
  {
    name: "asistant",
    category: categories[1]
  },
  {
    name: "web",
    category: categories[1]
  },
  {
    name: "home",
    category: categories[2]
  },
  {
    name: "domo",
    category: categories[2]
  },
  {
    name: "men",
    category: categories[3]
  },
  {
    name: "women",
    category: categories[3]
  },
  {
    name: "babys",
    category: categories[3]
  },
  {
    name: "shoes",
    category: categories[3]
  },
  {
    name: "java",
    category: categories[4]
  },
  {
    name: "php",
    category: categories[4]
  },
  {
    name: "ruby",
    category: categories[4]
  }
])

p "Created #{Keyword.count} keywords"

Product.create([
  {
    name: "Macbook Pro",
    color: "grey",
    size: "13 in",
    price: 1000,
    category: categories[0],
  },
  {
    name: "iPhone X",
    color: "black",
    size: "256 GB",
    price: 950,
    category: categories[0],
  },
  {
    name: "iPad Air",
    color: "grey spacial",
    size: "128 GB",
    price: "850",
    category: categories[0],
  },
  {
    name: "Chromecast",
    color: "black/red/white",
    size: "13.1 in",
    price: "650",
    category: categories[0],    
  },
  {
    name: "Chromebook",
    color: "black",
    size: "6 in",
    price: "35",
    category: categories[0],    
  },
  {
    name: "Echo",
    color: "multi color",
    size: "5.2 in",
    price: "70",
    category: categories[1],
  },
  {
    name: "Prime Video",
    color: "nothing",
    size: "nothing",
    price: "35",
    category: categories[2],
  },
  {
    name: "Web Services",
    color: "nothing",
    size: "nothing",
    price: "60",
    category: categories[2],    
  },
  {
    name: "Alexa",
    color: "nothing",
    size: "nothing",
    price: "60",
    category: categories[2],    
  },
  {
    name: "Nike shoes",
    color: "white/red",
    size: "8",
    price: "86",
    category: categories[3],    
  },
  {
    name: "Polo Shirts",
    color: "black",
    size: "XL",
    price: "32",
    category: categories[3],    
  },
  {
    name: "Sportswear",
    color: "white",
    size: "S",
    price: "19",
    category: categories[3],    
  },
  {
    name: "Baby Bibs",
    color: "orange",
    size: "mini",
    price: "9",
    category: categories[3],    
  },
  {
    name: "Java",
    color: "nothing",
    size: "nothing",
    price: "36",
    category: categories[4],    
  },
  {
    name: "PHP",
    color: "nothing",
    size: "nothing",
    price: "23",
    category: categories[4],    
  },
  {
    name: "Javascript",
    color: "nothing",
    size: "nothing",
    price: "18",
    category: categories[4],    
  },

])
# byebug
p "Created #{Product.count} products"
