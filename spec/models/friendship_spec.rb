require 'rails_helper'

describe Friendship do
  it 'exists' do
    user = create(:user)
    friend = create(:user)
    friendship = Friendship.new({user_id: user.id, friend_id: friend.id})

    expect(friendship.user).to eq(user)
    expect(friendship.friend).to eq(friend)
  end
end