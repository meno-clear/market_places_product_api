FactoryBot.define do
  factory :address do
    user { nil }
    address { "MyString" }
    street { "MyString" }
    number { "MyString" }
    district { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    postal_code { "MyString" }
    type { "" }
    longitude { 1.5 }
    latitude { 1.5 }
    coordinates { "" }
  end
end
