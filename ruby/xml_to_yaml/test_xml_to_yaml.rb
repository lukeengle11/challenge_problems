require_relative "xml_to_yaml"
require "test/unit"
require 'nokogiri'

class TestColorSwatch < Test::Unit::TestCase
  def test_from_xml
    color_swatch = ColorSwatch.new
    test_xml = '<color_swatch image="red_cardigan.jpg">Red</color_swatch>'
    xml = Nokogiri::XML(test_xml)
    color_swatch.from_xml(xml.xpath("//color_swatch")[0])
    
    assert_equal("Red", color_swatch.description)
    assert_equal("red_cardigan.jpg", color_swatch.image)
  end
end