require 'open-uri'
require 'json'

puts "Clearing DB..."

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

# Ingredients seeding
ingredients_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
serialized_doc = JSON.parse(open(ingredients_url).read)

serialized_doc['drinks'].each { |hsh| Ingredient.create!(name: hsh['strIngredient1']) }
puts "Ingredients generated."

# Cocktails seeding
cocktail_names = %w[Cosmopolitan Mojito Margarita Californication]

cocktail_names.each { |name| Cocktail.create!(name: name) }
puts "Cocktails generated"
