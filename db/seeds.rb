# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.delete_all
Course.delete_all

30.times do
  course = Course.create(
    name: FFaker::Education.major,
    summary: FFaker::Lorem.sentence,
    description: FFaker::HTMLIpsum.body,
    room: FFaker::Company.name
  )

  teacher = Teacher.create(
    title: FFaker::Name.prefix,
    firstname: FFaker::Name.first_name,
    lastname: FFaker::Name.last_name,
    gender: rand(0..2),
    degree: FFaker::Education.degree,
    start_date: Time.at(Time.now + rand * (Time.local(2000, 1, 1).to_f - Time.now.to_f)),
    school_graduated: FFaker::Education.school,
    major_accomplishments: FFaker::HTMLIpsum.body
  )

  teacher.courses << course
end
