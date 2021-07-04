require 'rails_helper'

RSpec.describe PlayRockPaperScissors do

  subject { PlayRockPaperScissors.new(player).perform }

  let(:player) { create(:player) }

end
