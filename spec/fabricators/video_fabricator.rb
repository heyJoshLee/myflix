Fabricator(:video) do
  title { Faker::Lorem.words(2).join(" ") }
  description { Faker::Lorem.sentences(2).join(" ") }
  small_cover { Faker::Placeholdit.image("50x50") }
  large_cover { Faker::Placeholdit.image("50x50") }
  category_id { 1 }
  created_at { Faker::Date.between(2.days.ago, Date.today)}
  updated_at { Date.today }
end
