require './test/test_helper'
require './lib/book.rb'

# Tests for the Book class.
class BookTest < Minitest::Test
  def setup
    @b = Book.new(author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960")
  end

  def test_it_exists
    assert_instance_of Book, @b
  end

  def test_it_can_return_first_name
    expected = 'Harper'
    actual = @b.book_information[:author_first_name]

    assert_equal expected, actual
  end

  def test_it_can_return_last_name
    expected = 'Lee'
    actual = @b.book_information[:author_last_name]

    assert_equal expected, actual
  end

  def test_it_can_return_title
    expected = 'To Kill a Mockingbird'
    actual = @b.book_information[:title]

    assert_equal expected, actual
  end

  def test_it_can_return_publication_date
    expected = 'July 11, 1960'
    actual = @b.book_information[:publication_date]

    assert_equal expected, actual
  end

end
