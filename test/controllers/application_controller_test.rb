require "test_helper"

describe ApplicationController do
  it "zomg it works" do
    get zomg_path
    must_respond_with :success
  end

  it "renders json" do
    get zomg_path
    JSON.parse(response.body).must_be_kind_of Hash
    response.header['Content-Type'].must_include 'json'
  end
end
