require 'rails_helper'

RSpec.describe PlayRockPaperScissors do

  describe 'when game has a winner' do
    let(:game) { create(:game, :with_players) }

    before do
      game.players.first.update(move: 'rock')
      game.players.second.update(move: 'scissors')
      PlayRockPaperScissors.new(game).perform
    end

    it "sets game's winner" do
      expect(game.winner).to eq(game.players.first)
    end

    it "sets game's played attribute to true" do
      expect(game.played).to be true
    end
  end

  describe 'when tie game' do
    let(:game) { create(:game, :with_players) }

    before do
      game.players.first.update(move: 'rock')
      game.players.second.update(move: 'rock')
      PlayRockPaperScissors.new(game).perform
    end

    it "doesn't set game's winner" do
      expect(game.winner).to be_nil
    end

    it "sets game's played attribute to true" do
      expect(game.played).to be true
    end
  end
end
