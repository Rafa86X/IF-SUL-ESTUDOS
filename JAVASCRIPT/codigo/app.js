const livro = require("./classes/Livros.js");
const Biblioteca = require("./classes/Biblioteca.js");
const Autor = require("./classes/Autor.js");

// Criando os Autores

const autor_1 = new Autor("Rafael Shipres", "22/10/09");
const autor_2 = new Autor("Rafael Miquelangelo", "22/10/09");

// Criando Livros

const livro_1a = new livro("Mabeli Assassina 1", autor_1);
const livro_1b = new livro("Mabeli Assassina 2", autor_1);
const livro_1c = new livro("Mabeli Assassina 3", autor_1);
const livro_2a = new livro("Taratugas Ninjas 1", autor_2);
const livro_2b = new livro("Taratugas Ninjas 2", autor_2);
const livro_2c = new livro("Taratugas Ninjas 3", autor_2);
const livro_3 = new livro("A morte das Bananas", autor_2);
const livro_4 = new livro("Bananas com Leite", autor_2);

// Criando a biblioteca

const lib = new Biblioteca("Luvre");

lib.addBook(livro_1a);
lib.addBook(livro_1b);
lib.addBook(livro_1c);

lib.addBook(livro_2a);
lib.addBook(livro_2b);
lib.addBook(livro_2c);

console.log(lib.listBooks());
console.log("++++++++++++++++++++++");

lib.popBook();
console.log("++++++++++++++++++++++");

lib.shiftBook();
console.log("++++++++++++++++++++++%");

lib.unshiftBook(livro_3);
console.log("++++++++++++++++++++++&");

lib.unshiftBook(livro_4);
console.log("++++++++++++++++++++++#");

console.log(lib.listBooks());
