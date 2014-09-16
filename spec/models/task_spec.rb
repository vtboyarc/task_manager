require 'rails_helper'

describe Task do
  it "should create a new instance of a user" do
    @user = User.new({:name => "Tony"})
    expect(@user.name).to eql("Tony")
  end
end
