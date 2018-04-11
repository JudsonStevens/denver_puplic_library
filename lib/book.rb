# This class holds information about each Book object.
class Book
  attr_reader :book_information
  def initialize(book_information)
    @book_information = {
      author_first_name:     book_information[:author_first_name],
      author_last_name:      book_information[:author_last_name],
      title:                 book_information[:title],
      publication_date:      book_information[:publication_date]
    }
  end
end
