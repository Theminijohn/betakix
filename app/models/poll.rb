class Poll < ActiveRecord::Base

  # Validations
  validates :title, presence: true

  # Associations
  has_many :questions

end
