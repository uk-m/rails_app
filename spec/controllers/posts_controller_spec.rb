require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    context "認証済みのユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
      end
      
      it "正常にレスポンスを返すこと" do
        sign_in @user
        get :index
        expect(response).to be_successful
      end
      
      it "200レスポンスを返すこと" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end
    
    context "ゲストとして" do
      it "302レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "302"
      end
    end
  end
  
  describe "#create" do
    context "ゲストとして" do
      it "302レスポンスを返すこと" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: { post: post_params }
        expect(response).to have_http_status "302"
      end
    end
  end
end
