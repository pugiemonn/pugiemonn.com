require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe 'GET #new' do
    context '未ログインユーザーがアクセスした時' do
      before { get :new }

      it 'トップへリダイレクトする' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログインユーザーがアクセスした時' do
      before do

        user = create :user
        session[:user_id] = user.id
        get :new
      end

      it '200番を返す' do
        expect(response.status).to eq(200)
      end
    end
  end

end
