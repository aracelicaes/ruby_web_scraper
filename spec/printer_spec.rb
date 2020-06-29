require_relative '../lib/shirt'
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

describe Shirt do
  html = 'https://www.shasa.com/mujer/ropa/tops/shasa-playeras.html?p=1'
  doc = Nokogiri::HTML(URI.open(html))

  let (:raw_info) { doc.css('li.item .product-content')[0] }
  let (:new_shirt) { Shirt.new(raw_info) }
  it 'Checks that Item_Name is a String' do
    expect(new_shirt.item_name).to be_a(String)
  end

  it 'Checks that Item_Price is a String' do
    expect(new_shirt.item_price).to be_a(String)
  end

  it 'Checks that Item_URL is a String' do
    expect(new_shirt.item_url).to be_a(String)
  end

  it 'Checks that Item_Name is Capitalized' do
    expect(new_shirt.item_name).to eq(new_shirt.item_name.capitalize!)
  end
end