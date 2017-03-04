require 'test/unit'
require './linked-list'

def copy_list(old_head)
  new_sentinal = Node.new(nil, nil)
  last_added = new_sentinal
  old_node = old_head ? old_head : old_head.next

  until old_node == nil
    last_added.set_next(Node.new(nil, nil))
    last_added = last_added.next
    last_added.set_value(old_node.value)
    old_node = old_node.next
  end

  return LinkedList.new(new_sentinal)
end

class CopyListTest < Test::Unit::TestCase
  def create_list
    third = Node.new(3, nil)
    second = Node.new(2, third)
    first = Node.new(1, second)
    LinkedList.new(first)
  end

  def test_copy_list
    list = create_list
    new_list = copy_list(list.head)
    assert_equal(list.head.value, new_list.head.next.value)
  end
end
