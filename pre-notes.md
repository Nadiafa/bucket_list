#HOW DO I GET STARTED WITH MY SINATRA PORTFOLIO PROJECT?

### NO NOT WRITE CODE YET!!!! ###

#### Pre-coding work

1. Ideate! What do you want to build?
	- choose a domain you're familiar with!
	- choose a domain you care about 
		- I will build an app that allows users to have a list of things to add to their bucket_list.

2. Wireframing & User Stories
	- GitHub and Dir structure 
		- Dir structure started with Corneal and added Licence.md, spec.md and my notes in pre-notes.md.
		- GitHub/Dir is 'bucket_list'.

	- gems  
		- Added to Gemfile by Corneal.

	- write down your models, their attributes, and their associations 
		- Models will be User and Item
		- User has a name, email, username and password (has_secure_password)
		- Item has a title, description and user_id
		- User has_many :items
		- Item belongs_to :user
  
	- as a user, I can ..... 
		- Sign Up, Log In, Log Out
		- CRUD: Create my Items, View Items, Edit my Items, Delete my Items
  
	- what does your app DO? 
		- The app will show all users' Items as well as allow user to create, edit, and delete their Items

3. Design your MVP = "Minimum Viable Product" vs. what are my 'stretch goals'

	- MVP 
		- Sign Up, Log In, Log Out
		- CRUD: Create my Items, View Items, Edit my Items, Delete my Items

	- stretch goals - bonus features you want but don't need 
		- CSS
		- Others TBC

#### Coding

4. Build your models
	- Model classes including associations 
		- Model User has a name, email, username and password_digest (has_secure_password)
		- Model Item has a title, description and user_id
		- Model User has_many :items
		- Model Item belongs_to :user

	- migrations 
		- Created and migrate tables for :users and :items

5. Test your models and associations in the console
	- create some seed data (db/seeds.rb) 
		- Created seeds.rb and seeded

#### Consider Controllers and Views

6. Start with yout ApplicationController 
	- helpers `#logged_in?` and `#current_user` 
		- Added helper methods `#logged_in?` and `#current_user`
	- add your login/signup/signout routes
		- Will have get/post login, get/post signup routes and views, and get logout route in the UsersController

7. Build out controller routes for other models
	- add a controller for each model
		- Controllers created for users and items and mounted to config.ru
		
8. Build views and controller actions based on the flow of your app, one step at a time, testing as you go.
	- use `shotgun` and `pry` (or `raise`/`inspect`) all the time! 
		- shotgun and pry are installed and I have included a rake console task for testing
		- UsersController: Created get/post login, get/post signup routes and views, and get logout route
		- ItemsController: Created get/post and views to view all items, individual items, dreate, edit and delete own items.

#### Using the corneal gem

9. You are welcome to use the [corneal gem].
	- [Corneal gem]
		- Tidied up Corneal's prepopulated welcome.erb and added login and signup links
	- Remove any folders and file you are not using
		- Used Corneal to create dir structure, create models and migration tables
	


<!-- **************** DONE:  Tidy up Corneal's prepopulated layout -->
<!-- **************** DONE:  Create login, signup and logout routes and views -->
<!-- **************** DONE:  Create user's page view (to go to after login or signup that shows user's Items and has links to Create, Log out, View All) -->
<!-- **************** DONE:  Create a CreateItems (new) page view (to create new Items) -->
<!-- **************** DONE:  Create a EditItems page view (to edit own Items) -->
<!-- **************** DONE:  Create item's page view (to go to after an Item is created or via link from the index or user's page) -->
<!-- **************** DONE:  Create an index page (where all users' items will be listed and will include links to each Item) -->
<!-- **************** DONE:  Add links to edit and delete for each owned Item -->
<!-- **************** DONE:  Add conditions so what users can view/do depending on whether they are logged in -->
<!-- **************** DONE:  STRETCH Add flash messages -->
<!-- **************** DONE:  STRETCH Refactor/Check if I can add more helper methods -->






[corneal gem]:https://github.com/thebrianemory/corneal 