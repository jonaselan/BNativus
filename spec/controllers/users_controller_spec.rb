require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:current_user) { subject.current_user }
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { attributes_for(:user, email: '') }

  describe "GET #show" do
    login_user
    it "returns a success response" do
      get :show, params: { id: current_user, locale: I18n.locale }
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    login_user
    it "returns a success response" do
      get :edit, params: { id: current_user, locale: I18n.locale }
      expect(response).to be_success
    end
  end

  describe "PUT #update" do
    login_user
    context "with valid params" do
      let(:new_attributes) do
        { username: "sim" }
      end

      it "updates the requested user" do
        put :update, params: { id: current_user, user: new_attributes, locale: I18n.locale }
        current_user.reload
        expect(current_user.username).to eq('sim')
      end

      it "redirects to the user" do
        put :update, params: { id: current_user, user: new_attributes, locale: I18n.locale }
        current_user.reload
        expect(response).to redirect_to user_path(current_user)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        put :update, params: { id: current_user, user: invalid_attributes, locale: I18n.locale }
        expect(response).to be_success
      end
    end
  end
end
