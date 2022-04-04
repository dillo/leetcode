=begin
Sort string of characters
Difficulty Level : Easy
Last Updated : 04 Feb, 2022
Given a string of lowercase characters from ‘a’ – ‘z’. We need to write a program to print the characters of this string in sorted order.
Examples:

Input : bbccdefbbaa
Output : aabbbbccdef

Input : geeksforgeeks
Output : eeeefggkkorss
=end

def sort_string(str)
  return str if str.length <= 1

  result = []
  ascii_arr = Array.new(256, 0)

  str.each_byte { |b| ascii_arr[b] += 1 }

  ascii_arr.each_with_index do |num, idx|
    next if num == 0

    num.times { result << idx.chr }
  end

  result.join
end

require 'minitest/autorun'

describe 'assertions' do
  it 'case 1' do
    assert_equal(sort_string('a'), 'a')
  end

  it 'case 2' do
    assert_equal(sort_string('ba'), 'ab')
  end

  it 'case 3' do
    assert_equal(sort_string('bbccdefbbaa'), 'aabbbbccdef')
  end

  it 'case 3' do
    assert_equal(sort_string('geeksforgeeks'), 'eeeefggkkorss')
  end
end
