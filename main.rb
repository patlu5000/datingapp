require 'json'

class User

  attr_reader :username, :email, :gender, :looking_for, :color
  attr_writer :username, :email, :gender, :looking_for, :color

  def initialize(params)
    params.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    file_data = JSON.parse(IO.read ("sample.json"))

    user_found = false;
    file_data["users"].each do |u|
      if (@username == u["username"])
        user_found = true;
      end
    end

    if !user_found
      file_data["users"] << params
      File.open("sample.json","w") do |f|
        f.write(file_data.to_json)
      end
    end

  end

  def inspect
    instance_variables.each do |k,v|
      puts "#{k}: #{instance_variable_get(k)}"
    end
  end


  # Updates existing user in JSON file
  def update(params)
    params.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

    instance_variables.each do |k,v|
      puts instance_variable_get(k)
    end
    # Saves the user to the json file
    file_data = JSON.parse(IO.read ("sample.json"))

    file_data["users"].each do |u|
      if (@username == u["username"])
        u.merge!(params)
        puts "after merge: #{u}"
      end
    end

    File.open("sample.json","w") do |f|
      f.write(file_data.to_json)
    end

  end

  def is_compatible?(user2)
    return (@gender == user2.lookingfor) && (@looking_for == user2.gender) && (@color == user2.color)
  end

  # Returns an array of username matches,
  # if there are no matches, returns an empty array.
  def find_compatible(all_users)
    result = []
    all_users.each do |u|
      if is_compatible?(u)
        result << u
      end
    end
    return result
  end

end

def initialize_all_users(arr)
  result = []

  arr.each do |u|
    result << User.new(u)
  end

  return result
end

#Read in JSON file containing existing user data
file_data = JSON.parse(IO.read ("sample.json"))

#puts file_data.class

users = file_data["users"]

# all_users is an array of user objects
all_users = initialize_all_users(users)

puts "What is your username?"
username = gets.chomp

# Find this user within the array of hashes
has_user = false
current_user = {}
all_users.each do |u|
  if (username == u.username)
    puts "User found."
    has_user = true
    current_user = u
  end
end

# If you find the user, print out their info and ask if they want to change their info.
if (has_user)
  puts "Here are your current settings and preferences: "
  current_user.inspect

  puts "Do you want to change your info? (y or n)"
  input = gets.chomp.downcase

  # If they inputs y, ask them... about every attribute again.
  update_hash = {}
  if(input == "y")
    puts "What is your email?"
    email = gets.chomp
    update_hash["email"] = email
    puts "What is your gender?"
    gender = gets.chomp
    update_hash["gender"] = gender
    puts "What gender are you looking for? Choose from: male, female, or both"
    looking_for = gets.chomp
    update_hash["looking_for"] = looking_for
    puts "What is your favorite color?"
    color = gets.chomp
    update_hash["color"] = color

    # Update their hash, and save it to the file.
    current_user.update(update_hash)
  end

# If you don't have the user... ask the user to set up their preferences
else
  new_user_hash = {}
  new_user_hash["username"] = username
  puts "What is your email?"
  email = gets.chomp-----------
  new_user_hash["email"] = email
  puts "What is your gender?"
  gender = gets.chomp
  new_user_hash["gender"] = gender
  puts "What gender are you looking for? Choose from: male, female, or both"
  looking_for = gets.chomp
  new_user_hash["looking_for"] = looking_for
  puts "What is your favorite color?"
  color = gets.chomp
  new_user_hash["color"] = color

  new_user = User.new(new_user_hash)

end

  # Might be a good time to run a little test to see if you saved the file correctly

  # Display any matches using find_compatible
  # matches = current_user.find_compatible


