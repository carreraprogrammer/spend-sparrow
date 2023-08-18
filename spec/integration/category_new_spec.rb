require 'rails_helper'

RSpec.describe 'Category New Page', type: :system do
  include Devise::Test::IntegrationHelpers
  let(:user) {
    User.new(name: "John Doe", email: "example@example.com", password: "password")
  }

  let(:category) { 
    Category.new(icon: "https://cdn-icons-png.flaticon.com/128/4342/4342728.png", name: "Food", user: user)
  }
  
  before do
    sign_in(user)
    user.skip_confirmation!
    user.save!
    login_as(user)
    category.save!
  end

  it 'Shows the new category page' do
    visit new_category_path
    expect(page).to have_content("NEW CATEGORY")
  end

  it 'Shows a form with a name field' do
    visit new_category_path
    expect(page).to have_field("Name")
  end

  it 'Shows a form with an icon field' do
    visit new_category_path
  
    expect(page).to have_css(".icon-options input[type='radio']")
  end

  context "When form is filled out correctly" do
    it 'Creates a new category' do
      visit new_category_path
      fill_in "Name", with: "New Category"
      choose("icon_icon1") 
      click_on "SAVE"
      expect(page).to have_content("New Category")
    end
  end

  context "When form is filled out incorrectly" do
    it 'Show a error message' do
      visit new_category_path
      fill_in "Name", with: ""
      choose("icon_icon1") 
      click_on "SAVE"
      expect(page).to have_content("Name can't be blank")
    end
  end

  context "Whent click on back button" do
    it 'Redirects to the categories page' do
      visit category_path(category)
      visit new_category_path
      click_link(class: "back-button")
      expect(page).to have_content("BUDGETS")
    end
  end
end