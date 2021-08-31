namespace :scheduled_tasks do
  desc "Updates zones; called by the Heroku scheduler add-on"
  task :update_staging_zones => :environment do
    puts "Updating zones..."
    UpdateStagingZones.new.call
    puts "Zone updates complete."
  end

  desc "Updates schedules; called by the Heroku scheduler add-on"
  task :update_staging_schedules => :environment do
    puts "Updating schedules..."
    UpdateStagingSchedules.new.call
    puts "Schedule updates complete."
  end
end

# rake scheduled_tasks:update_staging_zones
# https://devcenter.heroku.com/articles/scheduler
# https://medium.com/@jelaniwoods/using-heroku-scheduler-to-run-a-rake-task-3d69c085b66d