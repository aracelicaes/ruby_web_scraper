require 'nokogiri'
require 'open-uri'
require 'colorize'

module Printer
  def self.print_all(shirt_collection)
    shirt_collection.each do |shirt|
      n = 'Item Name: '.colorize(:yellow)
      pr = 'Price: '.colorize(:red)
      u = 'Item URL: '.colorize(:magenta)
      line = '++++++++++++++++++++++++++++++++++++++++++' + "\n\n"
      puts n + shirt.item_name
      puts pr + shirt.item_price
      puts u + shirt.item_url + "\n\n"
      puts line
    end
  end
end
