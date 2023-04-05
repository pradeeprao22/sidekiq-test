require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  condig.redis = { db: 1 }
end

class OurWorker
 include Sidekiq::Worker
 sidekiq_options retry: 0
 
 def perform(complexity)
   case complexity
   when "superhard"
       sleep 60
       puts "Really took quite a bit of effort"
   when "hard"
       sleep 10
       puts "That was a bit of work"
   else
     while true do
       sleep 1
       puts 'zoom bug'
     end
   end
   puts "That wasn't a lot of effort" 
 end
end
