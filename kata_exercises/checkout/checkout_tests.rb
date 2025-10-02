# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do
  let(:check_out) { CheckOut.new }
  it 'empty scanner should have total amount of 0' do
    check_out
    expect(check_out.total).to eq(0)
  end

  it 'scanning empty items should not change the total' do
    check_out
    check_out.scan("")
    expect(check_out.total).to eq(0)
  end

  it 'scans A to equal 50' do
    check_out
    check_out.scan("A")
    expect(check_out.total).to eq(50)
  end

  it 'scans AA to a total of 100' do
    check_out
    check_out.scan("AA")
    expect(check_out.total).to eq(100)
  end
end
