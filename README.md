# Video Store API

## At a Glance
- Pair, [stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md#stage-2) project
- Due EOD Friday at 6 PM on **DATE HERE**
- Submit this project with a PR

## Introduction

[Video rental stores](https://en.wikipedia.org/wiki/Video_rental_shop) are businesses that need to track a lot of things. Namely, they need to keep track of:

- the store's inventory of videos available for rental
- their customers

A small video rental business would use software to help manage this data.

## Learning Goals

- Design an API in Rails that is compatible with a given dataset, and design an ERD and ActiveRecord models
- Build an API that exposes database contents
- Apply best practices to handle edge-cases in the context of an API, and reasonably handle bad user data
- Practice testing APIs through writing controller tests

## Objective

We will make an API in Rails for a small video rental store.

This API will be able to serve information about the store's inventory of videos and customer information.

The API will also be able to update the status of rental.

This repository provides two JSON datafiles to serve as the initial seeds for this system.

You and your team should use all the techniques we've learned so far to keep yourselves organized and on track, and ensure that no requirements slip through the cracks.

### Project Structure

In the "Testing Requirements" section, there is a description of the smoke tests required for this project.

In the "Setup Requirements" section, there is Wave 0, which focuses on creating the design of this project and setting up the Rails app. It also describes the database seeds script provided in this project.

In the "Functional Requirements" section, Waves 1 and 2 will focus on describing the required endpoints for this project. These endpoints are described more-or-less in order of complexity. It's recommend to build them in that order. TODO: Every endpoint must serve JSON data, and must use HTTP response codes to indicate the status of the request.

The schema of your database and the structure of your Rails app are completely up to you, so long as the API conforms to the description and provided script.

### Success Criteria
Your project will be evaluated against the following requirements:

1. The API conforms to the requirements below, and all provided smoke tests pass (see section below)
  1. This should have equal emphasis on positive cases, and handling errors
1. The Rails API has tests on some model validations, and full test coverage on every controller action
  1. In this project, the only required model tests are those around validations
  1. Every controller action/API endpoint should have at least one positive test case and at least one negative test case

## Setup Requirements

Use the following steps as a guide to help you and your team agree on a design for the project.

As part of this, you and your team should also spend time talking about communication styles, team goals, and creating a kanban board together.

### Wave 0: Design Activity

- Read the API Requirements specified in the Functional Requirements section and take note of the following for each endpoint:
  - The _HTTP verbs_ each endpoint will use
  - Any data that must be provided to the endpoint in order for it to do its work
- Read the Seed Data description below and, bearing in mind the API Requirements, create an ERD for your database that specifies
  - The _models_ your database will require
  - The _attributes_ for each model
  - Any _relationships_ between models

### Starting Your Rails App

Once you and your team have settled on an initial ERD, create your Rails app:

- High-five!
- Fork and clone this repo, and add each other as collaborators
- `cd` into the project directory
- Create a new Rails app to serve as the API:
  - **Create the rails app with:** `$ rails new . --api`
  - Say "`n`" for "no" for overriding the README, test files, or db/seed files.
- Test that your API works by creating a small test route:
  - Start your Rails server
  - Create a route that responds to `/zomg` that serves a json-encoded test message, such as `"it works!"`
- Generate Rails models and associations to match your ERD
- Use the provided seed script `db/seeds.rb` to import the provided JSON data into your database

### Seed Data

We are providing:
  - `db/seeds/movies.json`, a file that contains information about videos that are in the inventory of our video store.
  - `db/seeds/customer.json`, a file that contains information about customers of our video store.
  - `db/seeds.rb`, a seeds script that will read these two JSON files.

<details>
  <summary>Click here for more details about <code>movie.json</code> and <code>customer.json</code></summary>

  `movies.json` contains information about the videos available to rent at the store. The data is presented as an array of objects, with each object having the following key-value pairs:

  | Field          | Datatype | Description
  |----------------|----------|------------
  | `title`        | string   | The title of the film
  | `overview`     | string   | A short plot synopsis
  | `release_date` | date   | `YYYY-MM-DD`, Day the film was originally released
  | `inventory`    | integer  | How many copies of the film the video store owns

  `customers.json` contains information about the customers that have rented with the store in the past. The data is presented as, you guessed it, an array of objects, with each object have the following key-value pairs:

  | Field            | Datatype | Description
  |------------------|----------|------------
  | `name`           | string   | The customer's name
  | `registered_at`  | datetime   | `Wed, 29 Apr 2015 07:54:14 -0700`, When the customer first visited the store
  | `address`        | string   | Street address
  | `city`           | string   | &nbsp;
  | `state`          | string   | &nbsp;
  | `postal_code`    | string   | &nbsp;
  | `phone`          | string   | Primary contact phone number

</details>

## Testing Requirements

### Unit Tests

Because APIs are often open to the public, thorough testing is essential. For a Rails API, that means controller testing.

For each API endpoint defined in the controllers, you should have _at least_:
- A basic test with no parameters, if applicable
- Positive and negative tests for any URI parameters (user ID, movie title)
- Testing around any data in the request body

For this project, we will only require tests for the models around validations.

For each model, for every validation, you should have _at least_:
- A positive test case for a valid model
- A negative test case for each validation rule

Use good TDD practices, and test _before_ you code. Remember: red-green-refactor.

### Smoke Tests

#### What are Smoke Tests?
APIs are made to be used in combination with other apps. Nobody can use just an API-- other developers need to rely on it. Think back to the Slack CLI project or Inspiration Board project.

To this end, we have provided a set of [smoke tests](http://softwaretestingfundamentals.com/smoke-testing/) written in Postman to exercise all the endpoints.

Smoke tests are a *type of automated test.* The responsibility of smoke tests is to use a more language/tool-agnostic set of test cases and to verify if something works more broadly. They are written to be fast and to check the most important features of an app.

The tests we've been writing before this are *unit tests.* Unit tests are focused on testing small, detailed features within the same code base as the app. Our unit tests were written alongside our implementation code, and both usually were in the same language.

Our smoke tests are *not* written in Ruby. They are formatted in JSON, and we will use Postman to run them (and not `rails test`.) This layer of testing helps us test that the API works, without relying on Ruby's Minitest.

<details>
  <summary>Want a little bit more explanation about smoke tests, unit tests, integration tests?</summary>

  Our unit tests relied on us knowing a lot about our app. When we write and use our unit tests, they are checking that we're using Rails correctly; our tests check if we've set up model relationships with Active Record correctly, or that our view helpers are correct, or a lot of things that are in high-detail.

  We can imagine that unit tests feel like a detailed checklist that helps us verify that our code is correct-- we have lab coats, we observe our app in the labratory, and we check things one-by-one off a clipboard.

  Smoke tests are intentionally written to be more vague and loose. We can also think of them as a kind of [*integration test*](https://en.wikipedia.org/wiki/Integration_testing), or tests that check to make sure one or more systems are correct, from an "outside perspective."

  Our smoke tests are integration tests because they are run in Postman, and they will not be detailed about the Rails' implementation. They will only check that for a given request, it comes back with a specific response.
</details>

### How do we use Smoke Tests?

The smoke tests will verify that your API looks correct to the outside world, by sending actual HTTP requests to your running server and checking the results. They test things like:

- Did I get a success response for a valid request?
- Did the API return JSON?
- Does the JSON contain the expected property names?

We have also included [this video](https://adaacademy.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=1324e06e-9767-49e4-85a0-a98c0122d69a) to show you how to run and use smoke tests.

**The smoke tests are not a substitute for writing your own unit tests inside of your Rails app!!!!!** They do **not** check that the content is _correct_, nor do they cover any negative or edge cases. Verifying correctness in these cases is **your** responsibility.

The smoke tests live in the [test folder](test). To run them:

1. Open Postman
1. Click `Import` in the top left
1. Drag-and-drop the file into the box
1. In the left sidebar, click on the `Collections` tab
1. There should now be an entry for the smoke tests. Hover over it and click the `>` icon for a detail view.  You will notice they are in the format `{{url}}/movies`.  `{{url}}` is a key which you can give a value on your computer.
1.  To do so go to the Gearbox in the top-right and select `Manage Environments`
![Manage Environments](images/manage-environment.png)
1.  Then Select `Add`
![add button](images/add-btn.png)
1.  Lastly add a key `url` and value `http://localhost:3000`
![Key & Value](images/key-value.png)
1. Click the blue `Run` button. This will launch the collection runner.
1. In the collection runner, scroll down in the center pane and click the blue `Start Test` button

## Functional Requirements

### Error Handling Requirements for Every Endpoint

As a reminder: it's crucial for all APIs to be able to handle errors.

If something goes wrong, your API should return an appropriate [HTTP status code](http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/), as well as a list of errors. For this project, the list of errors should be formatted like this:

```json
{
  "errors": {
    "title": ["Movie 'Revenge of the Gnomes' not found"]
  }
}
```

All errors your API can return should be covered by at least one controller test case.

### Wave 1: Customers and Movies

#### `GET /customers`
List all customers

Fields to return:
- `id`
- `name`
- `registered_at`
- `postal_code`
- `phone`
- `movies_checked_out_count`
  - This will be 0 unless you've completed optional requirements

#### `GET /movies`
List all movies

Fields to return:
- `id`
- `title`
- `release_date`

#### `GET /movies/:id`
Look a movie up by `id`

URI parameters:
- `id`: Movie identifier

Fields to return:
- `title`
- `overview`
- `release_date`
- `inventory` (total)
- `available_inventory` (not currently checked-out to a customer)
  - This will be the same as `inventory` unless you've completed the optional endpoints.

#### `POST /movies`
Create a new movie in the video store inventory.

Upon success, this request should return the `id` of the movie created.

Request body:

| Field         | Datatype            | Description
|---------------|---------------------|------------
| `title` | string             | Title of the movie
| `overview` | string | Descriptive summary of the movie
| `release_date` | string `YYYY-MM-DD` | Date the movie was released
| `inventory` | integer | Quantity available in the video store

### Wave 2: Rentals

Wave 1 focused on working with customers and movies. With these endpoints you can extend the functionality of your API to allow managing the rental process.

#### `POST /rentals/check-out`
Check out one of the movie's inventory to the customer. The rental's check-out date should be set to today, and the due date should be set to a week from today.

**Note:** Some of the fields from wave 2 should now have interesting values. Good thing you wrote tests for them, right... right?

Request body:

| Field         | Datatype            | Description
|---------------|---------------------|------------
| `customer_id` | integer             | ID of the customer checking out this film
| `movie_id`    | integer | ID of the movie to be checked out

#### `POST /rentals/check-in`
Check in one of a customer's rentals

Request body:

| Field         | Datatype | Description
|---------------|----------|------------
| `customer_id` | integer  | ID of the customer checking in this film
| `movie_id`    | integer | ID of the movie to be checked in

## Optional Enhancements
These really are **optional** - if you've gotten here and you have time left, that means you're moving speedy fast!

### Query Parameters
Any endpoint that returns a list should accept 3 _optional_ [query parameters](http://guides.rubyonrails.org/action_controller_overview.html#parameters):

| Name   | Value   | Description
|--------|---------|------------
| `sort` | string  | Sort objects by this field, in ascending order
| `n`    | integer | Number of responses to return per page
| `p`    | integer | Page of responses to return

So, for an API endpoint like `GET /customers`, the following requests should be valid:
- `GET /customers`: All customers, sorted by ID
- `GET /customers?sort=name`: All customers, sorted by name
- `GET /customers?n=10&p=2`: Customers 11-20, sorted by ID
- `GET /customers?sort=name&n=10&p=2`: Customers 11-20, sorted by name

Of course, adding new features means you should be adding new controller tests to verify them.

Things to note:
- Sorting by ID is the rails default
- Possible sort fields:
  - Customers can be sorted by `name`, `registered_at` and `postal_code`
  - Movies can be sorted by `title` and `release_date`
  - Overdue rentals can be sorted by `title`, `name`, `checkout_date` and `due_date`
- If the client requests both sorting and pagination, pagination should be relative to the sorted order
- Check out the [will_paginate gem](https://github.com/mislav/will_paginate)

### More Endpoints: Inventory Management
All these endpoints should support all 3 query parameters. All fields are sortable.

#### `GET /rentals/overdue`
List all customers with overdue movies

Fields to return:
- `movie_id`
- `title`
- `customer_id`
- `name`
- `postal_code`
- `checkout_date`
- `due_date`

#### `GET /movies/:id/current`
List customers that have _currently_ checked out a copy of the film

URI parameters:
- `id`: Movie identifier

Fields to return:
- `customer_id`
- `name`
- `postal_code`
- `checkout_date`
- `due_date`

#### `GET /movies/:id/history`
List customers that have checked out a copy of the film _in the past_

URI parameters:
- `id`: Movie identifier

Fields to return:
- `customer_id`
- `name`
- `postal_code`
- `checkout_date`
- `due_date`

#### `GET /customers/:id/current`
List the movies a customer _currently_ has checked out

URI parameters:
- `id`: Customer ID

Fields to return:
- `title`
- `checkout_date`
- `due_date`

#### `GET /customers/:id/history`
List the movies a customer has checked out _in the past_

URI parameters:
- `id`: Customer ID

Fields to return:
- `title`
- `checkout_date`
- `due_date`


## Reference
- [Postman on Environments](https://www.getpostman.com/docs/environments)

## What We're Looking For

Check the [feedback template](./feedback.md) to see how we will evaluate your project.
