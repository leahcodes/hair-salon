class Stylist
   attr_reader(:id, :name, :phone, :specialty)

   define_method(:initialize) do |attributes|
      @id = attributes.fetch(:id)
      @name = attributes.fetch(:name)
      @phone = attributes.fetch(:phone)
      @specialty = attributes.fetch(:specialty)
   end

   define_method(:==) do |another_stylist|
      self.name().==(another_stylist.name()).&(self.phone().==(another_stylist.phone())).&(self.id().==(another_stylist.id()))
   end

   define_singleton_method(:all) do
      returned_stylists = DB.exec("SELECT * FROM stylists;")
      stylists = []
      returned_stylists.each() do |stylist|
      id = stylist.fetch("id").to_i()
      name = stylist.fetch("name")
      phone = stylist.fetch("phone")
      specialty = stylist.fetch("specialty")
      stylists.push(Stylist.new({:id => id, :name => name, :phone => phone, :specialty => specialty}))
    end
    stylists
  end

   define_method(:save) do
      result = DB.exec("INSERT INTO stylists (name, phone, specialty) VALUES ('#{@name}', '#{@phone}', '#{@specialty}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
   end

   define_singleton_method(:find) do |id|
      found_stylist = nil
      Stylist.all().each() do |stylist|
         if stylist.id().==(id)
            found_stylist = stylist
         end
      end
      found_stylist
   end

   define_method(:update_name) do |attributes|
     @name = attributes.fetch(:name)
     @id = self.id()
     DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
   end

   define_method(:update_phone) do |attributes|
     @phone = attributes.fetch(:phone)
     @id = self.id()
     DB.exec("UPDATE stylists SET phone = '#{@phone}' WHERE id = #{@id};")
   end

   define_method(:update_specialty) do |attributes|
     @specialty = attributes.fetch(:specialty)
     @id = self.id()
     DB.exec("UPDATE stylists SET specialty = '#{@specialty}' WHERE id = #{@id};")
   end

   define_method(:clients) do
      stylist_clients = []
      clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
      clients.each() do |client|
      id = client.fetch("id").to_i()
      name = client.fetch("name")
      phone = client.fetch("phone")
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({:id => id, :name => name, :phone => phone, :stylist_id => stylist_id}))
   end
   stylist_clients
   end

   define_method(:delete) do
      DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
      DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
   end
end
