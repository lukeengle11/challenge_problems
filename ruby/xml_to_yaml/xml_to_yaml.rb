require 'pp'
require 'nokogiri'
require 'yaml'
require_relative 'xml_reader'
require_relative 'yaml_writer'


class ColorSwatch
  include XMLReader, HashConverter

  attr_reader :description
  attr_reader :image

  def set_attributes(size_xml)
    puts size_xml
    if size_xml.key?("image")
      @image = size_xml.attribute("image").value
    end
  end

  def from_xml(size_xml)
    set_attributes(size_xml)
    @description = size_xml.text
  end

  def to_hash
    return {'description' => @description, 'image' => @image}
  end
end


class Size
  include XMLReader, HashConverter

  attr_reader :description
  attr_reader :color_swatches

  def initialize
    @color_swatches = Array.new
  end

  def set_attributes(size_xml)
    if size_xml.key?("description")
      @description = size_xml.attribute("description").value
    end
  end

  def from_xml(size_xml)
    set_attributes(size_xml)

    size_xml.>("color_swatch").each do |color_swatch|
      new_color_swatch = ColorSwatch.new
      new_color_swatch.from_xml(color_swatch)
      @color_swatches.append(new_color_swatch)
    end

  end

  def to_hash
    return_hash = {'description' => @description, 'color_swatches' => Array.new}
    @color_swatches.each do |color_swatch|
      return_hash['color_swatches'].append(color_swatch.to_hash)
    end
    return return_hash
  end
end

##
# Contain a single product item from a catalog
class ProductItem
  include XMLReader, HashConverter

  attr_reader :gender
  attr_reader :item_number
  attr_reader :price
  attr_reader :sizes

  def initialize
    @sizes = Array.new
  end

  def set_attributes(product_item_xml)
    if product_item_xml.key?("gender")
      @gender = product_item_xml.attribute("gender").value
    end
  end

  def from_xml(product_item_xml)
    set_attributes(product_item_xml)

    @item_number = product_item_xml.>("item_number").text
    @price = product_item_xml.>("price").text

    product_item_xml.>("size").each do |size|
      new_size = Size.new
      new_size.from_xml(size)
      @sizes.append(new_size)
    end

  end

  def to_hash
    return_hash = {'gender' => @gender, 'item_number' => @item_number, 'price' => @price, 'sizes' => Array.new}
    @sizes.each do |size|
      return_hash['sizes'].append(size.to_hash)
    end
    return return_hash
  end
end


class Product
  include XMLReader, HashConverter

  attr_reader :description
  attr_reader :product_image
  attr_reader :product_items

  def initialize
    @product_items = Array.new
  end

  def set_attributes(product_xml)
    if product_xml.key?("description")
      @description = product_xml.attribute("description").value
    end
    if product_xml.key?("product_image")
      @product_image = product_xml.attribute("product_image").value
    end
  end

  def from_xml(product_xml)
    set_attributes(product_xml)

    product_xml.>("catalog_item").each do |product_item|
      new_product_item = ProductItem.new
      new_product_item.from_xml(product_item)
      @product_items.append(new_product_item)
    end

  end

  def to_hash
    return_hash = {'description' => @description, 'product_image' => @product_image, 'product_items' => Array.new}
    @product_items.each do |product_item|
      return_hash['product_items'].append(product_item.to_hash)
    end
    return return_hash
  end
end


class Catalog
  include XMLReader, HashConverter

  attr_accessor :products

  def self.from_xml(catalog_xml)
    instance = self.new
    instance.products = Array.new
    catalog_xml.xpath("//product").each do |product|
      new_product = Product.new
      new_product.from_xml(product)
      instance.products.append(new_product)
    end
    return instance
  end

  def to_hash
    return_hash = {'products' => Array.new}
    @products.each do |product|
      return_hash['products'].append(product.to_hash)
    end
    return return_hash
  end
end

catalog_xml = File.open(File.dirname(__FILE__) + "/catalog.xml") { |f| Nokogiri::XML(f) }

catalog = Catalog.from_xml(catalog_xml)

File.open(File.dirname(__FILE__) + "/catalog.yaml", "w") do |file|
  file.write(catalog.to_hash.to_yaml)
end
