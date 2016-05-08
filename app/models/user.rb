class User < ActiveRecord::Base

  has_many :reviews

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  validates :full_name, presence: true, length: {minimum: 5, maximum: 50}
  validates :password, presence: true, length: {minimum: 5, maximum: 20}


  has_secure_password validations: false


end