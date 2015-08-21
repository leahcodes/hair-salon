class Stylist
   attr_reader(:id, :name, :phone, :specialty)

   define_method(:initialize) do |attributes|
      @id = attributes.fetch(:id)
      @name = attributes.fetch(:name)
      @phone = attributes.fetch(:phone)
      @specialty = attributes.fetch(:specialty)
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
end
