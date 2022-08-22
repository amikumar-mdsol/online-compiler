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

## Images
<img width="1440" alt="ruby-hello-world" src="https://user-images.githubusercontent.com/83745466/186016987-bb26a99c-8bb7-4114-a2ac-f68f27299be8.png">
<img width="1440" alt="python-hello-word" src="https://user-images.githubusercontent.com/83745466/186017004-9ad2c7f7-e9cf-436b-b580-519d93ca2be8.png">
<img width="1440" alt="python-error" src="https://user-images.githubusercontent.com/83745466/186017013-2eebc802-8171-4679-a1ed-2c433f45bfd8.png">


## Testing
- We will use `RSpec` to write the test cases, to run the tests, run from project root
`bundle exec rspec`

	**Note:** The project track code coverages automatically in local environment, once you run the RSpec command the coverage report can be found at `coverage/index.html`, inside the project directory. `coverage` is already git ignored. It will look like this -<img width="1440" alt="Rspec coverage" src="https://user-images.githubusercontent.com/83745466/186016768-44e67b58-4ccb-4fa0-ae9e-40474130a167.png">

