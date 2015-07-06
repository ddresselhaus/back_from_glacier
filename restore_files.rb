require_relative './lib/back_from_glacier'

config = Config.new(access_key: ENV["S3_ACCESS_KEY"], secret: ENV["S3_SECRET_KEY"])
config.update

bucket_name = ARGV[0]
expiration = ARGV[1]

client = Aws::S3::Client.new
s3 = Aws::S3::Resource.new
bucket = s3.bucket(bucket_name)

bucket.objects.each do |object|
  r = Restore.new(client: client, bucket_name: bucket_name, key: object.key, days: expiration)
  r.execute
end
