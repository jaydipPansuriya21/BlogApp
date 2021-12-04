# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




10.times do
    m_title = Faker::Movie.title 
    m_body = ''
    20.times do
        m_body = m_body + Faker::Movie.quote 
    end
    Article.create(title:m_title, body:m_body, status:"public") 
end 
