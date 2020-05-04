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
                    manhattan dry\ martini 747\ drink honey\ bee spice\ 75 fruit\ cooler
                    french\ martini nuked\ hot\ chocolate gin\ basil\ smash downshift
                    grim\ reaper swedish\ coffee cosmopolitan\ martini flying\ scotchman
                    caipirissima jamaica\ kiss caribbean\ boilermaker irish\ cream
                    apricot\ punch tequila\ fizz absolut\ stress\ #2 frozen\ mint\ daiquiri
                    rum\ cobbler afternoon waikiki\ beachcomber bob\ marley abc godmother
                    absolut\ sex cafe\ savoy gagliardo belgian\ blue arctic\ fish]

cocktail_names.each do |name|
  name_cap = name.split(' ').map(&:capitalize).join(' ')

  pic_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
  serialized_doc = JSON.parse(open(pic_url).read)
  picture_URL = serialized_doc['drinks'].first['strDrinkThumb']

  cocktail = Cocktail.create!(name: name_cap, picture_URL: picture_URL)
  puts "#{cocktail.name} - created"
end
puts "Cocktails generated"
