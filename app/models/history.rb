# == Schema Information
#
# Table name: histories
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class History < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :delete_all

  def as_json(options = {})
    model = super(options)
    model[:chapter] = [first_chapter]
    model
  end

  def first_chapter
    chapters.first
  end
end
