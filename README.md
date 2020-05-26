# Video Store API

## At a Glance
- Pair, [stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md#stage-2) project
- Due EOD Friday at 6 PM on **DATE HERE**
- Submit this project with a PR

## Introduction

[Video rental stores](https://en.wikipedia.org/wiki/Video_rental_shop) are businesses that need to track a lot of things. Namely, they need to keep track of:

- the store's inventory of videos available for rental
- their customers

A small video rental business wants to start using software to help manage this data. They've already documented their video and customer information into files. Now, they're asking our team to build an API for them!

## Learning Goals

- Design an API in Rails that is compatible with a given dataset, and design an ERD and ActiveRecord models
- Build an API that exposes database contents
- Apply best practices to handle edge-cases in the context of an API, and reasonably handle bad user data
- Practice testing APIs through writing controller tests

## Objective

We will make an API in Rails for a small video rental store.

This API will be able to serve information about the store's inventory of videos and customer information. The API will also be able to update the status of rental.

You and your team should use all the techniques we've learned so far to keep yourselves organized and on track, and ensure that no requirements slip through the cracks.

### Project Structure

In the **"Testing Requirements"** section, there is a description of the smoke tests required for this project.

In the **"Setup Requirements"** section, there is Wave 0, which focuses on creating the design of this project and setting up the Rails app. It also describes the database seeds script provided in this project.

In the **"Functional Requirements"** section, Waves 1 and 2 will focus on describing the required endpoints for this project. These endpoints are described more-or-less in order of complexity. It's recommend to build them in that order.

**The schema of your database and the structure of your Rails app are completely up to you, so long as the API conforms to the description and provided script.**

### Success Criteria
Your project will be evaluated against the following requirements:

1. The API conforms to the requirements below, and all provided smoke tests pass (see section below)
1. The API has unit tests on **model validations**, and full test coverage on **every** controller action
    - In this project, the only required model tests are those around validations.
    - Every controller action/API endpoint should have at least one positive test case and at least one negative test case.

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
  - `db/seeds/videos.json`, a file that contains information about videos that are in the inventory of our video store.
  - `db/seeds/customer.json`, a file that contains information about customers of our video store.
  - `db/seeds.rb`, a seeds script that will read these two JSON files.

<details>
  <summary>Click here for more details about <code>videos.json</code> and <code>customer.json</code></summary>

  `videos.json` contains information about the videos available to rent at the store. The data is presented as an array of objects, with each object having the following key-value pairs:

  | Field          | Datatype | Description
  |----------------|----------|------------
  | `title`        | string   | The title of the video
  | `overview`     | string   | A short plot synopsis
  | `release_date` | date   | `YYYY-MM-DD`, Day the video was originally released
  | `total_inventory`    | integer  | The total number of copies of this video that the video store owns
  | `available_inventory` | integer | The current number of copies of this video available for check out/rental

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
- Positive and negative tests for any URI parameters
- Testing around any data in the request body

For this project, we will only require tests for the models around validations.

For each model, for every validation, you should have _at least_:
- A positive test case for a valid model
- A negative test case for each validation rule

Use good TDD practices, and test _before_ you code. Remember: red-green-refactor.

### Smoke Tests

#### What are Smoke Tests?
APIs are made to be used in combination with other apps. Think back to other projects where we've used an API. Wouldn't it be nice if we had tests that made sure an API was working as intended?

To this end, we have provided a set of [smoke tests](http://softwaretestingfundamentals.com/smoke-testing/) written in Postman to exercise all the endpoints.

Smoke tests are a *type of automated test.* The responsibility of smoke tests is to use more language/tool-agnostic set of test cases and to verify if something works very broadly. They are written to be fast and to check the most important features of an app.

Our smoke tests are *not* written in Ruby. They are formatted in JSON, and we will use Postman to run them (and not `rails test`.) This layer of testing helps us test that the API works, without relying on Ruby's Minitest.

<details>
  <summary>Want a little bit more explanation about smoke tests, unit tests, integration tests?</summary>

  The tests we've been writing before this are *unit tests.* Unit tests are focused on testing small, detailed features within the same code base as the app. Our unit tests were written alongside our implementation code, and both usually were in the same language.

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

#### Import the Smoke Tests

1. Open Postman
1. Click `Import` in the top left
1. Drag-and-drop the file into the box
1. In the left sidebar, click on the `Collections` tab
1. There should now be an entry for the smoke tests. Hover over it and click the `>` icon for a detailed view of every test.

#### Setup the Environment
1.  To do so go to the Gearbox in the top-right and select `Manage Environments`
![Manage Environments](images/manage-environment.png)
1.  Then Select `Add`
![add button](images/add-btn.png)
1.  Lastly add a key `base_url` and value `http://localhost:3000`
![Key & Value](images/key-value.png)

##### Alternatively, Import the Environment File
1. In the "Manage Environments" window, you can import an environment. We've included the environment file in `test/Video Store API development.postman_environment.json`

#### Run the Smoke Tests
1. Run your server. You'll need a running server open before Postman can reach any of your endpoints.
1. Explore! There are ways to run the whole collection of tests and ways to run each individual test.
1. To run a collection of tests:
    1. Click the blue `Run` button. This will launch the collection runner.
    1. In the collection runner, scroll down in the center pane and click the blue `Start Test` button

Ideally, by the time of project submission, all smoke tests will pass.

## Functional Requirements

All of the API requirements for this project are located in the project repo's wiki page.

Head to the project repo on GitHub, and look for the "wiki" tab!

<details>

  <summary>A wiki on GitHub?!</summary>

  It's actually fairly common for projects to use their wiki on GitHub as a form of documentation. Don't neglect to check this out on your favorite libraries!

</details>

## Reference
- [Postman on Environments](https://www.getpostman.com/docs/environments)

## What We're Looking For

Check the [feedback template](./feedback.md) to see how we will evaluate your project.
