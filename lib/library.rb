require './lib/author'

class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(new_book)
    if @books != []
      @books << new_book if @books.first[0].book_information[:title] != new_book.first.book_information[:title]
    else
      @books << new_book
    end
  end

  def include?(title)
    @books.flatten.map do |book|
      book.book_information[:title]
    end.include?(title)
  end

  def card_catalogue
    @books.flatten.sort_by { |book| book.book_information[:author_last_name] }
  end

  def find_by_author(author)
    author = author.split
    @books.flatten.find { |book| book.book_information[:author_first_name] == author[0] }
  end

  def find_by_publication_date(date)
    if date.split.length != 1
      pub_date = Time.parse(date).strftime('%m/%d/%Y')
    else
      pub_date = date
    end
    @books.flatten.find { |book| book.book_information[:publication_date] == pub_date }
  end

end
