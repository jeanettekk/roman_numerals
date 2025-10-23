# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do
  let(:check_out) { CheckOut.new }

  items = { '' => 0, 'A' => 50, 'AA' => 100, 'AAA' => 130, 'AAAA' => 180 }.freeze

  items.each do |item, expected_sum|
    it "scanning item '#{item}' should result in total of #{expected_sum}" do
      check_out.scan(item)
      expect(check_out.total).to equal(expected_sum)
    end
  end
end
