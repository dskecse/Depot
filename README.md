Depot
=====

In order to collaborate:

    git clone git@github.com:dskecse/depot2.git
    bundle install
    cp config/database.yml.example config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate
    git checkout -b 'new_branch_name'
    git commit -am 'add new feature'
    git push origin new_branch_name

And make pull request.