require 'rubygems'
require 'bundler/setup'

#gems
require 'dotenv'
Dotenv.load
require 'aws-sdk'
require 'pry'

#lib_files
require_relative './back_from_glacier/config'
require_relative './back_from_glacier/restore'
require_relative './back_from_glacier/bucket_verification'
