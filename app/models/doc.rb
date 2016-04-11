class Doc < ApplicationRecord
  include FriendlyId
  friendly_id :uuid
  has_paper_trail
  belongs_to :user
end
