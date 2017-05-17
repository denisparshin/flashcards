require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do

  describe "GET #twitter" do
    it "returns http success" do
      get :twitter
      expect(response).to have_http_status(:success)
    end
  end

end
