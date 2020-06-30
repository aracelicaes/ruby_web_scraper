require 'nokogiri'
require 'open-uri'
require 'colorize'

class Shirt
  attr_reader :item_name, :item_price, :item_url

  def initialize(raw_info)
    @item_name = raw_info.children[3].children[1].children[0].text
    @item_price = raw_info.children[3].children[3].children[1].children[1].text
    @item_url = raw_info.children[3].children[1].children[0].attributes['href'].to_s
    name_caps
  end

  private

  def name_caps
    title = @item_name.split(' ')
    title.each(&:capitalize!)
    @item_name = title.join(' ')
  end
end
