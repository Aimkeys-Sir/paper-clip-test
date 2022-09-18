require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Console rake"
task :console do
    ActiveRecord::Base.logger=Logger.new(STDOUT)
    Pry.start
end

desc "Start the server"
task :server do
    if ActiveRecord::Base.connection.migration_context.needs_migration?
        puts "You got pending Israelites, cross them over the Jordan first by running `rake db:migrate`"
        return
    end

    exec "bundle exec rerun -b 'rackup config.ru'"
end