# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
seed_data = YAML.load_file(Rails.root.join('db/seed_data.yml'))

seed_data.each_key do |key|
  puts 'Start create seed data.'
  seed_data[key].each do |data_attributes|
    key.capitalize.constantize.create(data_attributes)
    puts "Already created #{key} - #{data_attributes.first.join(': ')}"
  end
  puts 'Finish.'
end