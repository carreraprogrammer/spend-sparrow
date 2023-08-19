require 'rails_helper'

RSpec.describe 'Category New Page', type: :system do
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

  it 'Shows the new category page' do
    visit new_category_path
    expect(page).to have_content('NEW CATEGORY')
  end

  it 'Shows a form with a name field' do
    visit new_category_path
    expect(page).to have_field('Name')
  end

  it 'Shows a form with an icon field' do
    visit new_category_path

    expect(page).to have_css('.icon-image')
  end
end
