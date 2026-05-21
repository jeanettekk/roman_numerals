# frozen_string_literal: true

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
      total_amount_all = 0
      total_discount_all = 0

      CATALOG.each do |letter, data|
        next unless data

        price = data[:price]
        if data[:discount]
          discount, total_without_discount = calculate_discounted_prices(discount_amount: data[:discount][:amount],
                                                                         discount_quantity: data[:discount][:quantity],
                                                                         price_per_item: price,
                                                                         item: item,
                                                                         letter: letter)
        else
          discount = 0
          total_without_discount = calculate_prices_without_discount(price, item, letter)
        end

        total_amount_all += total_without_discount
        total_discount_all += discount
      end

      @total = total_amount_all - total_discount_all
    end

    def reset
      @total = 0
    end

    private

    def calculate_prices_without_discount(price_per_item, item, letter)
      count = item.count(letter)
      count * price_per_item
    end

    def calculate_discounted_prices(discount_amount:, discount_quantity:, price_per_item:, item:, letter:)
      letter_count = item.count(letter)
      number_of_discounts = (letter_count / discount_quantity).floor
      discount = number_of_discounts * discount_amount
      total_without_discount = letter_count * price_per_item
      [discount, total_without_discount]
    end
  end
end
