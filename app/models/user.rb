class User < ApplicationRecord
  def self.make_user
    User.create(email: "testtest@hotmail.com")
  end
end
