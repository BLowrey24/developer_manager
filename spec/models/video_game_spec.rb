require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe 'relationships' do
    it { should belong_to :developer }
  end
end