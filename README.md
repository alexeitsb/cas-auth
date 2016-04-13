## cas-auth

By [alexeitsb](http://alexeitsb.github.io)

Single Sign On solution using [gem CASino](https://github.com/rbCAS/CASino). It manage multiple clients and support user authentication via web browser and API.

### WEB Features

* Clients management (admin users only)
* Sign in (username and password)
* Sign out
* Update profile including avatar picture uploaded to AWS S3
* Update password
* Generate a new password case user forgot it.

### API Features

* Sign in (username and password)
* Sign out
* Create new user and associate the user to a client
* Update password
* Generate a new password case user forgot it.

Users are notified via e-mail and SMS.

### Setup

* rake db:create
* rake db:migrate
* rake db:seed

### Services

* [Postmark](https://postmarkapp.com/) - E-mail delivery
* [SMS Gateway](https://smsgateway.me/) - SMS delivery
* [AWS S3](https://aws.amazon.com/s3/) - File storage

### Environment vars

cp config/vars.rb.example config/vars.rb

And set vars!
