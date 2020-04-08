# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.create!(
    title: 'ブログを始めました。',
    content: '初めてのブログです。よろしくお願いします。。。。。。'
)

(2..20).each do |i|
    Post.create!(
        title: "#{i}つ目の記事です。",
        content: "ブログって難しいぜ....<br /> 何も思いつかねぇ..."
    )
end

User.create!(
    name: 'admin',
    email: '',
    password: '0000',
    password_confirmation: '0000'
)