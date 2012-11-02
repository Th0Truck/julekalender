require 'bcrypt'
class User < ActiveRecord::Base
  has_many :answers
  attr_accessible :email, :name, :password, :password_confirmation

  validates                 :name,      :password,        :email, :presence => true
  validates_confirmation_of :password,  :password_confirmation
  validates                 :name,      :email,           :uniqueness => true
  validates_length_of       :name,      :within => 3..40, :message => 'Brugernavn skal v&aelig;re 3-40 tegn'
  validates_length_of       :password,  :within => 5..40, :message => 'Password skal v&aelig;re 5-40 tegn'
  validates_format_of       :email,     :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  before_save               :encrypt_password



  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
