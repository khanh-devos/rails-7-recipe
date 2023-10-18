require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#user_sign_out' do
    it 'signs out the current user' do
      user = create(:user) # Assuming you have a factory for user
      sign_in(user) # Assuming you have a helper method to sign in the user

      expect(controller.current_user).to eq(user)

      get :user_sign_out

      expect(controller.current_user).to be_nil
    end

    it 'redirects to the homepage' do
      get :user_sign_out

      expect(response).to redirect_to('/')
    end
  end
end