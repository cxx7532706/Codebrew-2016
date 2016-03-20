module UsersHelper

  def self.setCurr current_user
    @current_user = current_user
  end

  def self.current_user
    @current_user
  end

end
