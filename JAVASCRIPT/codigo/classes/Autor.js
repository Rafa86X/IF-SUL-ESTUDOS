class Author {
  constructor(name, birthYear) {
    this.name = name;
    this.birthYear = birthYear;
  }

  getName() {
    return this.name;
  }

  getBiography() {
    return `Name: ${this.name}, Born: ${this.birthYear}`;
  }
}

module.exports = Author;
