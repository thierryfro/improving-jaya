require 'rails_helper'

describe "post a event", :type => :request do

before do
  headers = { "ACCEPT" => "application/json",
              "HTTP_X_HUB_SIGNATURE" => ENV['GITHUB_WEBHOOK_KEY']
            }
  post '/api/v1/events/create_event', params: { event_type: 'push', number: '123456', action: 'open' }, headers:
end

it 'returns the question' do
    expect(JSON.parse(response.body)['event_type']).to eq('push')
  end
it 'returns the question' do
    expect(JSON.parse(response.body)['number']).to eq('12345')
  end
it 'returns the question' do
    expect(JSON.parse(response.body)['action']).to eq('open')
  end
end
