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
cocktail_names = %w[cosmopolitan mojito margarita negroni caipirinha vesper paloma
                    bramble americano mai\ tai sazerac aviation gimlet bloody\ mary
                    manhattan dry\ martini]

cocktail_names.each do |name|
  pic_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
  serialized_doc = JSON.parse(open(pic_url).read)
  picture_URL = serialized_doc['drinks'].first['strDrinkThumb']

  cocktail = Cocktail.create!(name: name.capitalize, picture_URL: picture_URL)
  puts "#{cocktail.name} - created"
end
puts "Cocktails generated"
