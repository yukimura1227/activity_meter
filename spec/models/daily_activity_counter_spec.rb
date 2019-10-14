require 'rails_helper'

RSpec.describe DailyActivityCounter, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:activist) }
  end
end
