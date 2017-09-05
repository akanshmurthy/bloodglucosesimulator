# Blood Glucose Simulator

This is a web application to track daily blood glucose levels.

## Setup Instructions 

To run, download or clone the repo. Then, issue the following commands:

```
bundle install
rails db:migrate
rails db:seed
rails server
```
To run the test suite, run the following command:

```
bundle exec rake test
```

## Requirements

  - eating food increases blood sugar linearly for 2 hours, depending on the food's glycemic index
  - exercising decreases blood sugar linearly for 1 hour, depending on the exercise's index
  - blood sugar starts at 80
  - if no activity or food for a while, blood sugar normalizes to 80 linearly at a rate of 1/minute
  - for every minute the blood sugar is above 150, glycation increments by 1
  - inputs: food and exercise data (strings)
  - outputs: graph of blood sugar for the day and a graph of glycation for the day

## Design Docs

* [View State Diagram][state]
* [DB schema][schema]

[state]: ./docs/states.md
[schema]: ./docs/schema.md

## Features

My minimum viable product allows
  - users to enter in food eaten or exercise done (will match to database entries if they exist or create 
    new items if they don't exist)
  - look at graphs, utilizing the Gruff gem, of blood glucose levels or glycation levels per day
  
## Design choices

I chose Ruby on Rails as a framework because it is very fast for creating MVPs. 
Initially, I was going to save food and exercise items to the DB as they were 
entered, while calculating and saving blood sugars to the DB as well, based on 
those items and all items up to that point starting from the beginning of the day.
However, that would result in a lot of blood sugar items being saved to the DB
as I was planning to save values for each minute. I was either going to do a cron
or background job for the calculation. But, I found out that that would take too much
time. Forgoing that, I decided to try another approach. I saved food and exercise 
entries as events with the relevant glycemic or exercise indices. Then, I grabbed
all events past midnight, calculated increments that each event would cause, 
and then calculate the blood sugar for all minutes of the day in memory.

## Future considerations to scale current implementation

  - have a background job calculate the blood sugar levels
  - use a cache for the latest values so that visiting the graph page doesn't trigger recalculations every time
  - improve test coverage
  - improve the user interface

