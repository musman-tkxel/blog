class RegistrationController < Devise::RegistrationsController

  def new
    @member= Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to new_member_session_path
    else
      render :action => "new"
    end
  end

  private
  def member_params
    params.require(:member).permit(:email, :password, :password_confirmation, :remember_me, :username)
  end

end