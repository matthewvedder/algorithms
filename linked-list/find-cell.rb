require './linked-list'
require 'test/unit'

def find_cell(list, value)
  # head ? top = Node.new(nil, head) : top = head
  match_node = Proc.new { |node| return node.next if node.next == value }
  list.traverse(match_node)
end

class FindCellTest < Test::Unit::TestCase
  def test_find_cell
    third = Node.new(3, nil)
    second = Node.new(2, third)
    first = Node.new(1, second)
    list = LinkedList.new(first)

    assert_equal(second, find_cell(list, 2))
  end
end
