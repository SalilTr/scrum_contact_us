# spec/factories/replies.rb
FactoryBot.define do
  factory :reply do
    content { 'Example content' }

    # association with contact
    association :contact

    # Add other attributes as needed
  end
end
