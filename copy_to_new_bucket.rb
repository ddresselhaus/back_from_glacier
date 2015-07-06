require_relative './lib/back_from_glacier'

config = Config.new(access_key: ENV["S3_ACCESS_KEY"], secret: ENV["S3_SECRET_KEY"])
config.update

old_bucket_name = ARGV[0]
new_bucket_name = ARGV[1]


client = Aws::S3::Client.new
s3 = Aws::S3::Resource.new
old_bucket = s3.bucket(old_bucket_name)


verify = BucketVerification.new(new_name: new_bucket_name, resource: s3)
verify.execute

new_bucket = s3.bucket(new_bucket_name)
begin_time = Time.now
files_moved = []

old_bucket.objects.each do |object|
  key = object.object.key
  print "copying #{key}..."
  new_bucket.object(key).copy_from({
    copy_source: "#{old_bucket_name}/#{key}",
  })
  files_moved << key
  puts "done"
end


end_time = Time.now

puts "Copied #{files_moved.count} files in #{end_time - begin_time} seconds."