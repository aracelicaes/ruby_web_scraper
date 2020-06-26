require 'nokogiri'
require 'open-uri'
require 'colorize'

class Shirt
  attr_reader :item_name, :item_price, :item_url

  def the_parser(info)
    @item_name = info.children[3].children[1].children[0].text
    @item_price = info.children[3].children[3].children[1].children[1].text
    @item_url = info.children[3].children[1].children[0].attributes['href']
  end

  def initialize(raw_info)
    the_parser(raw_info)
  end
end
