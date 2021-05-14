class Course < ApplicationRecord
  def price_to_real
    "R$ #{price.to_i},00"
  end
  def date_to_metric
    enrollment_deadline.strftime('%d/%m/%Y')
  end
end
