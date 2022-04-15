=begin
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
=end

def valid_annagram?(str_one, str_two)
  return false if str_one.nil? || str_two.nil?
  return false if str_one.length != str_two.length

  ascii_arr = Array.new(256, 0)

  str_one.downcase.each_byte { |b| ascii_arr[b] += 1 }
  str_two.downcase.each_byte { |b| ascii_arr[b] -= 1 }

  ascii_arr.all? { |i| i == 0 }
end

require 'minitest/autorun'

describe 'assertions' do
  it 'is fasle if nil string case 1' do
    str_one = nil
    str_two = 'a'

    assert_equal(valid_annagram?(str_one, str_two), false)
  end

  it 'is fasle if nil string case 2' do
    str_one = 'foo'
    str_two = nil

    assert_equal(valid_annagram?(str_one, str_two), false)
  end

  it 'is false if different lengths' do
    str_one = 'abc'
    str_two = 'abcd'

    assert_equal(valid_annagram?(str_one, str_two), false)
  end

  it 'should return bca for abc' do
    assert_equal(valid_annagram?('abc', 'bca'), true)
  end

  it 'should return `academy code` for `code academy`' do
    assert_equal(valid_annagram?('code academy', 'academy code'), true)
  end

  it 'should return gramana for ANAGRAM' do
    assert_equal(valid_annagram?('ANAGRAM', 'gramana'), true)
  end
end
