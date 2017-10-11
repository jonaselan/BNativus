require 'rails_helper'

describe OmniauthCallbacksController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      "provider" => "google_oauth2",
      "uid" => "100000000000000000000",
      "info" => {
        "name" => "John Smith",
        "email" => "john@example.com",
        # "first_name" => "John",
        # "last_name" => "Smith",
        # "image" => "https://lh4.googleusercontent.com/photo.jpg",
        # "urls" => {
        #   "google" => "https://plus.google.com/+JohnSmith"
        # }
      },
      "credentials" => {
        "token" => "TOKEN",
        # "refresh_token" => "REFRESH_TOKEN",
        "expires_at" => 1496120719,
        "expires" => true
      }
    })
  end

  describe 'GET create' do
    it 'create with datas from Google' do
      get :google_oauth2
      user = User.first
      data = request.env['omniauth.auth'].info
      expect(data.name.parameterize.underscore).to eq(user.username)
      expect(data.email).to eq(user.email)
    end

    it 'authenticates the user from Google auth' do
      get :google_oauth2
      data = request.env['omniauth.auth'].credentials
      expect(data.token).to eq('TOKEN')
      expect(data.expires_at).to eq(1496120719)
    end

    context 'when user does not exist' do
      it 'redirects to sign up' do
        OmniAuth.config.mock_auth[:google] = :invalid_credentials
        get :google_oauth2
        expect(response).to redirect_to(root_url)
      end
    end

  end
end
