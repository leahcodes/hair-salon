require('spec_helper')

describe(Client) do

   describe(".all") do
      it("starts off with no clients") do
         expect(Client.all()).to(eq([]))
      end
   end

   describe("#name") do
      it("tells you the client name") do
         client = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         expect(client.name()).to(eq("Nancy Nair"))
      end
   end

   describe("#phone") do
      it("tells you the clients phone") do
         client = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         expect(client.phone()).to(eq("8089998888"))
      end
   end

  describe("#stylist_id") do
      it("tells you the stylist ID for the client") do
         client = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         expect(client.stylist_id()).to(eq(1))
      end
   end

   describe("#save") do
      it("lets you save clients to the database") do
         client = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         client.save()
         expect(Client.all()).to(eq([client]))
      end
   end

   describe("#==") do
      it("is the same client if it has the same name and phone") do
         client1 = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         client2 = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         expect(client1).to(eq(client2))
      end
   end

   describe(".find") do
      it("returns a client by its ID") do
         client1 = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         client1.save()
         client2 = Client.new({:id => nil, :name => "Marty Mullet", :phone => "9714445555", :stylist_id => 2})
         client2.save()
         expect(Client.find(client1.id())).to(eq(client1))
      end
   end

   describe('#update_name') do
      it('allows a user to udpate the client name') do
         client = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         client.save()
         client.update_name({:name => "Pixie Brown"})
         expect(client.name()).to(eq("Pixie Brown"))
      end
   end

   describe('#update_phone') do
      it('allows a user to udpate the client phone') do
         client = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => 1})
         client.save()
         client.update_phone({:phone => "5411234567"})
         expect(client.phone()).to(eq("5411234567"))
      end
   end

end
