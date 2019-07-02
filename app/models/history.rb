class History < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :delete_all
end
