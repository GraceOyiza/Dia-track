require 'rails_helper'
RSpec.describe Api::V1::ReadingsController, type: :controller do
  before { allow(controller).to receive(:authorize_request).and_return(true) }
  describe 'use authorize request before action' do
    context 'when authorized' do
      it { should use_before_action(:authorize_request) }
    end
  end

  describe 'POST  api/v1/readings' do
    before { post :create }
    context 'when authorized' do
      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response.content_type).to include('application/json') }
      it do
        should rescue_from(ActiveRecord::RecordInvalid)
          .with(:invalid)
      end
    end
  end
  describe 'GET api/v1/readings/1' do
    before { get :index, params: { email: 'mike@mike.com' } }
    context 'when authorized' do
      it do
        should rescue_from(ActiveRecord::RecordNotFound)
          .with(:not_found)
      end
      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe 'Should create a reading' do
    context 'when authorized' do
      it do
        tester = User.create!(email: 'jane@jane.com', username: 'jane')
        post :create, params: { user_email: tester.email, fasting: 100.00,
                                after_meal: 166.45, bp: 111.00, date: '2050-10-10' }

        expect(response).to have_http_status(:created)
      end
    end
  end
end
