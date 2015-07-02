require_relative './string.rb'

class Card
  def initialize(name, number, limit)
    @name = name
    @number = number
    @is_valid = is_luhn?(number)
    @limit = limit.to_amount
    @balance = 0
  end

  def charge(amount)
    return unless @is_valid
    amount = amount.to_amount
    @balance += amount unless @balance + amount > @limit
  end

  def credit(amount)
    return unless @is_valid
    amount = amount.to_amount
    @balance -= amount
  end

  def to_s
    if @is_valid
      "#{@name}: $#{@balance}"
    else
      "#{@name}: error"
    end
  end

  private

  def is_luhn?(number)
    # http://rosettacode.org/wiki/Luhn_test_of_credit_card_numbers#Ruby

    s1 = s2 = 0
    number.to_s.reverse.chars.each_slice(2) do |odd, even|
      s1 += odd.to_i

      double = even.to_i * 2
      double -= 9 if double >= 10
      s2 += double
    end
    (s1 + s2) % 10 == 0
  end
end
