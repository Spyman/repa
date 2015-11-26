FactoryGirl.define do
  factory :state do
    name "Test State"
  end

  factory :post do
    title "Test title"
    text "Test text"
  end

  factory :comment do
    post_id { create(:post).id }
    text "Test text"
  end
end