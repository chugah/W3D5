class Library < ActiveRecord::Base

  has_many :books, dependent: :destroy
  has_many :lends
  
  validates :name, presence: true, uniqueness: true, length: {minimum: 4}
  validates :late_fee, presence: true, numericality: {only_integer: true}
  validates :capacity, presence: true, 
                       numericality: {only_integer: true, 
                                      greater_than_or_equal_to: 1000} 


end
