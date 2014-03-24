#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'socket_server'
require_relative '../config/environment'

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml')) [ENV['RAILS_ENV']])

# load all server files
Dir["./*.rb"].each {|file| require file }
Dir["./processors/*.rb"].each {|file| require file }

class Notice < ActiveRecord::Base
end

# Custom server class
class Server < Scope::SocketServer
end

server = Server.new

port = ARGV.empty? ? 4567 : ARGV.pop

server.run port: port
