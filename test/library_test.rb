require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/library"

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new("Denver Public Library")
    assert_instance_of Library, dpl
  end

  def test_it_has_initial_attributes
    dpl = Library.new("Denver Public Library")

    assert_equal "Denver Public Library", dpl.name

    assert_equal [], dpl.books
    assert_equal [], dpl.authors

  end

  def test_add_authors
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], dpl.authors
  end

  def test_add_authors_adds_books
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal 4, dpl.books.count
  end

  def test_publication_time_frame_for
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected1 = {:start=>"1847", :end=>"1857"}
    expected2 = {:start=>"1960", :end=>"1960"}
    assert_equal expected1, dpl.publication_time_frame_for(charlotte_bronte)
    assert_equal expected2, dpl.publication_time_frame_for(harper_lee)
  end

  def test_checkout
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal false, dpl.checkout(jane_eyre)
    assert_equal false, dpl.checkout(mockingbird)

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal true, dpl.checkout(jane_eyre)

    dpl.checkout(jane_eyre)

    assert_equal false, dpl.checkout(jane_eyre)

    assert_equal true, dpl.checkout(mockingbird)

    dpl.checkout(mockingbird)

    assert_equal [jane_eyre, mockingbird], dpl.checked_out_books

  end





end
