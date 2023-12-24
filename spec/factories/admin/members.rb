# frozen_string_literal: true

require 'taiwanese_id_validator/twid_generator'

FactoryBot.define do
  factory :admin_member, class: 'Admin::Member' do
    password = Faker::Internet.password

    name { Faker::Name.name }
    id_card_number { TwidGenerator.generate }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    birth_date { Faker::Date.birthday }
    phone { "09#{Faker::Number.number(digits: 8)}" }
    password { password }
    password_confirmation { password }
  end
end
