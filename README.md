== README
 
The objective of this document is to outline the technologies and structure of the Quiz application. For any inquiries please open an issue.

== Building from Source
The following is required to be installed on your local PC:
* Ruby 1.9.3
* Rails 4.0.0
* Bundler
* Git
If you are using Windows or Mac OS, the previous items can be installed easily by using the rails installer (http://railsinstaller.org/en) 
If you are using Unix or Linux, please install the items using your own package manager.

To pull the code from Heroku, you will first need to have an account on Heroku and access to the project.
Then open up your command prompt and 
$ gem install heroku
$ heroku login
 [then enter your credentials] 
$ heroku keys:add [path to keyfile]
$ git clone git@heroku.com:<heroku_app>.git <local_directory>

Next, navigate to the local_directory, set up the local database, and start the server
$ cd project
$ bundle install
$ rake db:migrate
$ rails server
Finally, open your internet browser and navigate to http://127.0.0.1:3000 to run the application.

== Technologies
* Ruby
* Rails
* Bootstrap
* Syntactically Awesome StyleSheets (SASS)
* Jquery
* Friendly_id
* jQuizMe

== jQuizMe Modifications
First is the addition of the “cf” class to the “quiz-el” div container. This clearfix forces the floated buttons to appear inside the container.
Second is the addition of the “AJAX_increase_url” parameter. The Begin Quiz button sends an AJAX call to the server which increases the popularity count. By including it in the jQuizMe code itself, it allows quizzes embedded on other sites to also increase popularity count.

== Minification
The embed.js and embed.css files have been minified with Compressorrater to reduce load time on external sites. The full files are available without the .min extension.
All other assets are automagically minified with the uglifier gem.
 
== Integration Tests
This app was built using Test Driven Development techniques. The full test suite is stored in the spec/ folder and can be run by using rspec at the command line
$ bundle exec rspec spec/
Please be sure to run the test suite after any changes have been made.
Note that JavaScript has not been accounted for in these Integration tests. Modifying any JavaScript files will require extensive manual testing to ensure that nothing has become broken.
Database Schema 
 
== Users
At present, there is only one user in the database who can create and edit quizzes. It is possible to create more users directly through the database. Users are only able to edit and delete their own quizzes. The login page is currently an unlinked URL located at /signin/
To extend the application and enable user signup, one would need to:
* Add the new, create, and show actions to the users controller
* Add a user signup page
* Modify the browse page to remove edit/delete buttons for logged in users
* Add a show page for the users which displays all their quizzes
It would also be a good idea to add administrative powers for administering all users and quizzes on the site, however this is out of the scope of this project.

== Quiz Generation
The new quiz form simply takes user input populates the database from the following rules:
# A user has one or more quizzes
# A quiz has one or more questions (maximum of 10)
# A question has one or more answers (maximum of 6. True/False and Fill in the Blank can only have 1 answer)
The display logic for the quiz create page is contained in custom.js. This code relies heavily on the link_to_remove_fields and link_to_add_fields functions contained within application_helper.rb. These two files handle the hiding and showing of questions and answers.
The generation code is contained in embed/embed.js. This file contains the entire jQuizMe codebase, as well as all the code for generating a jQuizMe object from the database by using JSON. 

== Embedding Quizzes
The magic happens in the show.js.erb file in the quizzes view. 
This file creates asynchronous connection to the server, adds the required embed code to the website, converts the quiz from a database object to a JSON object, and calls the quiz generator to display the quiz on screen.

== Share Buttons
Social buttons with share count are handled by http://www.sharethis.com/ while social buttons on embedded quizzes are manually created in the _embed.html.erb partial. This means that to change text or images for sharing, 2 files need to be modified. First is the _embed.html.erb partial and second is the _opengraph.html.erb partial.
