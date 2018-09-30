# Media Ocean

[Media Ocean](http://glacial-depths-45879.heroku.app.com/) is live.

A demo may be found [here](http://richardscheiwe.com/demos).

Media Ocean is where Twitter meets IMDB. Users log in, find movies they wish to watch or ones that they have watched, and submit reviews for other users to read. A feed is always available for each user to stay up-to-date on their friends' reviews and postings. A full-scale search engine allows for users and site visitors to access all 300K+ movies and shows through the [TMDB/IMDB API](https://developers.themoviedb.org/3/getting-started/introduction).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites and Deployment

Media Ocean is built with a Ruby on Rails backend and plain `.erb` frontend. It simply needs to be forked and cloned to a local machine. From there, run:

```ruby
rake db:create
rake db:migrate

rails s
```

The database is currently set to PostgreSQL for the sake of Heroku deployment. PostgreSQL is required on the local machine for database builds.

## Contributing

Please read [CONTRIBUTING.md](https://github.com/rscheiwe/media_ocean/blob/master/CCONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Richard Scheiwe** - [Personal](http://richardscheiwe.com)
* **Chris Metzger** - [Hub](https://github.com/critsmet)
* **Paul Bomba** - [Hub](https://github.com/pbomba)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
