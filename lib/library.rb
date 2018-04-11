require './lib/author'

class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(new_book)
    titles = @books.map{ |book| book.book_information[:title]}
    new_book_titles = new_book.map{ |book| book.book_information[:title] }
    if author_first_names
    @books << book
  end

  def include?(title)
    @books.flatten.map do |book|
      book.book_information[:title]
    end.include?(title)
  end

  def card_catalogue
    @books.flatten.sort_by { |book| book.book_information[:last_name] }
    require "pry"; binding.pry
  end

  def find_by_author(author)
    author = author.split
    @books.flatten.find { |book| book.book_informaton[:author_first_name] == author[1] }
  end

  def find_by_publication_date(date)
    @books.flatten.find { |book| book.book_information[:publication_date] == date }
  end
  
end
