# == Schema Information
#
# Table name: chapters
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  content     :text
#  history_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Chapter < ApplicationRecord
  belongs_to :history
end
