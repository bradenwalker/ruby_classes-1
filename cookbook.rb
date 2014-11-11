class Cookbook
  attr_accessor :title
  attr_accessor :recipes

  def initialize(title)
    @title = title
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    puts
    puts "Added a recipe to the collection: #{recipe.title}"
  end

  def recipe_titles
    @recipes.each do 
      |recipe| puts recipe.title
    end
  end

  def recipe_ingredients
    @recipes.each do
      |recipe| puts "These are the ingredients for #{recipe.title}: " + recipe.ingredients.to_s
    end
  end

  def print_recipe(recipe)
    stepNum = 1
    puts
    puts "Title: " + recipe.title.to_s
    puts "Ingredients: " + recipe.ingredients.join(', ')
    puts "Steps:"
    recipe.steps.each do
      |step| puts stepNum.to_s + ". " + step.to_s
      stepNum += 1
    end
  end

#  def title=(new_title)
#    @title = new_title
#  end
end

class Recipe
  attr_accessor :title
  attr_accessor :ingredients
  attr_accessor :steps

  def initialize(title, ingredients, steps)
    @title = title
    @ingredients = ingredients
    @steps = steps
  end

#  def title=(new_title)
#    @title = new_title
#  end
#
#  def ingredients=(new_ingredients)
#    @ingredients = new_ingredients
#  end
#
#  def steps=(new_steps)
#    @steps = new_steps
end