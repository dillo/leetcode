=begin
Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

Example 1:

Input: s = "leetcode"
Output: 0
Example 2:

Input: s = "loveleetcode"
Output: 2
Example 3:

Input: s = "aabb"
Output: -1

Constraints:

1 <= s.length <= 105
s consists of only lowercase English letters.
=end

def first_unique_char(str)
  return 0 if str.length <= 1

  char_count = {}
  i = 0

  while i < str.length
    char_count[str[i]] ||= 0
    char_count[str[i]] += 1
    i += 1
  end

  i = 0

  while i < str.length
    if char_count[str[i]] == 1
      return i
    end

    i += 1
  end

  return -1
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return 0 for a' do
    assert_equal(first_unique_char('a'), 0)
  end

  it 'should return 0 for ''' do
    assert_equal(first_unique_char(''), 0)
  end

  it 'should return -1 for aabb' do
    assert_equal(first_unique_char('aabb'), -1)
  end

  it 'should return 0 for leetcode' do
    assert_equal(first_unique_char('leetcode'), 0)
  end

  it 'should return 2 for loveleetcode' do
    assert_equal(first_unique_char('loveleetcode'), 2)
  end
end
