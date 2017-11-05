module UserHelper
  def profile_incomplete?(user)
    user.avatar.blank? || user.phone.blank? || user.born_on.blank?
  end
end
