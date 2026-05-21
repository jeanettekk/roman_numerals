# frozen_string_literal: true

# Calculates checkout totals for scanned item strings using a configurable catalog
class CheckOut
  CATALOG = {
    'A' => { price: 50, discount: { quantity: 3, amount: 20 } },
    'B' => { price: 30, discount: { quantity: 2, amount: 15 } },
    'C' => { price: 20 },
    # D: unit price 15, discount 10 for every 15 Ds (as requested)
    'D' => { price: 15, discount: { quantity: 15, amount: 10 } }
  }.freeze

  class << self
    attr_accessor :total

    def scan(item)
      totals = calculate_totals(item)
      @total = totals[:total_amount] - totals[:total_discount]
    end

    def reset
      @total = 0
    end

    private

    # Return a hash of counts for the known catalog letters
    def parse_item_counts(item)
      counts = {}
      CATALOG.each_key { |k| counts[k] = item.count(k) }
      counts
    end

    # Calculate total without discount and discount for a single letter given its count
    def calculate_line_total(_letter, data, count)
      price = data[:price]
      discount = data[:discount] ? calculate_discount_for_count(count, data[:discount]) : 0
      total_without_discount = count * price

      { total_without_discount: total_without_discount, discount: discount }
    end

    def calculate_discount_for_count(count, discount_data)
      dq = discount_data[:quantity]
      da = discount_data[:amount]
      (count / dq).floor * da
    end

    # Aggregate totals for the whole item string
    def calculate_totals(item)
      counts = parse_item_counts(item)
      lines = build_line_summaries(counts)

      total_amount = lines.sum { |l| l[:total_without_discount] }
      total_discount = lines.sum { |l| l[:discount] }

      { total_amount: total_amount, total_discount: total_discount }
    end

    def build_line_summaries(counts)
      counts.each_with_object([]) do |(letter, count), arr|
        next if count.zero?

        data = CATALOG[letter]
        arr << calculate_line_total(letter, data, count)
      end
    end
  end
end
