require 'json'

class User

  attr_reader :username, :email, :gender, :looking_for, :color
  attr_writer :username, :email, :gender, :looking_for, :color

  def initialize(params)
    params.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def update(params)
    params.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
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

puts file_data.class

users = file_data["users"]

# all_users is an array of user objects
all_users = initialize_all_users(users)

puts "What is your username?"
username = gets.chomp

# Find this user within the array of hashes
has_user = false
current_user = {}
all_users.each do |u|
  if (username = u.username)
    has_user = true
    current_user = u
  end
end

puts current_user

# If you find the user, print out their info and ask if they want to change their info.
if (has_user)
  puts "Here are your current settings and preferences: "
  puts current_user
  puts "Do you want to change your info? (y or n)"
  input = gets.chomp.downcase

  # If they inputs y, ask them... about every attribute again.
  if(input == "y")
    puts "What is your email?"
    email = gets.chomp
    puts "What is your gender?"
    gender = gets.chomp
    puts "What gender are you looking for? Choose from: male, female, or both"
    looking_for = gets.chomp
    puts "What is your favorite color?"
    color = gets.chomp

    # Update their hash, and save it to the file.
    current_user
  end

  # Might be a good time to run a little test to see if you saved the file right

  # Display any matches using find_compatible
  matches = current_user.find_compatible


end

