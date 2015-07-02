require 'minitest/autorun'
require_relative '../../lib/card.rb'

describe Card do
  describe ".new" do
    it "should add a new credit card" do
      card = Card.new("Tom", "4111111111111111", "$1000")
      card.class.must_equal Card
      card.to_s.must_equal "Tom: $0"
    end

    it "should add a new invalid credit card" do
      card = Card.new("Tom", "123", "$1000")
      card.to_s.must_equal "Tom: error"
    end
  end

  describe "#charge" do
    it "should charge credit card" do
      card = Card.new("Tom", "4111111111111111", "$1000")
      card.charge("$25")
      card.charge("$50")
      card.to_s.must_equal "Tom: $75"
    end

    it "should not allow charges over limit" do
      card = Card.new("Tom", "4111111111111111", "$1000")
      card.charge("$25")
      card.charge("$2000")
      card.to_s.must_equal "Tom: $25"
    end

    it "should not allow charges to invalid cards" do
      card = Card.new("Tom", "123", "$1000")
      card.charge("$25")
      card.to_s.must_equal "Tom: error"
    end
  end

  describe "#credit" do
    it "should credit a credit card" do
      card = Card.new("Tom", "4111111111111111", "$1000")
      card.credit("$25")
      card.to_s.must_equal "Tom: $-25"
    end

    it "should not allow credits to invalid cards" do
      card = Card.new("Tom", "123", "$1000")
      card.credit("$25")
      card.to_s.must_equal "Tom: error"
    end
  end
end
