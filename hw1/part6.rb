class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      nil
    end
  end
end

class String
  def palindrome?
    only_letters = gsub(/\W/, '').downcase
    only_letters == only_letters.reverse
  end
end

module Enumerable
  def palindrome?
    self == reverse if respond_to? :reverse
  end
end


# test
if 1.euro == 1.292
  puts 'ok'
else
  puts 'error'
end

val = 1.euro.in(:dollars)
if val == 1.292
  puts 'ok'
else
  puts 'error' + val.to_s
end

if 1.euro.in(:dollar) == 1.292
  puts 'ok'
else
  puts 'error'
end

if 1.euros.in(:dollars) == 1.292
  puts 'ok'
else
  puts 'error'
end

val = 1.dollar.in(:rupees)
if val.to_s == '52.6315789473684'
  puts 'ok'
else
  puts 'error' + val.to_s
end

val = 10.rupees.in(:euro)
if val.to_s == '0.147058823529412'
  puts 'ok'
else
  puts 'error' + val.to_s
end

val = 1.dollar.in(:euros)
if val.to_s == '0.773993808049536'
  puts 'ok'
else
  puts 'error' + val.to_s
end


# test palindrome?

if "there goes the neighborhood".palindrome?
  puts 'Error'
else
  puts 'Ok'
end

if "Madam, I'm Adam!".palindrome?
  puts 'Ok'
else
  puts 'Error'
end

if "A man, a plan, a canal -- Panama".palindrome?
  puts 'Ok'
else
  puts 'Error'
end

if "Abracadabra".palindrome?
  puts 'Error'
else
  puts 'Ok'
end


# test Enumerable.palindrome?

if [1, 2, 3, 2, 1].palindrome?
  puts 'ok'
else
  puts 'error'
end

unless [1, 4, 3, 2, 1].palindrome?
  puts 'ok'
else
  puts 'error'
end


unless {"hello"=> "world"}.palindrome?
  puts 'ok'
else
  puts 'error'
end

unless (1..2).palindrome?
  puts 'ok'
else
  puts 'error'
end