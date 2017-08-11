Feature: Add a navigation bar to the website

	As a user
	I want to access the website easily through navigation bar

Scenario: Redirecting to home page works
Given I am on the home page
When I click the Home link
Then I should be on the home page

Scenario: Redirecting to login page works
Given I am on the home page
When I click the Log In link
Then I should be on Log in

Scenario: Redirecting to home page works
Given I am on gallery
When I click the Home link
Then I should be on the home page