module UserHelper
  def profile_incomplete?(user)
    user.avatar.empty? || user.phone.empty? || user.city.empty? || user.bith_date.empty?
  end
end
