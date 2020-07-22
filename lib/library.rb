require './lib/author'

class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @rental_count = {}
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
      @rental_count[book] = 0
    end
  end

  def publication_time_frame_for(author)
    year_array = []
    author.books.each do |book|
      year_array << book.publication_year
    end
    timeframe = {}
    timeframe[:start] = year_array.sort.first
    timeframe[:end] = year_array.sort.last
    timeframe
  end

  def checkout(book)
    if @books.include?(book)
      @books.delete(book)
      @checked_out_books << book
      @rental_count[book] +=1
      return true
    else
      false
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
      @books << book
    end
  end

  def most_popular_book
    most_popular = @rental_count.sort_by {|k, v| v}
    most_popular.last[0]
  end


end
