class Client
   attr_reader(:id, :name, :phone, :stylist_id)

   define_method(:initialize) do |attributes|
      @id = attributes.fetch(:id)
      @name = attributes.fetch(:name)
      @phone = attributes.fetch(:phone)
      @stylist_id = attributes.fetch(:stylist_id)
   end
end
