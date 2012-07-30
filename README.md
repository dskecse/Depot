Setup:

    git clone git@github.com:dskecse/depot2.git
    cd depot2
    cp config/database.yml.example config/database.yml
    bundle install
    rake db:create
    rake db:migrate
