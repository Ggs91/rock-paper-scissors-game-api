require 'rails_helper'

RSpec.describe PlayRockPaperScissors do

  subject { PlayRockPaperScissors.new(players).perform }

  let(:players) { create(:player) }

end
