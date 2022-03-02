require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  
  test "visiting the home page" do
    visit root_url
  
    assert_selector "h1", text: "Welcome"
  end
  
  test "visiting the about page" do
    visit about_path
  
    assert_selector "h1", text: "I'm the about page!"
  end

end
