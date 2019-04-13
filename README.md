Click [here](https://nomster-zoe-kramer.herokuapp.com/) to visit Nomster.

# Nomster

### Overview

A web application, built with Ruby on Rails, that uses the Google Maps API to show restaurants, their reviews, and images. Users are able to sign up, comment, and upload new restaurants to the website and are emailed when someone comments on their own uploaded restaurant. 

### Code Structure

**Models**:

*Place Model* - This can be found in [`app\models\place.rb`](https://github.com/ZoeBKramer/nomster/blob/master/app/models/place.rb). This model handles the validations for entering in a new place as well as stores the geocoded address. This model ties the place to the user that created it and allows it to have many comments and photos.  

*User Model* - This can be found in [`app\models\user.rb`](https://github.com/ZoeBKramer/nomster/blob/master/app/models/user.rb). This model allows the user to have many places, comments, and photos. We use the devise gem in this model to handle user authentication. 

*Photo Model* - This can be found in [`app\models\photo.rb`](https://github.com/ZoeBKramer/nomster/blob/master/app/models/photo.rb). This model ties the photo to the user that posted it, as well as the place it was posted under. We use the Carrierwave gem to handle the actual photo uploading, using AWS as our storage. 

*Comment Model* - This can be found in [`app\models\comment.rb`](https://github.com/ZoeBKramer/nomster/blob/master/app/models/comment.rb). This model handles the validations for entering in a new comment. This model also ties the comment to the user that posted it, as well as the place it was posted under. The creation of a comment triggers the sending of an email, using the NotificationMailer. This model supports both a message and a rating.  

**Views**:

*Index View* - This is found in [`app\views\places\index.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/places/index.html.erb). This displays every place in the database onto the page, as well as the most recent comment on the place. At the top of the index page, a carousel is displayed, scrolling through a couple of photos. 

![The Index View Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/Nomster.png)

*New Place View* - This is found in [`app\views\places\new.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/places/new.html.erb). This creates the form that the user can enter a place into. 

![The New Place View Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/NewPlace.png)

*Edit Place View* - This is found in [`app\views\places\edit.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/places/edit.html.erb). This creates the form that the user can use to update the places data. 

![The Edit Place View Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/EditPlace.png)

*Show Place View* - This is found in [`app\views\places\show.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/places/show.html.erb). This displays the specific place that the user clicked on as well as a map with the pinpointed location of that place. On this page, it shows the comments and photos that users have posted under this place. This page also contains the modals for entering a new comment/rating as well as a photo/caption. 

![The Show Place View Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/Place.png)

![The Comment and Rating Modal Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/Comment.png)

![The Photo and Caption Modal Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/Photo.png)

*User Dashboard View* - This is found in [`app\views\users\show.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/users/show.html.erb). This displays the users email, how long they have been a member, their comments, and their places. 

![The User Dashboard View Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/UserShow.png)

*Comment Added Email* - This is found in [`app\views\notification_mailer\comment_added.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/notification_mailer/comment_added.html.erb) as well as [`app\views\notification_mailer\comment_added.text.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/notification_mailer/comment_added.text.erb). This controls what email is sent to the user whenever a comment is added to a place that they have created. 

![The Comment Added Email Image](https://raw.githubusercontent.com/ZoeBKramer/nomster/master/app/assets/images/Nomster/CommentAddedEmail.png)

*Header and Footer* - This is found in [`app\views\layouts\application.html.erb`](https://github.com/ZoeBKramer/nomster/blob/master/app/views/layouts/application.html.erb). This controls what is displayed in the header and footer on every page in the application.

**Controllers**:

*Places Controller* -

* Index Method: Displays only 5 places per page using the will-paginate gem.

* New Method: Initializes the place object.

* Create Method: Adds a new place, if valid, into the database.

* Show Method: Finds the place by ID and initializes the photo and comment object.

* Edit Method: Finds the place by ID, only if the user logged in is the same as the user who created the place. 

* Update Method: Updates the place, only if the user logged in is the same as the user who created the place. 

* Destroy Method: Finds place by ID and destroys it, only if the user logged in is the same as the user who created the place. 

*Photos Controller* -

* Create Method: Adds a new photo, if valid, into the database.

*Comments Controller* -

* Create Method: Adds a new comment, if valid, into the database. 

*Users Controller* -

* Show Method: Finds the user by ID. 

**Gemfiles**:

[bootstrap gem](https://github.com/twbs/bootstrap-rubygem) -

[will-paginate gem](https://github.com/mislav/will_paginate) -

[simple-form gem](https://github.com/plataformatec/simple_form) -

[font-awesome-rails gem](https://github.com/bokmann/font-awesome-rails) -

[devise gem](https://github.com/plataformatec/devise) -

[geocoder gem](https://github.com/alexreisner/geocoder) -

[figaro gem](https://github.com/laserlemon/figaro) - 

[carrierwave gem](https://github.com/carrierwaveuploader/carrierwave) -

[fog-aws gem](https://github.com/fog/fog-aws) -

# Set Up Vagrant

Click [here](https://github.com/university-bootcamp/coding-environment/blob/master/windows-vagrant.md) to find the instructions for setting up Vagrant.

### Vagrant

Between each of the coding sessions you do, especially if you restart your machine, you will need to run the following command to start your vagrant environment prior to connecting:

`vagrant up`

When this command completes, run the vagrant ssh command to log in to Vagrant.

After this completes, you will be taken to a coding environment inside your virtual machine, and your terminal should contain the green [ENV].

Running the `killall ruby` command in your terminal should quit all running Rails servers.

**To ensure that your server is not running** -— If you visit the URL [http://localhost:3030](http://localhost:3030) in your browser, you should not see a web page load. You should ensure that your server is not running before starting new server windows.

**If you want to preview the application that is running within your coding environment**—Visiting the [http://localhost:3030](http://localhost:3030) from your web browser will allow you to do this.

All the files within this folder inside the Vagrant environment will be automatically synced outside the Vagrant environment to folder inside the `coding-environment/src` folder that is located outside the virtual machine, usually on your Desktop.

# Set Up Nomster

### Checking Out the Repo

Check this repository out into your `coding-environment/src` folder. 

### Create the Initial Database

Connect to your Vagrant instance, change the directory `cd /vagrant/src/nomster`

Run `rake db:create`

### Starting Up Your Server

In a separate terminal, change the directory `cd /vagrant/src/nomster`

Start your server by running `rails server -b 0.0.0.0 -p 3000`


