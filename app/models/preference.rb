class Preference < ApplicationRecord
    has_many :memos
    belongs_to :user
    
    validates :repayment_way, presence:true
    validates :interest_rate, presence:true  
    validates :amount, presence:true  
    validates :period, presence:true  

end
