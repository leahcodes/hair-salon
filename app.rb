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

delete('/stylist/:id/delete') do
   redirect("/stylists")
end
