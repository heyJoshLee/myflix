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

  before_create :generate_token


  def queued_video?(video)  
    queue_items.map(&:video).include?(video)
  end

  def follows?(another_user)
    following_relationships.map(&:leader).include?(another_user)
  end

  def can_follow?(another_user)
    !(self.follows?(another_user) || self == another_user)
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end


end