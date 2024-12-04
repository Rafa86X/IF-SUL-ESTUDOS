class Library {
  constructor(name) {
    this.name = name;
    this.books = []; // Composição: os livros pertencem à biblioteca.
  }

  addBook(book) {
    this.books.push(book);
  }

  popBook() {
    if (this.books.length > 0) {
      console.log(this.books.pop());
    }
  }

  shiftBook() {
    if (this.books.length > 0) {
      console.log(this.books.shift());
    }
  }

  unshiftBook(book) {
    this.books.unshift(book);
  }

  listBooks() {
    return this.books.map((book) => book.getDetails()).join("\n");
  }
}

module.exports = Library;
