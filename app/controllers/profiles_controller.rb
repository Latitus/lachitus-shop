class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_profile_path, notice: 'Your profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:address, :user_name)
  end
end
