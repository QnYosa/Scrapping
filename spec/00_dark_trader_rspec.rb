require_relative '../lib/dark_trader'

describe "the name_ method" do
  it "should return an array of currencies names not nil" do
    expect(name_(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
  end
end

describe "the price_list method" do
  it "should return an array of currencies prices not nil" do
    expect(price_list(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
  end
end

describe "the c_value method" do
  it "should return an array of hashes with currencies names and value not nil" do
    expect(c_value(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
  end
end
