# Serliazed a poll's data in order to be used in charts
#
# The Serializer should be able to:
#
# * Retrieve the actual data in the form of a hash;
# * Retrieve both axis information: legend, numeric ranges
#   if necessary, occasional different columns for +x+;

class PollSerializer

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
        legend: 'No. polls',
        scale: [0, data.max + 1]
      }
    }
  end

end
