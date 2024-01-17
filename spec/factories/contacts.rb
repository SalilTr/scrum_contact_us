# spec/factories/contacts.rb
FactoryBot.define do
  factory :contact do
    description { 'Example description' }
    firstname { 'John' }
    lastname { 'Doe' }
    email { 'john.doe@example.com' }
    contact_type { 'customer' }

    # Add other attributes as needed
  end
end
