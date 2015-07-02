require 'minitest/autorun'
require_relative '../../lib/string.rb'

class TestString < MiniTest::Unit::TestCase
  def test_that_string_converts_to_amount
    assert_equal "$1234".to_amount, 1234
  end
end
