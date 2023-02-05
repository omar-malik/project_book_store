require_relative './book'

class BookRepository
  def all
    books = []
    #executes SQL query: SELECT id, title, author_name FROM books;
    sql = "SELECT id, title, author_name FROM books;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |book|
      my_book = Book.new
      my_book.id = book['id']
      my_book.title = book['title']
      my_book.author_name = book['author_name']

      books << my_book
    end

    return books
    #returns an array of Book objects
  end

  def find(id)
    #executes SQL query: SELECT id, title, author_name FROM books WHERE id = $1
    # returns the selected Student object
    return all[id-1]
  end

end

