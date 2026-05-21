# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do

  # items = { 'AAABB' => 175 }.freeze
  d15 = 'D' * 15
  items = {
    '' => 0,
    'A' => 50,
    'AA' => 100,
    'AAA' => 130,
    'AAAA' => 180,
    'AAAAA' => 230,
    'AAAAAA' => 260,
    'AB' => 80,
    'AAABB' => 175,
    'AAAAAABBBBB' => 380,
    'AAAAAAABBBBB' => 430,
    'ABC' => 100,
    # D-specific cases (D unit price 15, discount 10 for every 15 Ds)
    'D' => 15,
    'DD' => 30,
    'AD' => 65,
    # 15 Ds: 15 * 15 = 225 total without discount, minus 10 discount => 215
    d15 => 215,
    # unknown letters ignored: 'AXZ' should be same as 'A' => 50
    'AXZ' => 50
  }.freeze

  items.each do |item, expected_sum|
    it "scanning item '#{item}' should result in total of #{expected_sum}" do
      CheckOut.scan(item)
      expect(CheckOut.total).to equal(expected_sum)
    end
  end
end
