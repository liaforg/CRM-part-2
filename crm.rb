require_relative 'contact'
require 'sinatra'



get '/' do
  redirect to('/contacts')
end


get '/home' do
    erb :contacts
end


get '/contacts' do
  @contacts = Contact.count
  @contacts = Contact.all
  puts params
  erb :contacts
end

get '/contacts/add_contact' do
  erb :add_contact
end

get '/contacts/add_contact' do
    @contact = Contact.create(params[:contact])
    erb :add_contact
end


get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
end


get '/contacts/about' do
  erb :about
end








after do
  ActiveRecord::Base.connection.close
end
