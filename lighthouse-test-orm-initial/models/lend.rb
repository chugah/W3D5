class Lend < ActiveRecord::Base

  belongs_to :library
  belongs_to :book
  
  validate :due_date_after_checkout, if: :due
  validate :checkin_date_after_checkout, if: :checkin
  
  after_save :revenue
  
  def revenue
    library.revenue += fees
    library.save
    library.revenue
  end
  
  def fees
    overdue? ? library.late_fee * (checkin - due) : library.late_fee * 0
  end
  
  def days
    due - checkout
  end
  
  def overdue?
    !(checkin) || (checkin > due)
  end
  
  def due_date_after_checkout
    if checkout > due
      errors.add(:due, 'due date must be after checkout')
    end
  end 
       
  def checkin_date_after_checkout
    if checkout > checkin
      errors.add(:checkin, 'checkin date must be after checkout')
    end
  end
  
  def extended
    self.extended = true if self.days > 2
  end
end
  