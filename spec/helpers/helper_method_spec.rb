# frozen_string_literal: true

require 'rails_helper'
describe 'calling helper methods on resource' do
  it 'returns tutorial name for a tutorial id', :vcr do
    tutorial = create(:tutorial, title: 'tutorial')
    result = ApplicationController.new.tutorial_name(tutorial.id)

    expect(result).to eq(tutorial.title)
  end

  it 'returns bookmark for bookmark id', :vcr do
    user = create(:user)
    video = create(:video)
    bookmark = UserVideo.create(user: user, video: video)
    # rubocop:disable Metrics/LineLength
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # rubocop:enable Metrics/LineLength
    result = ApplicationController.new.find_bookmark(bookmark.id)

    expect(result.id).to eq(bookmark.id)
  end
end
