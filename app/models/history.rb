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

  scope :list_private, -> { where(private: true) }
  scope :list_public, -> { where(private: false) }

  def as_json(options = {})
    options[:include] = :chapters
    model = super(options)
    model
  end

  def self.rules_of_insert
    [

    ]
  end

  def self.rules_of_update

  end

  def self.rules_of_list
    [
      SHistory::Filter
    ]
  end

end
