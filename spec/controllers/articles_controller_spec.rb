require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:current_user) { subject.current_user }
  let(:language) { create(:language) }
  let(:category) { create(:category) }
  let(:valid_attributes) { attributes_for(:article, language_id: language.id, category_id: category.id) }

  describe "GET #show" do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:article) { create(:article, user_id: current_user.id) }
    before do
      sign_in user
      article
    end
    context "when author open your article's page" do
      it "don't increment on views count" do
        get :show, params: { id: article.id, locale: I18n.locale }
        expect(article.views).to eq 0
        sign_out user
      end
    end
    context "when the user open a article's that was not written by him" do
      it "increment on views count" do
        sign_out user
        sign_in user2
        get :show, params: { id: article.id, locale: I18n.locale }
        expect(Article.first.views).to eq 1
      end
    end
  end

  describe "POST #create" do
    login_user
    context "with valid params" do
      it "creates a new article" do
        expect do
          post :create, params: { article: valid_attributes, locale: I18n.locale }
        end.to change(Article, :count).by(1)
      end
      it "creates a new article with user related" do
        post :create, params: { article: valid_attributes, locale: I18n.locale }
        expect(Article.last.user).to eq current_user
      end
      it "increment a articles number of current user" do
        post :create, params: { article: valid_attributes, locale: I18n.locale }
        expect(current_user.created_articles).to eq 1
      end
    end
  end
end
