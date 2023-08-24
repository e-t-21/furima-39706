FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name{Gimei.family.kanji}
    first_name{Gimei.given.kanji}
    family_name_kana{Gimei.family.katakana}
    first_name_kana{Gimei.given.katakana}
    date_of_birth{Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end