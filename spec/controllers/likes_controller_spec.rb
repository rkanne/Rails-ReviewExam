# require 'rails_helper'
# RSpec.describe LikesController, type: :controller do
#   before do
#     # // your code here
#     @user = create_user
#   end
#   describe "when not logged in" do
#     # // your code here
#     before do
#       session[:user_id] = nil
#     end
#     it "cannot like" do
#       post :index
#       expect(response).to redirect_to('/sessions/new')
#     end
#     it "cannot unlike" do
#       post :destroy
#       expect(response).to redirect_to('/sessions/new')
#     end
#   end
# end

require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  # ...
  describe "when signed in as the wrong user" do
    # your code here
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      @right_user = create_user 'tim', 'tim@dojo.com'
      session[:user_id] = @right_user.id
      @secret1 = Secret.create(content: "This is a secret", user_id: @right_user.id)
      @secret2 = Secret.create(content: "This is another secret", user_id: @right_user.id)
      secret = Secret.where(user_id: session[:user_id])
      if secret.each do |x| 
        @like = Like.create(secret_id: x.id, user_id:@right_user.id)  
      end
    end 
  end
     it "cannot unlike a secret made by another user" do
      post :destroy, secret_id: @secret1.id, user_id: @wrong_user.id
      expect(response).to redirect_to("/secrets")
    end
  end 
end