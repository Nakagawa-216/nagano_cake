# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.create(
  customer_id:"4",
  postal_code:"1111111",
  address:"Tokyo",
  name:"中川幸",
  postage:"800",
  amount_of_payment:"2000",
  payment_method:0,
)

Admin.create(email: "a@a", password: "aaaaaa")

Customer.create(
  email:"1@1",
  password:"tttttt",
  last_name:"中川",
  first_name:"幸",
  last_name_kana:"ナカガワ",
  first_name_kana:"コウ",
  postal_code:"1111111",
  address:"Tokyo",
  telephone_number:"08000000000"
)

Customer.create(
  email:"2@2",
  password:"tttttt",
  last_name:"山田",
  first_name:"花子",
  last_name_kana:"ヤマダ",
  first_name_kana:"ハナコ",
  postal_code:"2222222",
  address:"Osaka",
  telephone_number:"09000000000"
)