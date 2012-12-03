#!/usr/bin/env ruby

ENV['RACK_ENV'] = 'development'

require 'yaml'
require 'sinatra'
require 'will_paginate'
require 'will_paginate/data_mapper'

require_relative 'dbinit.rb'
require_relative 'routeinit.rb'