require './lib/author'

class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
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
      return true
    else
      false
    end

  end


end
