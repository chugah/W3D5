class Book < ActiveRecord::Base

  belongs_to :library
  has_many :lends
  
  validates :title, presence: true, length: {maximum: 500}
  validates :author, presence: true, length: {minimum: 5, maximum: 100}
  validates :pages, presence: true, 
                    numericality: {only_integer: true, greater_than_or_equal_to: 4}
  validates :isbn, format: {with: /\b\d{9}-[\d|X]/, message: 'is not a valid ISBN'}
  
  def available?
    library.lends.where(book_id: id).checkout == Date.today
  end

end


