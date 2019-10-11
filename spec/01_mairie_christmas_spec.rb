require_relative '../lib/01_mairie_christmas'

describe "arr_twon_mail method" do
  it "should return a tab of hashes" do
    expect(arr_twon_mail(["avernes","cergy"])).not_to be_nil
  end
end
