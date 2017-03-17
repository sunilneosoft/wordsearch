 require_relative "word_search.rb"
require "test/unit"

#run these test cases by using this command ruby TestMobileKeypadDecoder.rb
class WordSearchTest < Test::Unit::TestCase
  def test_number
    assert_equal(phonenumber('6686787825'),[["motor", "truck"],["motortruck"],["motor", "usual"],["noun", "struck"],["nouns", "truck"],["nouns", "usual"],["onto", "struck"]])
    assert_equal(phonenumber('2282668687'),[["act", "amounts"], ["acta", "mounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["catamounts"], ["cat", "contour"]])
    assert_equal(phonenumber('2222738275'),[["cabaret", "ark"], ["cabaret", "ask"]])
    assert_equal(phonenumber('2282668625'),[["acta", "nounal"]])
  end
end