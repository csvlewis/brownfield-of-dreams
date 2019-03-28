# frozen_string_literal: true

require 'rails_helper'

describe 'An admin user can add tags to tutorials' do
  it 'clicks on the add tag on a tutoral' do
    admin = create(:user, role: 1)
    tutorial = create(:tutorial)
    create(:video, tutorial_id: tutorial.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    within(first('.admin-tutorial-card')) do
      click_on 'Edit'
    end

    expect(page.has_current_path?(edit_admin_tutorial_path(tutorial))).to be(true)

    fill_in 'tutorial[tag_list]', with: 'Ruby'
    click_on 'Update Tags'
    visit root_path

    within('.categories') do
      expect(page.has_content?('Ruby')).to be(true)
    end

    within('.categories') do
      click_on 'Ruby'
    end

    expect(page.has_current_path?('/tags/Ruby')).to be(true)
  end
end
