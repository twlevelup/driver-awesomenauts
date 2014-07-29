require 'driver'

RSpec.describe Driver do
  it "should honk" do
    d = Driver.new
    expect(d.honk).to eq('honk honk toot toot beep beep')
  end
end
