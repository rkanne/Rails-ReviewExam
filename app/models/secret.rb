class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  
  # validates :content, :presence => true
	validate :expiry_date_cannot_be_in_the_past

def expiry_date_cannot_be_in_the_past
  errors.add(:content, "Date must be higher or equal to today") if !content.blank? && content < Date.today.to_s
end
end
