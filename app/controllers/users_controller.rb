class UsersController < ApplicationController
  def sign_out_user
    sign_out(current_user)
    redirect_to authenticated_root_path
  end
end
