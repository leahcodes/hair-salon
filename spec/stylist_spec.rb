require('spec_helper')

describe(Stylist) do

   describe(".all") do
      it("starts off with no stylists") do
         expect(Stylist.all()).to(eq([]))
      end
   end

   describe("#name") do
     it("tells you the stylist name") do
       stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => 5031234567, :specialty => "Short cuts"})
       expect(stylist.name()).to(eq("Barbie Barber"))
     end
   end

   describe("#phone") do
     it("tells you the stylists phone") do
       stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => 5031234567, :specialty => "Short cuts"})
       expect(stylist.phone()).to(eq(5031234567))
     end
  end

  describe("#specialty") do
    it("tells you the stylists specialty") do
      stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => 5031234567, :specialty => "Short cuts"})
      expect(stylist.specialty()).to(eq("Short cuts"))
      end
   end
end
