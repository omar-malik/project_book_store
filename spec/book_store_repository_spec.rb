require 'book_repository'

def reset_students_table
  seed_sql = File.read('spec/seeds_book_store.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
  connection.exec(seed_sql)
end


RSpec.describe BookRepository do

  before(:each) do 
    reset_students_table
  end

  it "returns all Book objects" do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq 5

    expect(books[0].id).to eq "1"
    expect(books[0].title).to eq 'Nineteen Eighty-Four'
    expect(books[0].author_name).to eq 'George Orwell'

    expect(books[1].id).to eq "2"
    expect(books[1].title).to eq 'Mrs Dalloway'
    expect(books[1].author_name).to eq "Virginia Woolf"
  end

  it "returns the first Book object" do
    repo = BookRepository.new
    book = repo.find(1)

    expect(book.id).to eq "1"
    expect(book.title).to eq "Nineteen Eighty-Four"
    expect(book.author_name).to eq "George Orwell"
  end
end