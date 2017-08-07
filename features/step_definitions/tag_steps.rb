Then /I can create a new tag called "(.*)"/ do |label|
    visit new_tag_path
    fill_in "tag_entry", :with => "wolverines"
    click_button "tag-button"
end

Given /I am a user on the new poem page who wants to tag a poem called "(.*)"/ do |text|
    #login
    # visit new_user_session_path
    # fill_in "Email", :with => "Test@Test.com"
    # fill_in "Password", :with => "12345678"
    # click_button "Log in"
    
    email = 'testing@man.net'
    password = 'secretpass'
    User.new(:email => email, :password => password, :password_confirmation => password).save!
    
    visit '/users/sign_in'
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
    click_button "Log in"
    
    #visit new_tag_path
    sign_in(:user, User.all.first)
    visit view_tags_path
    # @tag = FactoryGirl.create(:Tag, category: "temp", status: "pending", number_of_hits: "1")
end

