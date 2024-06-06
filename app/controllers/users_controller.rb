class UsersController < ApplicationController
  def article_params
    params.require(:user).permit(:email, :encrypted_password, :media)
  end
end
