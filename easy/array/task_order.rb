=begin
Given a collection of “tasks” and their dependencies, write some code (method, class, w/e you like) that outputs a list of tasks in a valid order. A valid order is one such that for any task, all of its dependencies appear earlier in the list. To put it another way, if we ran the tasks in this order, each task would have its dependencies met by the time we ran it.

You can model the jobs and dependencies in any way you like as the input to your code.

You can use any programming language you like.

You can Google anything you want at any time.

You can run your code as often as you want while working toward a solution.

|------+---------------------|
| Task | Must be done after: |
|------+---------------------|
| A    | both B and C        |
| B    | both D and E        |
| C    | B                   |
| D    | <None>              |
| E    | <None>              |
| F    | <None>              |
|------+---------------------|

tasks = [
  ['A', [B, C]],
  ['B', [D, E]],
  ['C', [B]],
  ['D', []],
  ['E', []],
  ['F', []]
]

Algorithm
1. Loop through the tasks
2. For each task grab the first item in the array => main task.
3. Check if this task is inside our cache task_cache.include?(task[0]) and just go to the next one if it's present
4. If the task is not present in our cache, check and see if we have any dependencies => dependencies length > 0
5
=end

task_list = [
  ['A', ['B', 'C']],
  ['B', ['D', 'E']],
  ['C', ['B']],
  ['D', []],
  ['E', []],
  ['F', []]
]

def valid_task_order(task_list)
  results = []

  task_list.each do |task|
    if !task[1].empty?
      task[1].each do |dep|
        while #conditions are tru
        results << dep unless results.include?(dep)
      end

      results << task[0] unless results.include?(task[0])
    else
      results << task[0] if task[1].empty? && !results.include?(task[0])
    end
  end

  return results
end

require 'minitest/autorun'

describe 'assertions' do
  it 'returns tasks in a valid order given no dependencies' do
    task_list = [
      ['D', []],
      ['E', []],
      ['F', []]
    ]

    assert_equal(valid_task_order(task_list), ['D', 'E', 'F'])
  end

  it 'returns depencies prior to the task' do
    task_list = [
      ['C', ['D']],
      ['D', []]
    ]

    assert_equal(valid_task_order(task_list), ['D', 'C'])
  end


  it 'returns depencies prior to the task' do
    task_list = [
      ['C', ['B']],
      ['D', []],
      ['E', []],
      ['F', []]
    ]

    assert_equal(valid_task_order(task_list), ['B', 'C', 'D', 'E', 'F'])
  end

  it 'returns depencies prior to the task' do
    task_list = [
      ['B', ['D', 'E']],
      ['C', ['B']],
      ['D', []],
      ['E', []],
      ['F', []]
    ]

    assert_equal(valid_task_order(task_list), ['D', 'E', 'B', 'C', 'F'])
  end

  it 'returns depencies prior to the task' do
    task_list = [
      ['A', ['B', 'C']],
      ['B', ['D', 'E']],
      ['C', ['B']],
      ['D', []],
      ['E', []],
      ['F', []]
    ]

    assert_equal(valid_task_order(task_list), ['D', 'E', 'B', 'C', 'A', 'F'])
  end
end
