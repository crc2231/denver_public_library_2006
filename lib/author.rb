require './lib/book'

class Author < Book
  attr_reader :first_name, :last_name, :books

  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(book_name, book_publication_date)
    details = {}
    details[:author_first_name] = self.first_name
    details[:author_last_name] = self.last_name
    details[:title] = book_name
    details[:publication_date] = book_publication_date
    book = Book.new(details)
    books << book
    book
  end


end
