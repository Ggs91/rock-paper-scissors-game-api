require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validations' do
    it { is_expected.to have_many(:players) }
    it { is_expected.to have_one(:winner).class_name('Player') }
  end

  describe '#result' do
    subject { game.result }

    let(:game) { create(:game) }

    context 'when game has no winner' do
      it { is_expected.to eq('tie') }
    end

    context 'when game has a winner' do
      before do
        game.winner = game.players.first
      end

      it { is_expected.to eq("#{game.players.first.name} won") }
    end
  end
end
