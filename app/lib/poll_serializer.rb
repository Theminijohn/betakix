# Serliazed a poll's data in order to be used in charts
#
# The Serializer should be able to:
#
# * Retrieve the actual data in the form of a hash;
# * Retrieve both axis information: legend, numeric ranges
#   if necessary, occasional different columns for +x+;

class PollSerializer

  ## Polls Answered by Month
  def self.count_per_month(poll)
    replies = poll.replies.group_by { |reply| reply.created_at.beginning_of_month }
    data = replies.map { |key, values| values.length } 
    {
      data: data, # []
      title: 'Polls answered by month',
      x_axis: {
        legend: 'Polls per month',
        series: replies.keys.map { |date| date.strftime("%b %Y") } # []
      },
      y_axis: {
        legend: 'No# polls',
        scale: [0, (data.max or 0) + 1]
      }
    }
  end

  ## Answers Per Question
  def self.answers_per_question(question)
    answers_per_question = question.answers.group_by(&:possible_answer) 
    data = answers_per_question.map { |possible_answer, answers| answers.length }
    series = answers_per_question.map { |possible_answer, answers| possible_answer.title }
    {
      data: data, # []
      title: question.title, 
      x_axis: {
        legend: 'Polls per month',
        series: series
      },
      y_axis: {
        legend: 'No# polls',
        scale: [0, (data.max or 0)+ 1]
      }
    }
  end

end
