class Book < ApplicationRecord
  belongs_to :user,optional: true
  attachment :image 
  
  validates :title, presence: true
  validates :body, presence: true
  
end
