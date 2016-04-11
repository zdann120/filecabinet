class Doc < ApplicationRecord
  include FriendlyId
  friendly_id :uuid
  has_paper_trail
  belongs_to :user
  acts_as_punchable
  mount_uploader :file, FileUploader
  
  validates :title, presence: true
end
