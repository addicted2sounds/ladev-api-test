class User < ActiveRecord::Base
  before_create :generate_token
  validates_presence_of :username
private
  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
