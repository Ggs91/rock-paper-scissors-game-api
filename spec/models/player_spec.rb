require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name)
                    .with_message('Please enter a name') }
    it { is_expected.to validate_inclusion_of(:move)
                    .in_array(Game::MOVES)
                    .with_message("Only 'rock', 'paper' and 'scissors' are accepted") }
    it { belong_to(:game) }
  end

  describe '#bot' do
    subject { described_class.new.bot }

    it { is_expected.to be_a Player }
    it { is_expected.to have_attributes(name: 'Bot') }

    it 'has valid move attribute' do
      expect(Game::MOVES). to include(described_class.new.bot.move)
    end
  end
end
