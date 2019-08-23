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
  has_many :chapters, dependent: :delete_all, autosave: true
  accepts_nested_attributes_for :chapters

  def as_json(options = {})
    model = super(options)
    # model[:chapters] = [self.chapters.first]
    # p model
    model
  end

end
