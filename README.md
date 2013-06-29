[![Code Climate](https://codeclimate.com/github/dskecse/depot2.png)](https://codeclimate.com/github/dskecse/depot2)

Setup:

    git clone git@github.com:dskecse/depot2.git
    cd depot2
    cp config/database.yml.example config/database.yml
    cp config/app_config.yml.example config/app_config.yml
    cp config/newrelic.yml.example config/newrelic.yml
    bundle install
    rake db:setup

Chrome driver is used instead of Firefox for acceptance tests.
Download prebuilt ChromeDriver server:

    wget http://chromedriver.googlecode.com/files/chromedriver_linux64_23.0.1240.0.zip
    sudo unzip path_to_chromedriver/chromedriver_linux64_23.0.1240.0.zip -d /usr/local/bin/

or download it manually from `https://code.google.com/p/chromedriver/downloads/list`

Test coverage is disabled by default. To enable it make sure to run tests in `COVERAGE` environment:

    COVERAGE=true be rake
