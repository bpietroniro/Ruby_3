=begin

PROBLEM
Write a simple linked list implementation.
- each element in the list contains data and a "next" field that points
  to the next element in the list

EXAMPLES
- we need an `Element` class and a `SimpleLinkedList` class
`Element`:
- constructor that takes one argument representing the piece of data
  that the element stores, and one more optional argument representing
  another `Element` to link to (via `next`)
- instance method `datum` that returns the piece of data
- instance method `tail?`
  - not sure but it seems like this is checking whether the current  element
    is pointing to another element???
- instance method `next`, seems like this returns the element "below" the
  current element in a stack/list
`SimpleLinkedList`
- a constructor that takes no argument
- instance methods `size`, `empty?` which seem self-explanatory
- instance method `push` which adds a new instance of `Element` to the list
  with its argument as the `Element`'s datum
- instance method `pop` which removes the "topmost" `Element` and returns
  its datum
- instance method `peek` which seems to return the "topmost" element's datum
- instance method `head` which seems to return the "topmost" `Element` obj
- class method `from_a` which seems to create a `SimpleLinkedList` object
  from an array input
  - when the argument is `nil`, nothing should be added to the list
- instance methods `to_a` and `reverse`

DATA STRUCTURES
(...from here I just started coding and followed the tests)

=end

class Element
  attr_reader :datum

  def initialize(datum, linked_element=nil)
    @datum = datum
    @linked_element = linked_element
  end

  def next
    @linked_element
  end

  def tail?
    !@linked_element
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head
  end

  def self.from_a(array=[])
    new_list = new
    # rubocop taught me about the "safe navigation" operator `&.`
    array&.reverse&.each { |element| new_list.push(element) }
    new_list
  end

  def size
    count = 0
    current_element = head

    while current_element
      count += 1
      current_element = current_element.next
    end

    count
  end

  def empty?
    !@head
  end

  def push(datum)
    new_head = Element.new(datum, head)
    @head = new_head
  end

  def pop
    datum_to_return = peek
    @head = head.next
    datum_to_return
  end

  def peek
    head ? head.datum : nil
  end

  def to_a
    new_array = []
    current_element = head

    while current_element
      new_array << current_element.datum
      current_element = current_element.next
    end

    new_array
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    current_element = head

    while current_element
      reversed_list.push(current_element.datum)
      current_element = current_element.next
    end
    reversed_list
  end
end
