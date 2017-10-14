module ApplicationHelper
  def show_nav_bar?(action, controller)
    # (action == 'new' && controller == 'sessions') ||
    # (action == 'new' && controller == 'registrations')
  end

  def show_footer?(action, controller)
    (action == 'new' && controller == 'sessions') ||
    (action == 'new' && controller == 'registrations')
  end
end
