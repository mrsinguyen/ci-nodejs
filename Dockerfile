FROM ubuntu:xenial

RUN apt-get update -qq && apt-get install curl -y -qq && curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get update -qq && apt-get upgrade -y && apt-get install -y -qq ruby-dev make nodejs python g++ build-essential python-software-properties git-core libfontconfig && apt-get clean && rm -rf /var/lib/apt/lists/*

# install compass
RUN gem install --no-rdoc --no-ri compass foundation sass

# install nodejs + tools
RUN bash -c 'npm set progress=false' && bash -c 'npm install -g yarn bower grunt-cli gulp-cli jira-cmd phantomjs-prebuilt utf-8-validate bufferutil optipng jpegtran pngquant gifsicle bufferutil jshint ycssmin recess selenium-standalone webdriver-manager' && selenium-standalone install --silent && webdriver-manager update
