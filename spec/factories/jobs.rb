FactoryBot.define do
  factory :job do
    name { 'Mechanical Engineer' }
    status { 'draft' }
    url { 'www.google.com' }
    department { Department.first || association(:department) }
    location { Location.first || association(:location) }
  end

  trait :active do
    status { 'active' }
  end
end
