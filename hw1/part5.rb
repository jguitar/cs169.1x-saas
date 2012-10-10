class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name + "_history"
    class_eval %Q{
      def #{attr_name}=(value)
        #{"@" + attr_name + "_history"} = [nil] unless #{"@" + attr_name + "_history"}
        #{"@" + attr_name + "_history"} << value
      end
    }
  end
end

#test
class Foo
  attr_accessor_with_history :bar
end

class SomeOtherClass
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'
if f.bar_history == [nil, 3, :wowzo, 'boo!']
  puts 'ok'
else
  puts 'error'
end


f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f.bar = 4
if f.bar_history == [nil, 4]
  puts 'ok'
else
  puts 'error'
end


s = SomeOtherClass.new
s.foo = 2
s.bar = 3
s.foo = :home
s.foo = :back
s.bar = 'home'
s.bar = :back
if s.foo_history == [nil, 2, :home, :back]
  puts 'ok'
else
  puts 'error'
end
if s.bar_history == [nil, 3, 'home', :back]
  puts 'ok'
else
  puts 'error'
end

