require 'rails_helper'

describe MessagesController do
  let(:chat_group) { create(:chat_group) }
  let(:user) { create(:user) }
  let(:message) { create(:message) }

  before do
    sign_in user
  end

  describe 'GET #index' do

    it "renders the :index template" do
      get :index, chat_group_id: chat_group
      expect(response).to render_template :index
    end

    it "assigns the requested messsage to @message" do
      get :index, chat_group_id: chat_group
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested chat_group to @chat_group" do
      get :index, chat_group_id: chat_group
      expect(assigns(:chat_group)).to eq chat_group
    end

  end

  describe 'Post #create' do
    context "when can be saved" do
      it "saves the new message in the datebase" do
        expect{
          post :create, message: attributes_for(:message), user_id: user, chat_group_id: chat_group
           }.to change(Message, :count).by(1)
      end

      it "redirects to messages#index" do
        post :create, message: attributes_for(:message), user_id: user, chat_group_id: chat_group
        expect(response).to redirect_to chat_group_messages_path
      end
    end

    context "when can not be saved" do
      it "does not save the new message in the database" do
        expect{
          post :create, message: attributes_for(:message, body: nil), user_id: user, chat_group_id: chat_group
           }.to change(Message, :count).by(0)
      end

      it "renders messages#index" do
        post :create, message: attributes_for(:message, body: nil), user_id: user, chat_group_id: chat_group
        expect(response).to render_template :index
      end
    end

  end
end
