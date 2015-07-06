class Config
  def initialize(access_key: nil, secret: nil)
    @access_key = access_key
    @secret = secret
  end
  
  def update
    @update ||= begin
      Aws.config.update({
        region: 'us-east-1',
        credentials: Aws::Credentials.new(access_key, secret),
      })
    end
  end

  private

  attr_reader :access_key, :secret

end
