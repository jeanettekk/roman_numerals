# frozen_string_literal: true

require_relative 'scan'

RSpec.describe Scan do
  it 'equals to 0' do
    co = Scan.new
    expect(0).to eq(co.total)
  end
end
