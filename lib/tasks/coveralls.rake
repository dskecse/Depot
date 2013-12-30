require 'coveralls/rake/task'
Coveralls::RakeTask.new

namespace :ci do
  task coveralls: ['spec', 'features', 'coveralls:push']
end
