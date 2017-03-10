# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do

#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

# end
require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  # ...
  describe "when signed in as the wrong user" do
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:user_id] = @wrong_user.id
      @user = create_user 'kobe', 'kobe@lakers.com'
    end
    it "cannot access profile page another user" do
      get :show, id: @user.id
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
    it "cannot update another user" do
      patch :update, id: @user.id
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
    it "cannot destroy another user" do
      delete :destroy, id: @user.id
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end