require_relative 'contact'
require 'sinatra'



get '/' do
  redirect to('/contacts')
end


get '/home' do
    erb :index
end


get '/contacts' do
  @contacts = Contact.count
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end

get '/add_contact' do
  erb :add_contact
end

after do
  ActiveRecord::Base.connection.close
end
