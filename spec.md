# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app

- [x] Use ActiveRecord for storing information in a database

- [x] Include more than one model class (e.g. User, Post, Category)
  - Included User and Items

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - User has_many :items

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - Items belongs_to :user

- [x] Include user accounts with unique login attribute (username or email)
  - User has username and email. Email will be used as a unique identifier
  
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - With the ItemsController actions, the User can create, read, update, and delete Items.
  
- [ ] Ensure that users can't modify content created by other users

- [ ] Include user input validations

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code


Confirm
- [ ] You have a large number of small Git commits

- [ ] Your commit messages are meaningful

- [ ] You made the changes in a commit that relate to the commit message

- [ ] You don't include changes in a commit that aren't related to the commit message