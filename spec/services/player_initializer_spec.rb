require 'rails_helper'

RSpec.describe PlayerInitializer do
  subject { PlayerInitializer.new(user_params).perform }

  let(:user_params) { {
    name: 'Ponky',
    move: 'rock'
  } }
  let(:invalid_name) { '' }
  let(:invalid_move) { 'Roq' }


  describe 'when invalid inputs' do
    context 'when no name provided' do
      before { user_params[:name] = invalid_name
               @invalid_player = Player.create(name: user_params[:name], hand_move: user_params[:name])}

      it { is_expected.to eq(@invalid_player.errors.full_messages) }
    end

    context 'when invalid move provided' do

    end
  end
end
