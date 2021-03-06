require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do

    let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
      post :create, sessions: { email: user.email, password: user.password }
      expect(response.status).to eq(200)
    end

    it "returns http error" do
      post :create, sessions: { email: user.email, password: '' }
      expect(response).to render_template(:new)
    end
end

end
