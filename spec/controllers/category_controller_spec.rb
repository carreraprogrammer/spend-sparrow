require 'rails_helper'


RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.new(name: "John Doe", email: "example@example.com", password: "password")
    sign_in @user
    @user.skip_confirmation!
    @user.save!
    login_as(@user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      redirect_to categories_path
      expect(response).to have_http_status(:success)
    end
  end
end