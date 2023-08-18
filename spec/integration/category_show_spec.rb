require 'rails_helper'

RSpec.describe "Categories", type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.new(name: "John Doe", email: "example@example.com", password: "password")}

  let(:category) { Category.new(icon: "https://cdn-icons-png.flaticon.com/128/4342/4342728.png", name: "Food", user: user)}

  let(:budget1) { Budget.new(name: "Restaurant", amount: 200, user: user, category: category) }
  let(:budget2) { Budget.new(name: "Groceries", amount: 150, user: user, category: category) }
  
  before do
    sign_in user
    user.skip_confirmation!
    user.save!
    login_as(user)
    category.save!
    budget1.save!
    budget2.save!
  end

  it 'Renders the show template' do
    visit category_path(category)
    expect(page).to have_content("BUDGETS")
  end

  it 'Shows the category icon' do
    visit category_path(category)
    expect(page).to have_selector("img[src='https://cdn-icons-png.flaticon.com/128/4342/4342728.png']")
  end

  it 'Shows the category name' do
    visit category_path(category)
    expect(page).to have_content("Food")
  end

  it 'Shows an Add new budget button' do
    visit category_path(category)
    expect(page).to have_content("NEW BUDGET")
  end
  
  it "Shows budgets ordered by the most recent" do
    visit category_path(category)
    expect(page).to have_content("Groceries")
  end

  it "Shows budgets ordered by the most recent" do
    newer_budget = Budget.new(name: "Eating Out", amount: 50, user: user, category: category)
    newer_budget.save!
  
    visit category_path(category)
  
    expect(page).to have_selector(".budget-container:nth-child(1) p", text: "Eating Out")
    expect(page).to have_selector(".budget-container:nth-child(2) p", text: "Groceries")
    expect(page).to have_selector(".budget-container:nth-child(3) p", text: "Restaurant")
  end
  
end