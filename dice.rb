require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')



get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six, { :layout => :wrapper })
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  @outcome_dice_2_10 = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten, { :layout => :wrapper })
end

get("/dice/1/20") do
  die = rand(1..20)
  @outcome_dice_1_20 = "You rolled a #{die}."

  erb(:one_twenty, { :layout => :wrapper })
end


get("/dice/5/4") do
first_die = rand(1..4)
second_die = rand(1..4)
third_die = rand(1..4)
fourth_die = rand(1..4)
fifth_die = rand(1..4)
sum_dice_5_4 = first_die + second_die + third_die + fourth_die + fifth_die

@outcome_dice_5_4 = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die} and a #{fifth_die} for a total of #{sum_dice_5_4}."

erb(:five_four, { :layout => :wrapper })

end

get("/") do
  erb(:elephant, { :layout => :wrapper })
end
