# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do
  let(:check_out) { CheckOut.new }

  let(:items) { { '' => 0, 'A' => 50, 'AA' => 100, 'AAA' => 150 } }

  it 'empty scanner should have total amount of 0' do
    check_out
    expect(check_out.total).to equal(0)
  end

  it 'scanning empty items should not change the total' do
    items.each do |item, expected_sum|
      check_out
      check_out.scan(item)
      expect(check_out.total).to equal(expected_sum)
    end
  end

  it 'scans A to equal 50' do
    check_out
    check_out.scan('A')
    expect(check_out.total).to equal(50)
  end

  it 'scans AA to a total of 100' do
    check_out
    check_out.scan('AA')
    expect(check_out.total).to equal(100)
  end

  it 'scans AAA to a total of 150' do
    check_out
    check_out.scan('AAA')
    expect(check_out.total).to equal(150)
  end
end
