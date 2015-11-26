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
    username "Vasya"
    text "Test text"
    reply false

    factory :comment_with_parent do
      parent_id { create(:comment).id }
    end
  end
end