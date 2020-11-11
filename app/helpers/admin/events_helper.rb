module Admin::EventsHelper
  def is_admin?
    authenticate_user! && current_user.is_admin === true
  end
end
