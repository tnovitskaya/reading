# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

publisher = Publisher.create({name: "Pinguin", location: "UK"})

book1 = Book.create({name: "Silmarillion", publisher: publisher, genre: "fiction", page_count: 300})

author1 = Author.create({first_name: "John", last_name: "Tolkien"})
author2 = Author.create({first_name: "Cristopher", last_name: "Tolkien"})

BookAndAuthorLink.create({book: book1, author: author1, role: :author})
BookAndAuthorLink.create({book: book1, author: author2, role: :editor})

user1 = User.create({first_name: "Andrew", last_name: "Lelechenko"})
user2 = User.create({first_name: "Tatiana", last_name: "Novitskaya"})

interest1 = Interest.create({user: user1, book: book1, review: "Good book!"})

Comment.create({user: user2, interest: interest1, content: "I agree"})
Comment.create({user: user1, interest: interest1, content: ":)"})
