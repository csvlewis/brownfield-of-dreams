require 'rails_helper'

describe YouTube::Video, type: :model do
  before :each do
    @hash = { items: [snippet: { thumbnails: { high: { url: 'test' } } }] }
  end
  it 'exists' do
    video = YouTube::Video.new(@hash)

    expect(video).to be_a(YouTube::Video)
    expect(video.thumbnail).to eq('test')
  end

  describe 'instance methods' do
    describe '#by_id' do
      it 'returns a YouTube video by YouTube video id', :vcr do
        expect(YouTube::Video.by_id('dQw4w9WgXcQ')).to be_a(YouTube::Video)
      end
    end
  end
end
