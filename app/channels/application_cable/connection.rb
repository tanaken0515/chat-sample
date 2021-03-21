module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :connected_user

    def connect
      self.connected_user = User.find_by(id: cookies.encrypted[:user_id])
    end
  end
end
