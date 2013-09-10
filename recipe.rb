class Cookbook
	def initialize name
		@name = name
		@recipes = []
	end

	def recipes
		@recipes
	end

	def add_recipe recipe
		@recipes << recipe
	end

	#1
	def remove recipe
		index = @recipes.index(recipe)
		@recipes.delete_at(index)
	end

	#2
	def random
		max = @recipes.length-1
		index = rand(0..max)
		print "You should eat "
		puts @recipes[index].title
	end

	#3
	def cook_time
		finish_time = Time.now + 3

		begin
			puts "."
		end while (Time.now < finish_time)
		puts "Done!"
	end

	#4
	def self_distruct
		100.times { puts "*"}
		puts "BOOM!"
	end

	def to_s
		@name
	end

	def list
		puts "Recipes: "

		@recipes.each do |x|
			puts x.title
			print "Ingredients: "
			puts x.ingredients.length
			print "Steps: "
			puts x.steps.length
			puts ""
		end

	end
end

class Recipe
	attr_accessor :title, :ingredients, :steps

	def initialize title, ingredients, steps
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	def to_s
		print "#{title} is made with: "
		@ingredients.each do |x|
			print x + " "
		end
		puts "\nSteps:"
		puts @steps
		puts "\n"
	end


end


# command + b  => run ruby code

mex_cuisine = Cookbook.new("Mexican Cooking")

burrito = Recipe.new("Bean and Cheese Burrito", ["tortilla", "bean", "cheese"], ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"])
chips_n_salsa = Recipe.new("Chips and Salsa", ["tortilla chips", "Salsa"], ["place chips in bowl", "pour salsa over"])
puts burrito
puts chips_n_salsa

mex_cuisine.add_recipe(burrito)
mex_cuisine.add_recipe(chips_n_salsa)
puts mex_cuisine

mex_cuisine.list


mex_cuisine.remove(burrito)

mex_cuisine.list

mex_cuisine.add_recipe(burrito)

queso = Recipe.new("Queso", ["cheese", "peppers"], ["melt cheese", "add peppers"])

mex_cuisine.add_recipe(queso)

mex_cuisine.random

mex_cuisine.cook_time

mex_cuisine.self_distruct
