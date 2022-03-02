require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Email", with: "test1@account.com"
    fill_in "Phone", with: "1234567897"
    fill_in "Password", with: "secret"
    fill_in "Confirme Password", with: "secret"
    
    click_link "Sign Up"
  
    assert_text "Account Created"
    assert_selector "nav", text:"Logout"#Button when the test success.
    refute_selector "nav", text:"Login"#Button when the test is not success.
  end
  
  test "Signing up doesn't work with errors" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Password", with: "secret"
    fill_in "Confirme Password", with: "secret"
    
    click_on "Sign Up"
  
    # assert_text "Please fix the errors below."
    assert_text "Sign Up"
    assert_selector "nav", text:"Login"
    refute_selector "nav", text:"Logout"
  end
  # This is the part that I could not understand...
  test "Login with user works" do
    user = User.new
    user.name = "Test"
    user = FactoryBot.create :user, email: "test@account.com", password: "secret"
    
    visit login_path
    
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "secret"
    
    click_on "Login"
  
    assert_text "Logged In"
    assert_selector "nav", text:"Logout"
    refute_selector "nav", text:"Login"
  end
  
  test "Login with wrong password fails" do
    user = FactoryBot.create :user, email: "test@account.com", password: "secret"

    visit login_path
    
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "opps"
    
    click_on "Login"
  
    assert_text "Invalid"
    assert_selector "nav", text:"Login"
  end
  
end
