desc "Updates zones; called by the Heroku scheduler add-on"
task :update_zones => :environment do
  puts "Updating zones..."
  UpdateZones.new.call
  puts "Zone updates complete."
end

desc "Updates schedules; called by the Heroku scheduler add-on"
task :update_schedules => :environment do
  puts "Updating schedules..."
  UpdateSchedules.new.call
  puts "Schedule updates complete."
end

# https://devcenter.heroku.com/articles/scheduler