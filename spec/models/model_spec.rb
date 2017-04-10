require 'rails_helper'

RSpec.describe Model, type: :model do
  it "lives" do
    model = Model.create()
    model.name = test
    puts model.name
  end
end
