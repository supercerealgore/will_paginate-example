#!/usr/bin/env ruby

require 'data_mapper'

DB_REPOSITORY = ENV['RACK_ENV']
# DB_REPOSITORY = 'development'

db_config   = YAML.load_file('config/database.yml')

db_adapter  = db_config[DB_REPOSITORY]["adapter"]
db_database = db_config[DB_REPOSITORY]["database"]
db_username = db_config[DB_REPOSITORY]["username"]
db_password = db_config[DB_REPOSITORY]["password"]
db_host     = db_config[DB_REPOSITORY]["host"]
db_port     = db_config[DB_REPOSITORY]["port"]
db_encoding = db_config[DB_REPOSITORY]["encoding"]

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, {
  :adapter  => db_adapter,
  :database => db_database,
  :username => db_username,
  :password => db_password,
  :host     => db_host,
  :port   	=> db_port,
  :encoding => db_encoding  
})

require_relative 'models/sample.rb'

DataMapper.finalize
DataMapper.auto_upgrade!

