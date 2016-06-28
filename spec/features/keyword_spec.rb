require 'rails_helper'
require 'aws-sdk'
RSpec.feature 'keyword', type: :feature do
  scenario 'キーワード画面が表示される' do
    visit URI.encode "/keyword?q=酸欠少女"
    expect(page).to have_text("酸欠少女")
    upload_evidence_image('ID0002')
  end
end
