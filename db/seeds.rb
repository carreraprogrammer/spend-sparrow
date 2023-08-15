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
  icon: "https://i.pinimg.com/564x/55/f8/af/55f8afd0d4c2224653f1ba467b6543e8.jpg"
)

category2 = user.categories.create!(
  name: "Entertainment",
  icon: "https://i.pinimg.com/564x/0c/32/97/0c3297f3516a415219c7e89e16a4a3d2.jpg"
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
