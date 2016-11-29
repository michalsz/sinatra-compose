require 'sinatra'
require 'json'
require 'redis'

get '/hello/:name', :provides => :json do
  redis = Redis.new(:host => 'sinatra_redis', :port => 6379, :db => 15)
  key = params['name']
  count = redis.get(key)
  if count
    redis.set(key, (count.to_i + 1).to_s)
    { greeting: "Hello #{params['name']}! #{count}" }.to_json
  else
    redis.set(key, '1')
    { greeting: "Hello #{params['name']}!" }.to_json
  end
end
