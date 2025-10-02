# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do
  it 'empty scanner should have total amount of 0' do
    co = CheckOut.new
    expect(0).to eq(co.total)
  end

  it 'scanning empty items should not change the total' do
    co = CheckOut.new
    co.scan("")
    expect(0).to eq(co.total)
  end
end
