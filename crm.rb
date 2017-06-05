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
  erb :contacts
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


get '/add_contact' do
    erb :add_contact
end

get '/add_contact' do
    @contacts = Contact.create(params[:contact])
end

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/delete' do
  @contact = Contact.find_by(params[:id].to_i)
  erb :delete
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end



get '/about' do
  erb :about
end







after do
  ActiveRecord::Base.connection.close
end
