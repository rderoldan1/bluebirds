# README

Parse a site given an URL with sidekiq as a Job Processor

#### Versions

* Ruby 2.3
* Rails 5
* Redis 3.0.6 
* Ruby version
* Postgresql


### Database setup
Check your postgresql credentials and update `config/database.yml`if needed

1. Create database and run migrations

        $ rails db:setup
    
### Run the app
    
    $ bundle install
    $ bundle exec foreman start


### Endpoints

* Create 
    
        Method: POST 
        Path: /indices
        Body: { index: {url: 'http:google.com' } }
        
* List of indices

        Method: GET
        Path: /indices
        
        
        
        
     
    
