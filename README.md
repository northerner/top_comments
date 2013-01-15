Top Comments
============

Top Comments is game built on Rails that pulls comments from the top 50 YouTube music videos and asks the player to guess the video based on a random comment.

See it running at [topcomments.herokuapp.com](http://topcomments.herokuapp.com).

Background
----------

The idea for Top Comments came from playing with the [youtube_it](http://github.com/kylejginavan/youtube_it) gem, just seeing pages of comments pulled from the API without any context of where they came from.

This game was built mainly as a practice exercise, having limited experience building Rails apps from scratch I was interested in how fast I could put together a working design.

Installation Note
-----------------

If you want try out Top Comments on Heroku you'll first need to either precompile the assets with `RAILS_ENV=production bundle exec rake assets:precompile` or set assets to compile at runtime in `config\environments\production.rb`.

Ideas for Updates
-----------------

* Add an admin panel for updating the db with more comments. This could include creating new quiz categories and filtering out certain comments.
* Add a **videos** model with a one-to-many relationship on comments, perhaps keeping track of the difficulty of each comment depending how many players guess correctly.
* Player stat tracking.

License
-------
MIT License
