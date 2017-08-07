class AddDeviseToUsers < ActiveRecord::Migration
  
  User.create! do |u|
    u.email = 'test@test.com'
    u.password = '123456'
  end

end
