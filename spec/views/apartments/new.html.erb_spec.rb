require 'rails_helper'

RSpec.describe "apartments/new", type: :view do
  before(:each) do
    assign(:apartment, Apartment.new(
      :address => "MyString",
      :city => "MyString",
      :state => "MyString"
    ))
  end

  it "renders new apartment form" do
    render

    assert_select "form[action=?][method=?]", apartments_path, "post" do

      assert_select "input[name=?]", "apartment[address]"

      assert_select "input[name=?]", "apartment[city]"

      assert_select "input[name=?]", "apartment[state]"
    end
  end
end
