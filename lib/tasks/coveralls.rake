if Rails.env.test?
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new

  namespace :ci do
    task coveralls: ['spec', 'cucumber', 'coveralls:push']
  end
end
