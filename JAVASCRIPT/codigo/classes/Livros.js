class Book {
  constructor(title, author) {
    this.title = title;
    this.author = author; // Agregação: o livro conhece o autor, mas o autor pode existir sem o livro.
  }

  getDetails() {
    return `Title: ${this.title}, Author: ${this.author.getName()}`;
  }
}

module.exports = Book;
