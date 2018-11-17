Coin.create(name: "Penny", value: 1, quantity: 5)
Coin.create(name: "Nickel", value: 5, quantity: 5)
Coin.create(name: "Dime", value: 10, quantity: 5)
Coin.create(name: "Quarter", value: 25, quantity: 5)

User.create(api_key: 1)
User.create(api_key: 2)

Transaction.create(transaction_type: "Deposit", coin_type: "Quarter", user_id: 1)
Transaction.create(transaction_type: "Deposit", coin_type: "Penny", user_id: 1)

Transaction.create(transaction_type: "Deposit", coin_type: "Quarter", user_id: 2)
Transaction.create(transaction_type: "Deposit", coin_type: "Quarter", user_id: 2)


Transaction.create(transaction_type: "Withdrawl", coin_type: "Quarter", user_id: 1)
Transaction.create(transaction_type: "Withdrawl", coin_type: "Dime", user_id: 1)

Admin.create(name: "Dillon", email: "djlf729@gmail.com")
Admin.create(name:"Maggie", email: "mfergie1117@yahoo.com")