require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(0) }
    assert_raises(TypeError) { @list.add('string') }
  end

  def test_shovel
    @list << Todo.new(@list.title)
    assert_equal(4, @list.size)
  end

  def test_add_alias
    new_todo = Todo.new("Go for a run")
    @todos << new_todo
    @list.add(new_todo)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(6) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(6) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(6) }
    (0..2).each { |idx| @list.mark_done_at(idx) }
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(6) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    todo_array = []
    @list.each { |todo| todo_array << todo }
    
    assert_equal([@todo1, @todo2, @todo3], todo_array)
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    selected_todos = @list.select { |todo| todo == @todo1 }
    new_todolist = TodoList.new(@list.title)
    new_todolist << @todo1
    assert_equal(new_todolist.to_s, selected_todos.to_s)
    assert_equal(new_todolist.title, @list.title)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
    assert_equal(@todo2, @list.find_by_title("Clean room"))
    assert_equal(@todo3, @list.find_by_title("Go to gym"))
  end
  
  def test_mark_all_done
    @list.mark_all_done
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_mark_all_undone
    @todos.each { |todo| todo.done! }
    @list.mark_all_undone
    refute(@todo1.done?)
    refute(@todo2.done?)
    refute(@todo3.done?)
  end

  def test_all_done
    @todo2.done!
    done_list = TodoList.new(@list.title)
    done_list << @todo2

    assert_equal(done_list.to_a, @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal(@todos, @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done("Clean room")
    assert(@todo2.done?)
  end
end
