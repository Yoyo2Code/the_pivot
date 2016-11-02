# The Pivot

![Alt text](./app/assets/images/stay-and-play.png?raw=true "Fancy Beast")

## Overview

The Pivot is a brownfield Rails project. The goal of this project was to pivot a single store e-commerce site into a multi-tenant application selling a completely different product.  

[Stay Here Play Near](http://stay-here-play-near.herokuapp.com/) is now a multi-tenant web application where users can book or rent out lodgings, inspired by the Airbnb platform. It was pivoted from a single store site selling [robot parts](http://cyborgism.herokuapp.com/).


This project was completed as part of the curriculum at the [Turing School of Software & Design](http://turing.io).  

It was built with Ruby on Rails 5.0.0.1.

#### Learning Goals

* Working with Multitenancy
* Implementing JavaScript
* Securing a Rails App
* Creating Seed files

### Live Version

You can find a live version of this application on Heroku at: http://stay-here-play-near.herokuapp.com/

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/Yoyo2Code/the_pivot`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `bundle exec rake db:{create,migrate,seed}` to set up the postgres database and seed it with properties, reservations, orders, locations, businesses, and users.
    - The seed includes the setup for an admin. To login as an admin, use these credentials - email: jorge@turing.io, password: password - or change these credentials in your seed file.
  5. Run the application in the dev environment by running `rails s`
  6. Visit `http://localhost:3000/`

### Features

#### Lodgings

The main purpose of our site is for users to be able to book and sell lodgings.  A regular user can browse [all lodgings](http://stay-here-play-near.herokuapp.com/)  or choose to browse [lodgings sorted by city or business owner](http://stay-here-play-near.herokuapp.com/more-options).  

#### Dynamic Search Filtering

Our application utilizes jQuery and JavaScript to provide dynamic search functionality without reloading the page.

If a user chooses to [search among all lodgings](http://stay-here-play-near.herokuapp.com/), they can use our search bar that filters lodging names as they type.

If a user has chooses to [search based on a specific city or business owner](http://stay-here-play-near.herokuapp.com/locations/denver), they can use our price range slider and calendar dropdown to further filter their options based on price and date availabilities.

#### Authentication

When a new user is interested in joining our website, they can [create a new account](http://stay-here-play-near.herokuapp.com/users/new). A user that has created an account can then [login](http://stay-here-play-near.herokuapp.com/login). A logged in user can change their own account details.

#### Business Admins

Once a user has created an account, they can then apply to open their own business.  If their application is accepted, they will be promoted to a business admin and can offer lodgings to other users.

#### Platform Admins

If a user is logged in with a platform admin account, they have the ability to approve or deny pending business applications and view orders across all users.  They can also manage their own lodgings like a business admin.

### Design

We used [Bootstrap](http://getbootstrap.com/) to style our website and [jQuery](https://jquery.com/) to provide dynamic rendering on our price slide and calendar/datepicker components. We also took advantage of a few of JavaScript's [ES6](http://es6-features.org/) features for a more concise codebase.


### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.

### Collaborators

[David Tinianow](https://github.com/dtinianow), [Jason Hanna](https://github.com/Automatic365), [Patrick Wentz](https://github.com/pwentz), [Yoseph Anderson](https://github.com/Yoyo2Code)
