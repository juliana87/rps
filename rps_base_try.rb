require 'sinatra'
require 'rspec'
require 'rack/test'
require 'pry'
require './rps_game'


get '/' do
  @title = "rock, paper, scissors"
  if params[:guess]
    erb "Scissors"
  else
    erb :home
  end
end

get '/rock' do
  def value
    @value = ["rock", "paper", "scissors"].sample
   "You played: rock"
    if @value == "scissors"
      erb "Scissors. You win." 
    if @value == "paper"
      erb "Paper. Computer wins."
    else 
      erb "Rock. Noone wins."
    end
  end   
end

get '/paper' do
  def value
    @value = ["rock", "paper", "scissors"].sample
    "You played: paper"
    if @value == "scissors"
      erb "Scissors. Computer wins."
    if @value == "rock"
      erb "Rock. You win."
    else
      erb "Paper. Noone wins."
    end
  end
end

get '/scissors' do
  def value
    @value = ["rock", "paper", "scissors"].sample
    "You played: scissors"
    if @value == "scissors"
      erb "Scissors. Noone wins."
    if @value == "paper"
      erb "Paper. You win."
    else
      erb "Rock. Computer wins."
    end
  end
end

set :environment, :test

describe 'Rock Paper Scissors App' do
  include Rack::Test::Methods

  def app
  Sinatra::Application
  end

  it "says welcome to rock, paper, scissors" do
    get '/'
    last_response.should be_ok
    last_response.body.should include "welcome to rock, paper, scissors"
  end

  it "when I say Rock it should respond with scissors" do
    get '/rock', guess: "Rock"
    last_response.body.should include "Scissors. You win."
  end

  it "when I say Paper it should respond with scissors" do
    get '/paper', guess: "Paper"
    last_response.body.should include "Scissors. Computer wins."
  end

  it "when I say Scissors it should respond with scissors" do
    get '/scissors', guess: "Scissors"
    last_response.body.should include "Scissors. Noone wins."
  end
end
end
end
end

__END__

@@form

@@home
<h1>welcome to <%= @title %></h1>

@@layout
<!doctype html>
<html lang="en">
<head>
  <title><%= @title %></title>
  <meta charset="utf-8">
</head>
<body>
  <header>
    <h1 style = "color:blue">Welcome to Rock, Paper, Scissors</h1>
    <p style = "color:red">Choose one object to play and have!<p>
    <nav>
      <ul>
        <li><a href="/" title="Home">Home</a></li>
        <li><a href="/rock" title="Rock">Rock</a></li>
        <li><a href="/paper" title="Paper">Paper</a></li>
        <li><a href="/scissors" title="Scissors">Scissors</a></li>
      </ul>
    </nav>
    <img src="http://www.ankeshkothari.com/wp-content/uploads/rock-paper-scissors.gif">
  </header>
</body>
</html>
