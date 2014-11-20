# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


courses = ["Master of Science in Biotechnology",
"Master of Science",
"Master of Business Administration in Foreign Trade",
"Master of Philosophy in Commerce",
"Master of Commerce with specialization",
"Banking management",
"Accounting & financial control",
"Post Graduate Diploma ",
"Retail Management",
"Financial Services",
"Banking & finance",
"Doctor of Philosophy in Computer Science",
"Master of Technology in Computer Science",
"Master of Computer Applications",
"Master of Science",
"Master of Business Administration in Computer Management",
"Doctor of Philosophy in Economics",
"Master of Philosophy in Economics"]

Course.create(courses.map{|c| {name: c}})