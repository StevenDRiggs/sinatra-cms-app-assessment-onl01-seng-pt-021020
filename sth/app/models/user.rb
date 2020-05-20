class User < ActiveRecord::Base
  has_secure_password

  def logged_in=(bool)
    super(bool)

    self.save

    if bool == false
      session.clear
      redirect '/'
    # else
      # insert threaded logout timer here
    end
  end
end
