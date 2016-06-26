require 'rails_helper'
require 'aws-sdk'
RSpec.feature 'top', type: :feature do
  scenario 'トップページが閲覧できる' do
    visit '/'
    expect(page).to have_text("トップページ")
    upload_evidence_image('ID0001')
  end
end
