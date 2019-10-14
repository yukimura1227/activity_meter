require 'rails_helper'

RSpec.describe Activist, type: :model do
  it { have_many(:daily_activity_counter) }
end
