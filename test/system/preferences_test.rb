require "application_system_test_case"

class PreferencesTest < ApplicationSystemTestCase
  test "index page preference index" do
    user = login_user
    preference1 = FactoryBot.create :preference, user: user
    preference2 = FactoryBot.create :preference, user: user
    
    visit preferences_path
    
    assert_text preference1.repayment_way
    assert_text preference2.repayment_way
  end
  
  test "Create button for preference" do
    user = login_user
    
    visit preferences_path
    #What is the different between click on / click button?
    click_on "New Preference"
    
    fill_in "Repayment way", with: "Monthly Pay"
    fill_in "Interest rate", with: 2
    fill_in "Amount", with: 200000
    fill_in "Period", with: 2
    
    click_button "Create Preference"
    
    assert_text "Preference Created."
  end
  
  test "Edit&Update page for preference" do
    user = login_user
    preference1 = FactoryBot.create :preference, user: user
    
    visit preferences_path
    
    #how can I access the pages.
    click_on preference1.repayment_way
    
    click_on "Edit"
    
    fill_in "Repayment way", with: "Monthly Pay"
    
    click_button "Update Preference"

    assert_text "Preference Updated."
    assert_text "Monthly Pay"
    
  end
  
  test "Preference show test" do
    user = login_user
    preference1 = FactoryBot.create :preference, user: user
    
    visit preferences_path
    #how can I access the pages.
    click_on preference1.repayment_way
    
    assert_text preference1.repayment_way
  end

  test "delete page for preference" do
    user = login_user
    preference1 = FactoryBot.create :preference, user: user
    
    visit preferences_path
    click_on preference1.repayment_way
    
    accept_confirm do
      click_link 'Delete'
    end
    
    assert_text "Preference deleted."
  end
end
