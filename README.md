Purpose:
--------

Hopefully help out the Philly tech community by getting all of the relevant tech events on one calendar
that's accessible at an easy to remember url.

Development:
--------

A running MongoDB instance is a development requirement of this project. From OS X:

     brew install mongodb
     mongod run --config /usr/local/Cellar/mongodb/<version>/mongod.conf --rest

Running:
--------

     git clone git@github.com:adamvduke/phillytechcalendar.git
     cd phillytechcalendar
     bundle install
     rackup

The app should then be available at http://localhost:9292/
