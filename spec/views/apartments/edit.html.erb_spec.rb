require 'rails_helper'

RSpec.describe "apartments/edit", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :address => "MyString",
      :city => "MyString",
      :state => "MyString"
    ))
  end

  it "renders the edit apartment form" do
    render

    assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do

      assert_select "input[name=?]", "apartment[address]"

      assert_select "input[name=?]", "apartment[city]"

      assert_select "input[name=?]", "apartment[state]"
    end
  end
end
