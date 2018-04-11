require './lib/author'

class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.flatten.map do |book|
      book.book_information[:title]
    end.include?(title)
  end
end
