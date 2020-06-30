require_relative '../lib/printer'

describe Printer do
  it 'prints data to console' do
    html = 'https://www.shasa.com/mujer/ropa/tops/shasa-playeras.html?p=1'
    doc = Nokogiri::HTML(URI.open(html))

    shirt_collection = []

    doc.css('li.item .product-content').each do |shirt_data|
      new_shirt = Shirt.new(shirt_data)
      shirt_collection.push(new_shirt)
    end

    expect { Printer.print_all(shirt_collection) }.to output.to_stdout
  end
end
