Feature: Submission form for poet-teachers

  As a poet teacher
  I want to be able to submit my student's poems
  
Scenario: I am a user on the webpage who wants to submit my poem 
Given I am a user on the "new poem" page who wants to "submit a poem"
Then I should see input boxes labeled with the following: "Poet Teacher Name, Email, Student Name, Grade, Poem Title, School, County, Attach Poem/Images, Release Form"
Then I should see input boxes labeled with the following: "Poem"

Scenario: I am a user and I click submit without filling the form
Given I am a user on the "new poem" page who wants to "submit a poem"
And I press "Submit the poem"
Then it should flash "Please fill in Missing Fields."

Scenario: I can fill in the inputs
Given I am a user on the "new poem" page who wants to "submit a poem"
And I can fill in input box "Poet Teacher Name" with "Alexander Camelton"
And I can fill in input box "Email" with "Email@email.com"
And I can fill in input box "Student Name" with "Student Name"
And I can fill in input box "Title" with "Sample title"
Then the "Poet Teacher Name" field should contain "Alexander Camelton"
Then the "Email" field should contain "Email@email.com"
Then the "Student Name" field should contain "Student Name"
Then the "Title" field should contain "Sample title"

Scenario: I can't submit a form with missing fields 
Given I am a user on the "new poem" page who wants to "submit a poem"
And I fill in "Poet Teacher Name" with "Alexander Camelton"
And I fill in "Email" with "Email@email.com"
And I fill in "Student Name" with "Student Name"
And I fill in "Poem Title" with "Sample title"
And I fill in "Poem" with "Sample Poem"
When I press "Submit the poem"
Then I should see "Please fill in Missing Fields."

Scenario: I can submit a form and submit another form
Given I am a user on the "new poem" page who wants to "submit a poem"
And I fill in "Poet Teacher Name" with "Alexander Camelton"
And I fill in "Email" with "Email@email.com"
And I fill in "Student Name" with "Student Name"
And I select "Grade" with "K"
And I fill in "Teacher Name" with "Sample Teacher Name"
And I fill in "School" with "Sample School"
And I select "County" with "Butte"
And I fill in "Poem Title" with "Sample title"
And I fill in "Poem" with "Sample Poem"
And I attach "poem_button" with "features/t.txt"
And I attach "release_button" with "features/t.txt"
When I press "Submit the poem"
Then I should see "Poem was successfully submitted."
And  "tina@cpits.org" should receive an email
When I press "Submit another poem"
Then I should be on new poem

Scenario: Tina receives an email with correct contents
When "tina@cpits.org" opens the email
Then they should see the email delivered from "CApoets Submission <noreply@cpits.org>"
And they should see "A New Poem Has Been Submitted" in the email subject
