# frozen_string_literal: true

require_relative 'check_out'

RSpec.describe CheckOut do
  let(:check_out) { CheckOut.new }

  let(:items) { { '' => 0, 'A' => 50, 'AA' => 100, 'AAA' => 150 } }

  it 'scanning empty items should not change the total' do
    items.each do |item, expected_sum|
      check_out
      check_out.scan(item)
      expect(check_out.total).to equal(expected_sum)
    end
  end
end
