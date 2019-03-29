# Brownfield Of Dreams

Brownfield of Dreams is a brownfield project using a codebase for a Rails application that organizes YouTube content for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

Using this existing code, we implemented several additional features including:
* User GitHub OAuth connectivity
* Email activation and invitations
* User Friendships
* Importing tutorials from YouTube playlist ids

A full list of added features can be found on the application's [GitHub Project page](https://github.com/csvlewis/brownfield-of-dreams/projects/2)

## Local Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the test suite:
```ruby
$ bundle exec rspec
```

There are several environment variables that you will need to define in your 'application.yml' file:
* github_key
* TEST_AUTHORIZATION_TOKEN
* YOUTUBE_API_KEY
* GITHUB_CLIENT_ID
* GITHUB_CLIENT_SECRET
* SENDGRID_USERNAME
* SENDGRID_PASSWORD

## Technologies
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

## Created By
* [Chris Lewis](https://github.com/csvlewis)
* [Manoj Panta](https://github.com/manojpanta)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
