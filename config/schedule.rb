set :output, "#{path}/log/cron.log"

every :day do
  runner "User.all.each { |user| user.dailies.create(report_for: Date.today) }", environment: 'production'
end