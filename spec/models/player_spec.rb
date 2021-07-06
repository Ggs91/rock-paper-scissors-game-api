require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name)
                    .with_message('Please enter a name') }
    it { is_expected.to validate_inclusion_of(:move)
                    .in_array(%w(rock paper scissors))
                    .with_message("Only 'rock', 'paper' and 'scissors' are accepted") }
    it { belong_to(:game) }
  end

  describe '#bot' do
    subject { described_class.new.bot }

    it { is_expected.to be_a Player }
    it { is_expected.to have_attributes(name: 'Bot') }
    it { is_expected.to have_attributes(move: 'rock')
                    .or have_attributes(move: 'paper')
                    .or have_attributes(move: 'scissors') }
  end
end
