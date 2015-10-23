require 'rails_helper'

describe User do

  it "has an email" do
    example_user = User.create!(email: 'example@example.com', password: 'password')
    expect(example_user.email).to eq('example@example.com')
  end

  it "has a passowrd" do
    example_user = User.create!(email: 'example@example.com', password: 'password')
    expect(example_user.password).to eq('password')
  end

end