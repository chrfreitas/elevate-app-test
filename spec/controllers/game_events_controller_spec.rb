require 'rails_helper'

RSpec.describe Api::GameEventsController, type: :request do
  describe 'POST /api/game_events' do
    let(:user) { create(:user) }

    let(:params) do
      {
        type: 'COMPLETED',
        game_name: 'GameName1',
        occurred_at: DateTime.now.utc
      }
    end

    context 'when params are valid' do
      it 'creates a GameEvent and returns status 201' do
        
        expect {
          post '/api/user/game_events', headers: { "Authorization" => "Bearer #{ AuthToken.encode(user_id: user.id)}" }, params: params
        }.to change(GameEvent, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'when params are invalid' do
      it 'does not create a GameEvent and returns status 400' do
        invalid_params = params.merge(type: "TypeTest")

        expect {
          post '/api/user/game_events', headers: { "Authorization" => "Bearer #{ AuthToken.encode(user_id: user.id)}" }, params: invalid_params
        }.not_to change(GameEvent, :count)

        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to have_key('error_message')
      end
    end
  end
end
