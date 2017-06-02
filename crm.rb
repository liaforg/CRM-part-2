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

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
  erb :show_contact
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
