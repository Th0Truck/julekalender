# encoding: utf-8
require 'bcrypt'
class User < ActiveRecord::Base
  has_many :answers

  validates                 :name,      :password,        :email, :presence => true
  validates_confirmation_of :password,  :password_confirmation
  validates                 :name,      :email,           :uniqueness => true
  validates_length_of       :name,      :within => 3..40, :message => ' -> Brugernavn skal være 3-40 tegn'
  validates_length_of       :password,  :within => 5..40, :message => ' -> Password skal være 5-40 tegn'
  validates_format_of       :email,     :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  before_save               :encrypt_password

  def answered
    answers.count
  end

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

  def self.numcorrect
    answers.where(:correct == 1).count
  end

  def admin?
    usertype == 9
  end
end
