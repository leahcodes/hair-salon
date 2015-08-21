class Client
   attr_reader(:id, :name, :phone, :stylist_id)

   define_method(:initialize) do |attributes|
      @id = attributes.fetch(:id)
      @name = attributes.fetch(:name)
      @phone = attributes.fetch(:phone)
      @stylist_id = attributes.fetch(:stylist_id)
   end

   define_method(:==) do |another_client|
      self.name().==(another_client.name()).&(self.phone().==(another_client.phone())).&(self.id().==(another_client.id()))
   end

   define_singleton_method(:all) do
      returned_clients = DB.exec("SELECT * FROM clients;")
      clients = []
      returned_clients.each() do |client|
      id = client.fetch("id").to_i()
      name = client.fetch("name")
      phone = client.fetch("phone")
      stylist_id = client.fetch("stylist_id")
      clients.push(Client.new({:id => id, :name => name, :phone => phone, :stylist_id => stylist_id}))
   end
   clients
   end

   define_method(:save) do
      result = DB.exec("INSERT INTO clients (name, phone, stylist_id) VALUES ('#{@name}', '#{@phone}', '#{@stylist_id}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
   end

   define_singleton_method(:find) do |id|
      found_client = nil
      Client.all().each() do |client|
         if client.id().==(id)
            found_client = client
         end
      end
      found_client
   end

   define_method(:update_name) do |attributes|
     @name = attributes.fetch(:name)
     @id = self.id()
     DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
   end

   define_method(:update_phone) do |attributes|
     @phone = attributes.fetch(:phone)
     @id = self.id()
     DB.exec("UPDATE clients SET phone = '#{@phone}' WHERE id = #{@id};")
   end

   define_method(:delete) do
      DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
   end
end
