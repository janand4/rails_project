# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create(name: "france")
Country.create(name: "italy")
Country.create(name: "spain")
Country.create(name: "united states")
Country.create(name: "united kingdom")

City.create(name: "paris", country_id: Country.find_by(name: "france").id)
City.create(name: "nice", country_id: Country.find_by(name: "france").id)
City.create(name: "lyon", country_id: Country.find_by(name: "france").id)
City.create(name: "chamonix-mont-blanc", country_id: Country.find_by(name: "france").id)
City.create(name: "versailles", country_id: Country.find_by(name: "france").id)


City.create(name: "rome", country_id: Country.find_by(name: "italy").id)
City.create(name: "venice", country_id: Country.find_by(name: "italy").id)
City.create(name: "florence", country_id: Country.find_by(name: "italy").id)
City.create(name: "naples", country_id: Country.find_by(name: "italy").id)
City.create(name: "vatican city", country_id: Country.find_by(name: "italy").id)

City.create(name: "madrid", country_id: Country.find_by(name: "spain").id)
City.create(name: "barcelona", country_id: Country.find_by(name: "spain").id)
City.create(name: "toledo", country_id: Country.find_by(name: "spain").id)
City.create(name: "granada", country_id: Country.find_by(name: "spain").id)
City.create(name: "cordoba", country_id: Country.find_by(name: "spain").id)
City.create(name: "valencia", country_id: Country.find_by(name: "spain").id)


City.create(name: "new york", country_id: Country.find_by(name: "united states").id)
City.create(name: "san francisco", country_id: Country.find_by(name: "united states").id)
City.create(name: "boston", country_id: Country.find_by(name: "united states").id)
City.create(name: "chicago", country_id: Country.find_by(name: "united states").id)
City.create(name: "los angeles", country_id: Country.find_by(name: "united states").id)
City.create(name: "las vegas", country_id: Country.find_by(name: "united states").id)
City.create(name: "houston", country_id: Country.find_by(name: "united states").id)
City.create(name: "austin", country_id: Country.find_by(name: "united states").id)

City.create(name: "london", country_id: Country.find_by(name: "united kingdom").id)
City.create(name: "oxford", country_id: Country.find_by(name: "united kingdom").id)
City.create(name: "cambridge", country_id: Country.find_by(name: "united kingdom").id)
City.create(name: "manchester", country_id: Country.find_by(name: "united kingdom").id)

# Category.create(name:"Landmarks & Historical Buildings")
# Category.create(name:"Museums")
# Category.create(name:"Castles")
# Category.create(name:"Hiking")
# Category.create(name:"Parks")
# Category.create(name:"Tours")
# Category.create(name:"Bus Tours")
# Category.create(name:"Shopping")




