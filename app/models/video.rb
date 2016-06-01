class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> {order("created_at DESC")}


  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :large_cover, LargeCoverUploader
  mount_uploader :small_cover, SmallCoverUploader

 
  def self.search_by_title(term)
    return [] if term.blank?
    where("title LIKE ?", "%#{term}%").order("created_at DESC")
  end


end