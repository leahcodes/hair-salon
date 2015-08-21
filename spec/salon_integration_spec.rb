require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the stylists path", {:type => :feature}) do
   it('will allow the user to create a stylist') do
      visit('/')
      click_link('Stylists')
      click_link('Add a Stylist')
      fill_in('name', :with => 'Bobby Pin')
      fill_in('phone', :with => '5034446666')
      fill_in('specialty', :with => 'Formal')
      click_button('Add')
      expect(page).to have_content('Bobby Pin')
   end
end

describe("the details for a stylist", {:type => :feature}) do
   it('will allow the user to add clients to a stylist') do
      stylist = Stylist.new({:id => nil, :name => "Barbie Barber", :phone => "5031234567", :specialty => "Short cuts"})
      stylist.save()
      visit('/stylists')
      click_link('Barbie Barber')
      fill_in('name', :with => 'John Mullet')
      fill_in('phone', :with => '5554443333')
      click_button('Add Client')
      expect(page).to have_content('John Mullet')
   end
end
