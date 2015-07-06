class BucketVerification
  
  def initialize(new_name: nil, resource: nil )
    @new_name = new_name
    @resource = resource
  end

  def execute
    create_bucket unless bucket_exists?
  end

  private

  attr_reader :new_name, :resource

  def bucket_exists?
    bucket.exists?
  end

  def bucket
    resource.bucket(new_name) 
  end

  def create_bucket
    resource.buckets.create(new_name)
  end

end