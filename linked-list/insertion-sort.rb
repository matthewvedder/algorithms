require 'test/unit'
require './linked-list'

def insertion_sort(head)
  sentinal = Node.new(nil, nil)
  input = head.next
  until input == nil
    next_node = input
    input = input.next

    after_me = sentinal
    while after_me.next != nil && after_me.next.value < next_node.value
      after_me = after_me.next
    end

    next_node.set_next(after_me.next)
    after_me.set_next(next_node)
  end

  return sentinal
end

def create_list
  third = Node.new(5, nil)
  second = Node.new(2, third)
  first = Node.new(7, second)
  sentinal = Node.new(nil, first)
  LinkedList.new(sentinal)
end

sorted_list = LinkedList.new(insertion_sort(create_list.head))
print_list = Proc.new { |node| puts node.value }
sorted_list.traverse(print_list)

class InsertionSortTest < Test::Unit::TestCase

  def test_insertion_sort
    sorted = insertion_sort(create_list.head)
  end
end
