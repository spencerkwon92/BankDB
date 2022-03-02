class Memo < ApplicationRecord
    belongs_to :preference
    
    validates :body, presence:true
end
