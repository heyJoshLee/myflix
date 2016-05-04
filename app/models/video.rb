class Video < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true


  def self.search_by_title(term)
    return [] if term.blank?
    # Solution omits 'self'
    self.where("title LIKE ?", "%#{term}%").order("created_at DESC")
  end


end