require 'rails_helper'
RSpec.describe 'Routing', type: :routing do
  it 'routes to users #create via POST ' do
    expect(post: 'api/v1/users').to route_to('api/v1/users#create')
  end
  it 'routes to users #show via GET' do
    expect(get: 'api/v1/users/1').to route_to('api/v1/users#show', id: '1')
  end
  it ' routes to readings #index via GET' do
    expect(get: 'api/v1/readings').to route_to('api/v1/readings#index')
  end
  it 'routes to readings #create via POST' do
    expect(post: 'api/v1/readings').to route_to('api/v1/readings#create')
  end
end
