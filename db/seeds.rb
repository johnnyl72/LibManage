# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate Books with random ISBN and copies
book_list = [
  ['Anna Karenina', 'Leo Tolstoy'],
  ['Madame Bovary', 'Gustave Flaubert'],
  ['War and Peace', 'Leo Tolstoy'],
  ['The Great Gatsby', 'F. Scott Fitzgerald'],
  ['Lolita', 'Vladimir Nabokov'],
  ['Middlemarch', 'George Eliot'],
  ['The Adventures of Huckleberry Finn', 'Mark Twain'],
  ['The Stories of Anton Chekhov', 'Anton Chekhov'],
  ['In Search of Lost Time', 'Marcel Proust'],
  ['Ulysses', 'James Joyce'],
  ['Don Quixote', 'Miguel de Cervantes'],
  ['Moby Dick', 'Herman Melville'],
  ['One Hundred Years of Solitude', 'Gabriel Garcia Marquez'],
  ['Hamlet', 'William Shakespeare'],
  ['The Odyssey', 'Homer'],
  ['The Brothers Karamazov', 'Fyodor Dostoyevsky'],
  ['The Catcher in the Rye', 'J. D. Salinger'],
  ['The Divine Comedy', 'Dante Alighieri'],
  ['Crime and Punishment', 'Fyodor Dostoyevsky'],
  ['Alice\'s Adventures in Wonderland', 'Lewis Carroll'],
  ['Wuthering Heights', 'Emily Bronte'],
  ['To the Lighthouse', 'Virginia Woolf'],
  ['Pride and Prejudice', 'Jane Austen'],
  ['The Sound and the Fury', 'William Faulkner']
]

book_list.each do |title, author|
  book = Book.create(title: title, author: author, isbn: (rand(9999999999).to_s))
  # Create a random number of copies with a random status of either 0 or 1
  rand(10).times do |i|
    book.book_items.create(status: rand(2))
  end
end
