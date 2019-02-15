# Community Tool Lending Library Demo App

This is a demo web-app for a free tool lending community library that I and a team of three other people built from scratch in about three business days.

It is currently running on heroku:

https://fast-temple-14445.herokuapp.com

It has two user modes: Member or librarian.

A member can log in and edit their personal information and view what tools they currently have checked out.

A librarian can: 
<ul>
<li>Sign up members</li>
<li>Select members and check tools in and out for them</li>
<li>See the lists of available tools and checked out tools</li>
<li>See to whom tools are checked out and see when they're due back</li>
<li>See what tools are checked out to a particular member</li>
</ul>

For a librarian to check tools out to a member they first select the member then add the desired tools to the shopping cart and select "Check Out".  There is a modal box that confirms the checkout.

There is a status bar at the top right that always displays the username of whomever is currently logged in and the username that is being served. (if a librarian is serving a member)

If you want to log in as a librarian too see and play with the functionality use:

Username: Librarian<br>
Password: Librarian

The back end is in the java spring MVC framework.

## The app uses 9 controllers:
 <ul>
<li>Authentication</li>
<li>Cart</li>
<li>Checkout</li>
<li>Homepage</li>
<li>Member</li>
<li>Reservation</li>
<li>Return</li>
<li>Tool</li>
<li>User</li>
</ul>

## Uses 4 DAOs: 
<ul>
<li>Member</li>
<li>Reservation</li>
<li>Tool</li>
<li>User</li>
</ul>

It has DAO integration tests built in.

## Uses 11 classes:
<ul>
<li>AvailableTool</li>
<li>CheckedOutTool</li>
<li>Login</li>
<li>Member</li>
<li>Registration</li>
<li>Reservation</li>
<li>Shopping Cart</li>
<li>Tool</li>
<li>UpdateDL (Update driver's license</li>
<li>UpdatePassword</li>
<li>User</li>
</ul>

## The postgresql database has four tables:
<ul>
<li>app_user</li>
<li>tool</li>
<li>tool_type</li>
<li>reservation</li>
<li>tool_reservation</li>
</ul>

Tool and tool_type are seperate and have a one to many relationship because we might have ten actual instances of one type of tool, like a 12 oz drywall hammer.

Reservation and tool_reservation are seperate and have a one to many relationship because everytime a shoppingcart is checked out for a member that counts as one reservation but that shopping cart might have multiple tools in it.

app_user is obviously just for the users and their personal information including their salted hashed password.

The database folder has a bash script and several sql scripts to set up the database.

The jsp pages all use a common header and footer.

The app uses a CDN for jquery and bootstrap

The database uses salted password hashing.

It uses a CSRF filter and has client side and server side form validaton on all the form inputs.

The app uses bootstrap and is completely mobile responsive.
