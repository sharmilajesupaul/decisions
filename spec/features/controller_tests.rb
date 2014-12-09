require 'spec_helper'

describe 'GET /index' do

  it 'should return a 200 status' do
    get '/'
    expect(last_response).to eq(200)
  end



end