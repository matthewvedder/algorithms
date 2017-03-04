require 'test/unit'

class Node
  def initialize(value, pointer)
    @value = value
    @pointer = pointer
  end

  def value
    @value
  end

  def next
    @pointer
  end

  def set_next(node)
    @pointer = node
  end

  def set_value(value)
    @value = value
  end
end

class LinkedList
  def initialize(head)
    @head = head
  end

  def head
    @head
  end

  def set_head(value)
    old_head = @head
    @head = Node.new(value, old_head)
  end

  def last
    find_last = Proc.new { |node| return node.next unless node.next.next }
    self.traverse(find_last)
  end

  def set_tail(value)
    tail = Node.new(value, nil)
    self.last.set_next(tail)
  end

  def insert_after(after_me, new_node)
    new_node.set_next(after_me.next)
    after_me.set_next(new_node)
  end

  def find_cell(value)
    set_head(nil) if self.head
    match_node = Proc.new { |node| return node.next if node.next.value == value }
    self.traverse(match_node)
  end

  def traverse(proc)
    node = @head
    while node.next
      proc.call(node)
      node = node.next
    end
  end
end

class LinkedListTest < Test::Unit::TestCase
  def create_list(size)
    previous = Node.new(0, nil)
    list = LinkedList.new(previous)

    (1..size).each do |i|
      current = Node.new(i, nil)
      previous.set_next(current)
      previous = current
    end
    list
  end

  def test_find_cell
    second = Node.new(2, nil)
    first = Node.new(1, second)
    list = LinkedList.new(first)

    assert_equal(second, list.find_cell(2))
    assert_equal(nil, list.head.value)
  end

end
