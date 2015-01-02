class Poll < ActiveRecord::Base

  # Validations
  validates :title, presence: true

  # Associations
  belongs_to :user
  has_many :questions
  has_many :replies

  # Poll Serializer
  def serialize_for_graph
    PollSerializer.count_per_month(self).to_json
  end

end
