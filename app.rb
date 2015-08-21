require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

get('/stylists') do
   @stylists = Stylist.all()
   erb(:stylists)
end

get('/clients') do
   @clients = Client.all()
   erb(:clients)
end

get('/stylists/new') do
   erb(:stylist_new)
end

post('/stylists/new') do
   name = params.fetch("name")
   phone = params.fetch("phone")
   specialty = params.fetch("specialty")
   @stylist = Stylist.new(:id => nil, :name => name, :phone => phone, :specialty => specialty)
   @stylist.save()
   redirect("/stylists/#{@stylist.id()}")
end

get('/stylists/:id') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   @clients = Client.all()
   erb(:stylist)
end

post('/stylist/:id') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   @clients = Client.all()
   redirect("/stylists/#{@stylist.id()}")
end

post('/stylists/:id/new_client') do
   name = params.fetch("name")
   phone = params.fetch("phone")
   stylist_id = params.fetch("stylist_id")
   client = Client.new(:id => nil, :name => name, :phone => phone, :stylist_id => stylist_id)
   client.save()
   @stylist = Stylist.find(params.fetch("stylist_id").to_i())
   redirect("/stylists/#{@stylist.id()}")
end

get('/stylists/:id/new_client') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   erb(:client_new_form)
end

get('/stylists/:id/update') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   erb(:stylist_update)
end

patch('/stylists/:id/update_name') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   name = params.fetch("name")
   @stylist.update_name(:name => name)
   redirect("/stylists/#{@stylist.id()}")
end

patch('/stylists/:id/update_specialty') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   specialty = params.fetch("specialty")
   @stylist.update_specialty(:specialty => specialty)
   redirect("/stylists/#{@stylist.id()}")
end

patch('/stylists/:id/update_phone') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   phone = params.fetch("phone")
   @stylist.update_phone(:phone => phone)
   redirect("/stylists/#{@stylist.id()}")
end

delete('/stylists/:id/delete') do
   @stylist = Stylist.find(params.fetch("id").to_i())
   @stylist.delete()
   redirect("/stylists")
end

get('/clients/new') do
   @stylists = Stylist.all()
   erb(:clients_new)
end

get('/clients/:id') do
   @client = Client.find(params.fetch("id").to_i())
   erb(:client)
end

get('/clients/:id/update') do
   @client = Client.find(params.fetch("id").to_i())
   erb(:client_update)
end

patch('/clients/:id/update_name') do
   @client = Client.find(params.fetch("id").to_i())
   name = params.fetch("name")
   @client.update_name(:name => name)
   redirect("/clients/#{@client.id()}")
end

patch('/clients/:id/update_phone') do
   @client = Client.find(params.fetch("id").to_i())
   phone = params.fetch("phone")
   @client.update_phone(:phone => phone)
   redirect("/clients/#{@client.id()}")
end

delete('/clients/:id/delete') do
   @client = Client.find(params.fetch("id").to_i())
   @client.delete()
   redirect("/clients")
end
