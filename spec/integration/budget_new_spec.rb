require 'rails_helper'

RSpec.describe 'Budget New Page', type: :system do
  include Devise::Test::IntegrationHelpers
  let(:user) do
    User.new(name: 'John Doe', email: 'example@example.com', password: 'password')
  end

  let(:category) do
    Category.new(icon: 'https://cdn-icons-png.flaticon.com/128/4342/4342728.png', name: 'Food', user:)
  end

  before do
    sign_in(user)
    user.save!
    login_as(user)
    category.save!
  end

  it 'Shows the new budget page' do
    visit new_category_budget_path(category)
    expect(page).to have_content('NEW BUDGET')
  end

  it 'Shows a form with a name field' do
    visit new_category_budget_path(category)
    expect(page).to have_field('Budget Name')
  end

  it 'Shows a form with an amount field' do
    visit new_category_budget_path(category)
    expect(page).to have_field('Budget Amount')
  end

  it 'Shows a form with a category field' do
    visit new_category_budget_path(category)
    expect(page).to have_content('Select your Category')
  end

  context 'When form is filled out correctly' do
    it 'Creates a new budget' do
      visit new_category_budget_path(category)
      fill_in 'Budget Name', with: 'New Budget'
      fill_in 'Budget Amount', with: '100'
      select 'Food', from: 'budget_category_id'
      click_on 'SAVE'
      expect(page).to have_content('New Budget')
    end
  end

  context 'When form is filled out incorrectly' do
    it 'Show a error message without a name' do
      visit new_category_budget_path(category)
      fill_in 'Budget Name', with: ''
      fill_in 'Budget Amount', with: '100'
      select 'Food', from: 'budget_category_id'
      click_on 'SAVE'
      expect(page).to have_content("Name can't be blank")
    end

    it 'Show a error message without an amount' do
      visit new_category_budget_path(category)
      fill_in 'Budget Name', with: 'New Budget'
      fill_in 'Budget Amount', with: ''
      select 'Food', from: 'budget_category_id'
      click_on 'SAVE'
      expect(page).to have_content("Amount can't be blank")
    end

    it 'Show a error message without a category' do
      visit new_category_budget_path(category)
      fill_in 'Budget Name', with: 'New Budget'
      fill_in 'Budget Amount', with: '100'
      click_on 'SAVE'
      expect(page).to have_content('Category must exist')
    end
  end

  context 'Whent click on back button' do
    it 'Redirects to the categories page' do
      visit category_path(category)
      visit new_category_budget_path(category)
      click_link(class: 'back-button')
      expect(page).to have_content('BUDGETS')
    end
  end
end
