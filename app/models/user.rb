class User < ActiveRecord::Base

  has_many :reviews
  has_many :queue_items, -> {order("position")}

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  validates :full_name, presence: true, length: {minimum: 5, maximum: 50}
  validates :password, presence: true, length: {minimum: 5, maximum: 20}


  has_secure_password validations: false


  def queued_video?(video)  
    queue_items.map(&:video).include?(video)
  end


end