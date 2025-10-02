# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do
  it 'empty scanner should have total amount of 0' do
    co = CheckOut.new
    expect(co.total).to eq(0)
  end

  it 'scanning empty items should not change the total' do
    co = CheckOut.new
    co.scan("")
    expect(co.total).to eq(0)
  end

  it 'scans A to equal 50' do
    co = CheckOut.new
    co.scan("A")
    expect(co.total).to eq(50)
  end

  it 'scans AA to a total of 100' do
    co = CheckOut.new
    co.scan("AA")
    expect(co.total).to eq(100)
  end
end
