require('spec_helper')

describe(Stylist) do

   describe(".all") do
      it("starts off with no stylists") do
         expect(Stylist.all()).to(eq([]))
      end
   end

   describe("#name") do
      it("tells you the stylist name") do
         stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         expect(stylist.name()).to(eq("Barbie Barber"))
      end
   end

   describe("#phone") do
      it("tells you the stylists phone") do
         stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         expect(stylist.phone()).to(eq("5031234567"))
      end
   end

  describe("#specialty") do
      it("tells you the stylists specialty") do
         stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         expect(stylist.specialty()).to(eq("Short cuts"))
      end
   end

   describe("#save") do
      it("lets you save stylists to the database") do
         stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist.save()
         expect(Stylist.all()).to(eq([stylist]))
      end
   end

   describe("#==") do
      it("is the same stylist if it has the same name and phone") do
         stylist1 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist2 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         expect(stylist1).to(eq(stylist2))
      end
   end

   describe(".find") do
      it("returns a stylist by its ID") do
         stylist1 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist1.save()
         stylist2 = Stylist.new({:id => nil, :name => "Harry Cutter", :phone => "5039876543", :specialty => "Weaves"})
         stylist2.save()
         expect(Stylist.find(stylist1.id())).to(eq(stylist1))
      end
   end

   describe('#update_name') do
      it('allows a user to udpate the stylist name') do
         stylist1 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist1.save()
         stylist1.update_name({:name => "Sandy Locks"})
         expect(stylist1.name()).to(eq("Sandy Locks"))
      end
   end

   describe('#update_phone') do
      it('allows a user to udpate the stylist phone') do
         stylist1 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist1.save()
         stylist1.update_phone({:phone => "5411234567"})
         expect(stylist1.phone()).to(eq("5411234567"))
      end
   end

   describe('#update_specialty') do
      it('allows a user to udpate the stylist specialty') do
         stylist1 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist1.save()
         stylist1.update_specialty({:specialty => "Long cuts"})
         expect(stylist1.specialty()).to(eq("Long cuts"))
      end
   end

   describe("#clients") do
      it("returns an array of clients for a stylist") do
         stylist1 = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
         stylist1.save()
         client1 = Client.new({:id => nil, :name => "Nancy Nair", :phone => "8089998888", :stylist_id => stylist1.id()})
         client1.save()
         client2 = Client.new({:id => nil, :name => "Marty Mullet", :phone => "9714445555", :stylist_id => stylist1.id()})
         client2.save()
         expect(stylist1.clients()).to(eq([client1, client2]))
      end
   end
end
