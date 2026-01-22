# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do

  # items = { 'AAABB' => 175 }.freeze
  items = { '' => 0, 'A' => 50, 'AA' => 100, 'AAA' => 130, 'AAAA' => 180, 'AAAAA' => 230, 'AAAAAA' => 260,
            'AB' => 80, 'AAABB' => 175, 'AAAAAABBBBB' => 380, 'AAAAAAABBBBB' => 430, 'ABC' => 100 }.freeze

  items.each do |item, expected_sum|
    it "scanning item '#{item}' should result in total of #{expected_sum}" do
      CheckOut.scan(item)
      expect(CheckOut.total).to equal(expected_sum)
    end
  end
end
