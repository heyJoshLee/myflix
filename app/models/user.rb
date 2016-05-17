class User < ActiveRecord::Base

  has_many :reviews, -> {order("created_at DESC")}
  has_many :queue_items, -> {order("position")}
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  validates :full_name, presence: true, length: {minimum: 5, maximum: 50}
  validates :password, presence: true, length: {minimum: 5, maximum: 20}


  has_secure_password validations: false


  def queued_video?(video)  
    queue_items.map(&:video).include?(video)
  end


end