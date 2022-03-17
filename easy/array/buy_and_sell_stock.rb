=begin
You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

Find and return the maximum profit you can achieve.


Breaking it down

Days = 6 (prices.length)
prices = [7, 1, 5, 3, 6, 4] The varying prices of a share of a stock during the course of 6 days
prices[2] = 5 (The price of the stock on the 3rd day. Arrays are 0 indexed)

You can only hold one share of the stock at any give time
You can decide to buy a share on a given day
You can decide to sell a share you previously bought on a given day
You can buy and sell the share of stock on the same day
=end


def max_profits(prices)
  profit = 0

  return profit if prices.length <= 1

  if prices.length == 2
    day_one, day_two = prices

    if day_two > day_one
      earnings = day_two - day_one

      return profit += earnings
    else
      profit
    end
  end

  for i in (1...prices.length) do
    earnings = prices[i] - prices[i - 1]

    profit += earnings if earnings > 0
  end

  return profit
end

require 'minitest/autorun'

describe 'assertions' do
  it 'returns 0' do
    assert_equal(max_profits([5]), 0)
  end

  it 'returns 4' do
    assert_equal(max_profits([5, 9]), 4)
  end

  it 'returns 4' do
    assert_equal(max_profits([1,2,3,4,5]), 4)
  end

  it 'returns 7' do
    assert_equal(max_profits([7,1,5,3,6,4]), 7)
  end
end
