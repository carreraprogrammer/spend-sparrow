# Create a user
user = User.new(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

user.skip_confirmation!
user.save!

# Create categories and budgets for the user
category1 = user.categories.create!(
  name: "Food",
  icon: "https://cdn-icons-png.flaticon.com/128/4342/4342728.png"
)

category2 = user.categories.create!(
  name: "Entertainment",
  icon: "https://cdn-icons-png.flaticon.com/128/4342/4342821.png"
)

Budget.create!(
  user: user,
  category: category1,
  name: "Restaurant",
  amount: 200
)

Budget.create!(
  user: user,
  category: category1,
  name: "Groceries",
  amount: 150
)

Budget.create!(
  user: user,
  category: category2,
  name: "Movies",
  amount: 50
)

Budget.create!(
  user: user,
  category: category2,
  name: "Concerts",
  amount: 100
)
