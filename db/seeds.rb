# Create users
mary  = User.create(name: "Mary", email: "mary@m.com", username: "mary", password: "password")
bert = User.create(name: "Bert", email: "bert@b.com", username: "bert", password: "password")

# Create items 
Item.create(title: "Whale Watching", description: "I would like to see a whale upclose", user_id: mary.id)
Item.create(title: "Learn pottery", description: "I would like to learn pottery", user_id: bert.id)

# Use ActiveRecord to pre-associate data
item = bert.items.build(title: "Pet Dog", description: " I would like to adopt a puppy")
item.save