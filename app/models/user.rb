require 'digest/sha2'

class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :username

  def password=(pass)
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash = salt, Digest::SHA256.hexdigest(pass+salt)
  end

  def self.authenticate(username, password)    
    user = User.where('username = ?', username).first
    if user.blank? || Digest::SHA256.hexdigest(password + user.password_salt) != user.password_hash
      raise "Username or password is invalid"
    end
    user
  end

  def password
    ''
  end
end
