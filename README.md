# Contributing

## Requirements
* RVM **1.29.12**
* PostgreSQL **14.4**
* Ruby **3.1.2**
* Rails **7.0.3.1**

## Installation

* **Cloning the repository**
`git clone git@github.com:amikumar-mdsol/online-compiler.git`
`cd online-compiler`

* Bundle project gems and create database and migrate
	* `bundle install`
	* `bundle exec rails db:create db:migrate db:seed`
	* Verify the installation is complete by
	`bundle exec rails c`  
	
## Usage
* Start the project server
`bundle exec rails s`

## Testing
- We will use `RSpec` to write the test cases, to run the tests, run from project root
`bundle exec rspec`

	**Note:** The project track code coverages automatically in local environment, once you run the RSpec command the coverage report can be found at `coverage/index.html`, inside the project directory. `coverage` is already git ignored.
