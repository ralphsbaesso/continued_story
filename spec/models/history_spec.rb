require 'rails_helper'

RSpec.describe History, type: :model do
  let!(:user) { create(:user) }

  context 'insert' do
    it 'must crate one' do
      History.create(user: user)
      expect(History.count).to eq(1)
    end
  end
end