require './test/test_helper'
require './lib/library.rb'
require './lib/author.rb'

class LibraryTest < Minitest::Test

  def setup
    @l = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @l
  end

  def test_books_list_starts_out_empty
    expected = []
    actual = @l.books

    assert_equal expected, actual
  end

  def test_it_can_add_books_to_library
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    expected = 'Harper'
    @l.add_to_collection(mockingbird)
    actual = @l.books.first.first.book_information[:author_first_name]

    assert_equal expected, actual

    expected = '1853'
    @l.add_to_collection(villette)
    actual = @l.books[1][1].book_information[:publication_date]

    assert_equal expected, actual
  end

  def test_it_can_see_if_it_includes_a_book_by_title
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @l.add_to_collection(jane_eyre)
    @l.add_to_collection(villette)
    @l.add_to_collection(mockingbird)

    actual = @l.include?('To Kill a Mockingbird')

    assert actual

    actual = @l.include?("A Yankee in King Arthur's Court")

    refute actual
  end
end
