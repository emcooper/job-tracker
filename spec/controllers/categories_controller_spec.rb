require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #title=string" do
    it "returns http success" do
      get :title=string
      expect(response).to have_http_status(:success)
    end
  end

end
