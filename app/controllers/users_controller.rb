class UsersController < ApplicationController

  before_action :get_user, only: [:profile]

  def profile
  end

  private

  def get_user
    @user = current_user
  end
end
