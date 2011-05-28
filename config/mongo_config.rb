require 'logger'
require 'mongo_mapper'

mongo_url = ENV['MONGOHQ_URL'] || 'mongodb://localhost:27017/philly_tech_calendar'
url = URI(mongo_url)
MongoMapper.connection = Mongo::Connection.new(url.host, url.port)
MongoMapper.database = url.path.gsub(/^\//, '')
MongoMapper.database.authenticate(url.user, url.password) if url.user && url.password