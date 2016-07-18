FactoryGirl.define do
  factory :lend do
    library
    book
    due      { 2.days.from_now.to_date }
    checkout { Date.today }

    factory :unreturned_lend do
      checkout { 10.days.ago.to_date }
      due      { 8.days.ago.to_date }
    end

    factory :current_lend do
      checkout { 1.day.ago.to_date }
      due      { 1.day.from_now.to_date }
    end

    factory :extended_lend do
      due { 10.days.from_now.to_date }
    end

    factory :late_lend do
      checkin { 5.days.from_now.to_date }
    end

    factory :overdue_lend do
      checkout { 10.days.ago.to_date }
      due      { 8.days.ago.to_date }
      checkin  { 1.day.ago.to_date }
    end

    factory :old_returned_lend do
      checkout { 30.days.ago.to_date }
      due { 23.days.ago.to_date }
      checkin { 24.days.ago.to_date }
    end
  end
end
