class Event < ApplicationRecord
  validates: title, presence: true, lenght: {maximum: 255}
  validates: address, presence: true
  validates: datetime, presence: true

end
