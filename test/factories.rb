FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User #{n}" }
        f.sequence(:email) { |n| "test#{n}@example.com" }
        f.password { "password" }
        f.password_confirmation { |d| d.password }
    end
    
    factory :preference do |f|
        f.repayment_way { "Test Menthly Pay" }
        f.interest_rate { 2.0 }
        f.amount { 1500+1000 }
        f.period { 2 }
        
        f.association :user
    end
end