User.create(username: "username", password: "password")
Deck.create!(category: "category", user_id: 1)
Card.create!(deck_id: 1, question: "How is awesome?", answer: "Lloyd")
