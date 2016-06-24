require 'rails_helper'

RSpec.describe TopController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end
end
