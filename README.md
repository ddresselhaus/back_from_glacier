# Back From Glacier

## Why I wrote these Scripts
When Amazon first introduced Glacier several years back, I was ecstatic. Glacier was 1/10 of the price of standard storage, and I ended up moving nearly a TB of data over to Glacier. But not long after that, they dropped the price of standard storage and I began to miss the accessibilty of standard storage. Unfortunately the conversion process is only one way. So in order to move Glacier storage back to Standard you have to restore all of the files and then copy them over to a new bucket. Or at least, that's the easiest solution I've come up with.

Beware: moving data from Glacier to Standard can tally some unexpected cost. I'm still not sure exactly how they calculate it.

## Install
### Bundle
After cloning, run:
```
  $ bundle install
```
### Dotenv
The scripts will look for your S3 Access Key ID and Secret Key in a .env file, in the repo root. Just create one, and add this
```
S3_ACCESS_KEY=MY_ACCESS_KEY
S3_SECRET_KEY=MY_SECRET_KEY
```

## Usage
### Restoring all of the objects in the Glacier bucket
From the repo root,
```
 $ ruby restore_files bucket_name
```

### Copying to new bucket
AWS takes around 4 hours (sometimes longer) to restore the files. Once restoration is complete, from the repo root, run:
```
 $ ruby copy_to_new_bucket.rb old_bucket_name new_bucket_name
```