desc "This task is called by the Heroku scheduler add-on"
task :global_stock_update => :environment do
  puts "Updating all stock prices."
  User.global_stock_update
  puts "done."
end
