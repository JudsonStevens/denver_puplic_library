require './lib/book.rb'
require 'time'
class Author
  attr_reader :author_data,
              :books
  def initialize(author_data)
    @author_data = {
      first_name:       author_data[:first_name],
      last_name:        author_data[:last_name]
    }
    @books = []
  end

  def add_book(title, date)
    book_information = {}
    book_information[:author_first_name] = @author_data[:first_name]
    book_information[:author_last_name] = @author_data[:last_name]
    book_information[:title] = title
    if date.split.length != 1
      pub_date = Time.parse(date).strftime('%m/%d/%Y')
    else
      pub_date = date
    end
    book_information[:publication_date] = pub_date
    book_information = check_duplicates(book_information)
    require "pry"; binding.pry
    @books << Book.new(book_information) if book_information != nil
  end

  def check_duplicates(book_information)
    author_first_names = @books.map{ |book| book.book_information[:author_first_name]}
    return nil if author_first_names.include?(book_information[:first_name])
    book_information
  end
end
