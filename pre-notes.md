#HOW DO I GET STARTED WITH MY SINATRA PORTFOLIO PROJECT?

### NO NOT WRITE CODE YET!!!! ###

#### Pre-coding work

1. Ideate! What do you want to build?
	- choose a domain you're familiar with!
	- choose a domain you care about 
	<!-- I will build an app that allows users to have a list of things to add to their bucket_list. -->

2. Wireframing & User Stories
  - GitHub and Dir structure
  <!-- Dir structure started with Corneal and added Licence.md, spec.md and my notes in pre-notes.md. -->
	<!-- GitHub/Dir is 'bucket_list'. -->

  - gems 
	<!-- Added to Gemfile by Corneal. -->

	- write down your models, their attributes, and their associations
	<!-- Models will be User and Item -->
	<!-- User has a name, email, username and password (has_secure_password) -->
	<!-- Item has a title, description and user_id -->
	<!-- User has_many :items -->
	<!-- Item belongs_to :user -->
  
	- as a user, I can .....
  <!-- Sign Up, Log In, Log Out -->
	<!-- CRUD: Create my Items, View Items, Edit my Items, Delete my Items -->
  
	- what does your app DO?
	<!-- the app will show all users' Items as well as allow user to create, edit, and delete their Items -->

3. Design your MVP = "Minimum Viable Product" vs. what are my 'stretch goals'

  - MVP
  <!-- Sign Up, Log In, Log Out -->
	<!-- CRUD: Create my Items, View Items, Edit my Items, Delete my Items -->

	- stretch goals - bonus features you want but don't need
  <!-- CSS -->
	<!-- Others TBC -->

			-- (~/Documents/flatiron/projects/sinatra/app-notes.md)
			-- start structure
					https://www.youtube.com/watch?v=y5XHoP5qwfY&feature=youtu.be   from min 17+ (corneal )
			-- add specs and edit as you go along
			https://github.com/learn-co-students/sinatra-cms-app-assessment-v-000/blob/master/spec.md
			-- create github for project and start git and commits


#### Coding

4. Build your models
	- Model classes including associations
  
  - migrations
  

5. Test your models and associations in the console
	- create some seed data (db/seeds.rb)
  



#### Consider Controllers and Views

6. Start with yout ApplicationController helpers - `#logged_in?` and `#current_user`
	- add your login/signuo/signout routes

7. Build out controller routes for other models (add a controller for each model)

8. Build views and controller actions based on the flow of your app, one step at a time, testing as you go.
	- use `shotgun` and `pry` (or `raise`/`inspect`) all the time!

#### Using the corneal gem

You are welcome to use the [corneal gem]. However, you should understand what it's going. Remove any folders and file you are not using. For example, if you are not going to write any tests, delete the 'spec' folder.

[corneal gem]:https://github.com/thebrianemory/corneal