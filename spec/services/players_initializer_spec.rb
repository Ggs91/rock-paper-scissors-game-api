require 'rails_helper'

RSpec.describe PlayersInitializer do

  subject { PlayersInitializer.new(player_params).perform }

  let(:player_params) do
    {
      name: 'Ponky',
      move: 'rock'
    }
  end
  let(:invalid_name) { '' }
  let(:invalid_move) { 'Roq' }

  describe 'when valid inputs' do
    it 'persists the players' do
      expect(subject[:players][:player_1]).to be_persisted
      expect(subject[:players][:player_2]).to be_persisted
    end

    it 'creates player with correct attributes' do
      expect(subject[:players][:player_1].name).to eq('Ponky')
      expect(subject[:players][:player_1].move).to eq('rock')
    end
  end

  describe 'when invalid inputs' do

    before { player_params[:name] = invalid_name }

    it "it doesn't persists the player" do
      expect(subject[:players][:player_1]).not_to be_persisted
    end

    it "it doesn't creates the bot" do
      expect(subject[:players][:player_2]).to be_nil
    end

    it 'contains an array of errors' do
      expect(subject[:errors]).not_to be_nil
    end

    describe 'array of errors' do
      context 'when invalid name provided' do
        let(:player_invalid_name) { Player.create(player_params) }

        it { expect(subject[:errors]).to eq(player_invalid_name.errors.full_messages) }
      end

      before { player_params[:move] = invalid_move }

      context 'when invalid name & move provided' do
        let(:player_invalid_name_and_move) { Player.create(player_params) }

        it { expect(subject[:errors]).to eq(player_invalid_name_and_move.errors.full_messages) }
      end

      before { player_params[:name] = 'Ponky' }

      context 'when invalid move provided' do
        let(:player_invalid_move) { Player.create(player_params) }

        it { expect(subject[:errors]).to eq(player_invalid_move.errors.full_messages) }
      end
    end
  end
end
