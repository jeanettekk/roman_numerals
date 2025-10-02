# frozen_string_literal: true

require_relative 'scan'

RSpec.describe Scan do
  it 'empty scanner should have total amount of 0' do
    co = Scan.new
    expect(0).to eq(co.total)
  end

  it 'scanning empty items should not change the total' do
    co = Scan.new
    co.scan("")
    expect(0).to eq(co.total)
  end
end
