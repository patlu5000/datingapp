This project is broken down into different phases.

In general this application can be broken down into many parts, these parts can be easily translated into an online application as we go.

##Phase 1: Terminal based dating application - 2/18
###New Concepts: Making and Saving a file, JSON
  * Download or copy and paste this JSON file. It contains existing users, who have registered already. Your first goal is to import this JSON file into a ruby program and convert it into a hash which you can use.
    * Hint: file_data = JSON.parse(IO.read ("sample.json")) sets file\_data as a Hash of Array of Hashes, with each hash representing a user.
    * Hint: users = file_data["users"] sets users to an Array of Hashes, with each hash representing a user.
    * A good first goal would be to print out the contents of the file somehow.

  * Make program that prompts the user for a username.
      * If the user is found, print out their existing information in an easy to read format, then ask the user if they want to change any of their info. If the user types "y" then proceed and change it, if the user types "n" or anything else don't change it. At this point you need to save their information to the JSON file.
      * If that username is not found within the file of current users, ask if they want to create an application. Ask them for all of their info, and then save their information to the JSON file.
      * Currently the program asks for only a few things, their email, gender, what gender their looking for, and their favorite color.

  * Re run your program. Try to login as an existing user. If your program prints out the current user's email, gender, what gender they are seeking, and their favorite color, that's it for phase 1.


##Phase 2: Customization and matching
  * Currently your program only takes in a few things from the user. Change your program to ask and record other information from the user. Perhaps you can ask them if they have a pet, what kind of pet, what their favorite food is... it's really up to you. Think about what makes people compatible.
    * A good idea would be to limit the amount of choices the user has, to maybe 9 at most. Perhaps when you ask "What is your favorite food?" You can ask - What is your favorite type of food? (Chinese, Italian, American, Japanese, Mexican, Mediterranean ... )

  * Delete or move the sample JSON file into another folder, since it's invalid with these current preferences.

  * Run your program again, since your JSON file is empty, the first time your run your program it will for sure make a new user.

  * Make 4 sample users. Make 2 of them "compatible." The question is, what is compatibility? Is it that they like the same color? Is it that they have 3 or 4 things in common? It's up to you. Perhaps you could even make it that you match people who like red with people who like blue. Perhaps you can have weighted preferences, and say that if 2 people have the same favorite movie or book, they are DEFINITELY compatible.

  * Make a method called <code>is_compatible?(user1, user2)</code> Which takes in 2 users (or hashes respresenting users) and returns true if they are compatible, and false if they aren't.

  * Make a method called find_compatible(user, allusers) which takes in a user (or hash), and then the array with all the users in it. Have this method return an array of all the compatible matches for that user, or an empty array if there aren't any. This method should use your is\_compatible? method

  * The flow of your program should be the following now:
    * Ask the user for a username
      * If it's in your existing users, display their current preferences, and ask them if they want to change it or not
        * If they want to change it, ask them the preference questions, and save it to the JSON file.
      * Else if the username is not in your existing users., ask if they want to create a new account, re enter their username, or if neither just stop the program
        * If they want to create a new account take in their preferences and save it to the JSON file.
    * Display if there are any matches for that user. If there are no matches, tell them, and exit.



Phase 3: Making it Object Oriented (Not done)
New Concepts: Heroku, Sinatra, Git, ERB, Web Forms, Get, Post
Instead of terminal, we are now going to make a web form to take in all of the information.




=======
datingapp
=========

A sample dating application in ruby
