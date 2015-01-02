class Poll < ActiveRecord::Base

  # Validations
  validates :title, presence: true

  # Associations
  has_many :questions
  has_many :replies

end
