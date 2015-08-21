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

end

get('/stylists/delete') do
   erb(:stylist_delete)
end
