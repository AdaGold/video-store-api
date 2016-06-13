# Project: VideoStoreAPI
The overall goal of this project is to create a system that a video store (remember those?) could use to track their inventory of rental videos and their collection of customers.

We will use [NodeJS](https://nodejs.org/en/) and [Express](http://expressjs.com/) to construct a RESTful API. The goal of this API is to quickly serve information about the store's video collection, customer information, and to update rental status. This repository provides two JSON datafiles to serve as the initial seeds for this system.

## Project Baseline
- Read the API Requirements below and create a pseudo-code "routes" file that
  - defines the _endpoints_ your API will need
  - the _HTTP verbs_ each endpoint will use
  - and any data that must be provided to the endpoint in order for it to do its work.
- Create a new Node/Express app to serve as the API.
- Create a route that responds to `/zomg` that serves a json-encoded "it works!" method.

## Wave 1: Database Models, Tables, & Seeds
- Create an ERD for your database by reading through all of the requirements below.
- Be sure your ERD includes primary keys for all tables
- Leverage MassiveJS and create custom npm scripts to...
  - create a development database
  - drop a development database
  - apply a schema to the database
  - seed a database using the provided json data in `db/seeds`

### Seed Data
`movies.json` contains information about the videos available to rent at the store. The data is presented as an array of objects, with each object having the following key-value pairs:

- `title`: The title of the film
- `overview`: A short plot synopsis
- `release_date`: When the film was originally released
- `inventory`: How many copies of the film the video store owns

`customers.json` contains information about the customers that have rented with the store in the past. The data is presented as, you guessed it, an array of objects, with each object have the following key-value pairs:

- `name`: The customer's name
- `registered_at`: When the customer first visited the store
- The customer's physical address, composed of:
  - `address`
  - `city` 
  - `state`
  - `postal_code`
- `phone`: Primary contact phone number
- `account_credit`: For reason we'd rather not get into, the store owes all of their customers a little bit of money; this amount is made available to customers as credit toward future rentals.

## Wave 2: API Requirements
The API you build should have the following capabilities. The schema of your database and the structure of the endpoints are completely up to you. Make every effort to conform to RESTful routing patterns. Every endpoint (except for `/zomg` from the baseline) must serve `json` data. Use HTTP response codes to indicate the status of the request.

#### Authentication
- There is not an authentication requirement for this project; assume all users interacting with the API are video store employees.

#### Interface
- This part of the project is purely an API; all interactions should happen over HTTP requests. There is no front-end, user-facing interface.

#### Customers
- Retrive a list of all customers (`/customers`)
- Retrive a subset of customers (`/customers/sort/name?n=10&p=2`)
  - Given a sort column, return _n_ customer records, offset by _p_ records (this will be used to create "pages" of customers)
  - Sort columns are
    - `name`
    - `registered_at`
    - `postal_code`
- Given a customer's `id`...
  - List the movies they _currently_ have checked out (`/customers/5/current`)
  - List the movies a customer has checked out in the past (`/customers/5/history`)
    - ordered by check out date
    - includes return date

#### Movies
- Retrieve a list of all movies (`/movies`)
- Retrieve a subset of movies (`/movies/sort/release-date?n=5&p=1`)
  - Given a sort column, return _n_ movie records, offset by _p_ records (this will be used to create "pages" of movies)
  - Sort columns are
    - `title`
    - `release_date`
- Given a movie's `title`...
  - Get a list of customers that have _currently_ checked out a copy of the film (`/movies/Jaws/current`)
    - include each customer's name, phone number, and account credit
  - Get a list of customers that have checked out a copy _in the past_ (`/movies/Jaws/history/sort/name`)
    - include each customer's name, phone number, and account credit
    - ordered by customer `name` __or__
    - ordered by check out date

#### Rental
- Look a movie up by title to see (`/rentals/Jaws`)
  - it's synopsis
  - release date
  - available inventory (not currently checked-out to a customer) 
  - and inventory total
- See a list of customers that have _currently_ checked out any of the movie's inventory (`/rentals/Jaws/customers`)
- Given a customer's `id` and a movie's `title` ...
  - "check out" one of the movie's inventory to the customer (`/rentals/Jaws/check-out`)
    - Establish a return date
    - Charge the customer's account (cost up to you)
  - "check in" one of customer's rentals (`/rentals/Jaws/return`)
    - return the movie to its inventory
- See a list of customers with overdue movies (`/rentals/overdue`)
  - include customer name, movie title, check-out date, and return date

#### Testing
- All endpoints must be tested.
- We will use [Jasmine](https://github.com/mhevery/jasmine-node) for tests.
- There isn't a coverage requirement for this project, beyond demonstrating that every endpoint is covered by some manner of tests.
