require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^I am an admin on the "([^"]*)" page$/) do |page_name|
  visit path_to(page_name)
end

Given /^a valid user$/ do
  @user = User.create!({
             :email => "Test@Test.com",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

Given /^a logged in user$/ do
  visit new_user_session_path
  fill_in "Email", :with => "Test@Test.com"
  fill_in "Password", :with => "12345678"
  click_button "Log in"
end

Given /^I want to edit my registration$/ do
  visit edit_user_registration_path
end

Given(/^there's a poem titled "([^"]*)" with "([^"]*)" status$/) do |title, status|
  @poem = FactoryGirl.create(:poem, title: title, status: status)
end

Given(/^there's a poem titled "([^"]*)" with "([^"]*)" status and with poet teacher "([^"]*)"$/) do |title, status, poet_teacher|
  @poem = FactoryGirl.create(:poem, title: title, status: status, :teacher_name => poet_teacher)
end

When(/^I click "([^"]*)"$/) do |link_name|
  click_link link_name
end

And(/^I click the poem "([^"]*)" on "([^"]*)"$/) do |title, tab_name|
    case tab_name
    when /^Pending Approval$/
      tab_name = "#tab-1"
    when /^All Poems$/
      tab_name = "#tab-2"
    when /^Approved Poems$/
      tab_name = "#tab-3"
    when /^Rejected Poems$/
      tab_name = "#tab-4"
    within tab_name do
      click_link(title)
    end
end 

end
# Given /the following poems exist/ do |poem_table|
#   poem_table.hashes.each do |poem|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that movie to the database here.
#     p = Poem.create(poem)
#     p.save!
#   end
# end
