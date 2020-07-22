require './lib/author'

class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
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

end
