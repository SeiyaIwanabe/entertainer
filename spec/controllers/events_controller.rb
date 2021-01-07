require 'rails_helper'

describe EventsController do
  before do
    @user = create(:user)
    @event = create(:event)
  end

  # describe 'GET #new' do
  #   it "renders the :new template" do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  # end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end