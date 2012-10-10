class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    !(@flavor == 'black licorice')
  end
end


# test
dessert1 = Dessert.new('cake', 100)
if dessert1.healthy?
  puts 'ok'
else
  puts 'error'
end
if dessert1.delicious?
  puts 'ok'
else
  puts 'error'
end

dessert2 = Dessert.new('sugar', 300)
unless dessert2.healthy?
  puts 'ok'
else
  puts 'error'
end
if dessert2.delicious?
  puts 'ok'
else
  puts 'error'
end

jelly1 = JellyBean.new('tinky', 100, 'brown')
if jelly1.healthy?
  puts 'ok'
else
  puts 'error'
end
if jelly1.delicious?
  puts 'ok'
else
  puts 'error'
end

jelly2 = JellyBean.new('tinky', 300, 'black licorice')
unless jelly2.healthy?
  puts 'ok'
else
  puts 'error'
end
unless jelly2.delicious?
  puts 'ok'
else
  puts 'error'
end

