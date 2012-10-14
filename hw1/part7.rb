class CartesianProduct
  include Enumerable

  def initialize(collection1, collection2)
    @collection1 = collection1
    @collection2 = collection2
  end

  def each
    @collection1.each do |valueA|
      @collection2.each do |valueB|
        yield([valueA, valueB])
      end
    end
  end
end


# test
puts 'Sample1'
c = CartesianProduct.new([:a, :b], [4, 5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

puts ''
puts 'Sample2'
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty

puts ''
puts 'Sample3'
c = CartesianProduct.new([:a, :b, :c], [4, 5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
