class Restore

  def initialize(client: nil, bucket_name: nil, key: nil, days: 90 )
    @client = client
    @bucket_name = bucket_name
    @key = key
    @days = days
  end

  def execute
    client.restore_object({
      bucket: bucket_name,
      key: key,
      restore_request: {
        days: days, # required
      },
    })
  end

  private
  attr_reader :client, :bucket_name, :key, :days


end