require 'rails_helper'

RSpec.describe PlayerInitializer do
  before(:all) do
    @initilialized_player
  end
  subject { PlayerInitializer.new(user_params).perform }

  let(:user_params) do
    {
      name: 'Ponky',
      move: 'rock'
    }
  end
  let(:invalid_name) { '' }
  let(:invalid_move) { 'Roq' }


  describe 'when invalid inputs' do

    it 'returns errors' do

    end

    context 'when no name provided' do
      before { user_params[:name] = invalid_name
               @invalid_player = Player.create(user_params)
              }

      it { is_expected.to eq(@invalid_player.errors.full_messages) }
    end

    context 'when invalid move provided' do

    end
  end
end
