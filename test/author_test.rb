require './test/test_helper'
require './lib/author.rb'

class AuthorTest < Minitest::Test

  def setup
    @a = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @a
  end

  def test_it_can_return_first_name
    expected = 'Charlotte'
    actual = @a.author_data[:first_name]

    assert_equal expected, actual
  end

  def test_it_can_return_last_name
    expected = 'Bronte'
    actual = @a.author_data[:last_name]

    assert_equal expected, actual
  end

  def test_book_list_starts_empty
    expected = []
    actual = @a.books

    assert_equal expected, actual
  end

  def test_it_can_add_books
    @a.add_book("Jane Eyre", "October 16, 1847")
    expected = '10/16/1847'
    actual = @a.books.first.book_information[:publication_date]

    assert_equal expected, actual
  end

  def test_it_formats_time_correctly
    @a.add_book("Villette", "1853")
    expected = '1853'
    actual = @a.books.first.book_information[:publication_date]

    assert_equal expected, actual
  end
end
