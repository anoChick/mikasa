require 'rails_helper'

RSpec.feature 'top', type: :feature do
  scenario 'User creates a new widget' do
    visit '/'
    page.save_screenshot('screenshot.png')
    expect(page).to have_text("トップページ")
  end
end
