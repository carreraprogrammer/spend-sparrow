require 'rails_helper'

RSpec.describe 'Category Index Page', type: :system do
  include Devise::Test::IntegrationHelpers
  let(:user) do
    User.new(name: 'John Doe', email: 'example@gmail.com', password: 'password')
  end

  let(:category) { Category.new(icon: 'https://cdn-icons-png.flaticon.com/128/4342/4342728.png', name: 'Food', user:) }

  before do
    user.skip_confirmation!
    user.save!
    login_as(user)
    category.save!
  end

  it 'Shows the categories page' do
    visit categories_path
    expect(page).to have_content('CATEGORIES')
  end

  it 'Shows categorie icon' do
    visit categories_path
    expect(page).to have_selector("img[src='https://cdn-icons-png.flaticon.com/128/4342/4342728.png']")
  end

  it 'Shows categorie name' do
    visit categories_path
    expect(page).to have_content('Food')
  end

  it 'Shows categorie date' do
    visit categories_path
    expect(page).to have_content(category.date)
  end

  it 'Shows categorie total' do
    visit categories_path
    expect(page).to have_content(category.total)
  end

  context 'When clicking on a category' do
    it 'Shows the category page' do
      visit categories_path
      click_link 'Food'
      expect(page).to have_content('BUDGETS')
    end
  end

  context 'When clicking new category' do
    it 'Shows the new category page' do
      visit categories_path
      click_link 'NEW CATEGORY'
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
