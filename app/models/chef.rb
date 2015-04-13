class Chef < ActiveRecord::Base
  has_many :recipes
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length: {minimum: 3, maximum: 40} 
  VALID_EMAIL_REGEX = /\A([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)\z/i
  validates :email, presence: true, length: { maximum: 105}, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end