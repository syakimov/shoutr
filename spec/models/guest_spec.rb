require 'rails_helper'

describe Guest, '#email' do
  it 'returns empty string' do
    expect(Guest.new.email).to be_blank
  end
end

