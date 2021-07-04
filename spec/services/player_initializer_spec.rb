require 'rails_helper'

RSpec.describe PlayerInitializer do

  subject { PlayerInitializer.new(user_params).perform }

  let(:user_params) do
    {
      name: 'Ponky',
      move: 'rock'
    }
  end
  let(:invalid_name) { '' }
  let(:invalid_move) { 'Roq' }

  describe 'when valid input' do
    it 'persists the player' do
      expect(subject[:player]).to be_persisted
    end

    it 'creates player with correct attributes' do
      expect(subject[:player].name).to eq('Ponky')
      expect(subject[:player].move).to eq('rock')
    end
  end

  describe 'when invalid inputs' do

    before { user_params[:name] = invalid_name }

    it "it doesn't persist the player" do
      expect(subject[:player]).not_to be_persisted
    end

    it 'contains an array of errors' do
      expect(subject[:errors]).not_to be_nil
    end

    describe 'array of errors' do
      context 'when invalid name provided' do
        let(:player_invalid_name) { Player.create(user_params) }

        it { expect(subject[:errors]).to eq(player_invalid_name.errors.full_messages) }
      end

      before { user_params[:move] = invalid_move }

      context 'when invalid name & move provided' do
        let(:player_invalid_name_and_move) { Player.create(user_params) }

        it { expect(subject[:errors]).to eq(player_invalid_name_and_move.errors.full_messages) }
      end

      before { user_params[:name] = 'Ponky' }

      context 'when invalid move provided' do
        let(:player_invalid_move) { Player.create(user_params) }

        it { expect(subject[:errors]).to eq(player_invalid_move.errors.full_messages) }
      end
    end
  end
end
