require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validations' do
    subject { build(:player) }

    it { is_expected.to validate_presence_of(:name)
                    .with_message('Please enter a name') }
    it { is_expected.to validate_inclusion_of(:hand_move)
                    .in_array(%w(rock paper scissors))
                    .with_message("only 'rock', 'paper' and 'scissors' are accepted") }
    it { belong_to(:game).optional }
  end
end
