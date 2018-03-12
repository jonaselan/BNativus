module ApplicationHelper
  def show_nav_bar?(action, controller)
    (action == 'new' && controller == 'sessions') ||
    (action == 'new' && controller == 'registrations')
  end

  def show_footer?(action, controller)
    (action == 'new' && controller == 'sessions') ||
    (action == 'new' && controller == 'registrations')
  end

  def flash_message
    messages = ''
    %i[success info warning danger].each do |type|
      if flash[type]
        messages += "<p class=\"alert alert-#{type}\">#{flash[type]}</p>"
      end
    end
    messages
  end
end
