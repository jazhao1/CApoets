Feature: Administrators approving/disapproving poems

   As an administrator
   I want to review submitted poems for approval

Background: 
  Given there's a poem titled "Poem 1" with "Pending" status and with poet teacher "Ronald Alexander"
  Given a valid user
  Given a logged in user
  Given I am on the admin home page

Scenario: I am viewing Poem 1
Then I should see "Poem 1"
Then I should see a "Approve" button
Then I should see a "Reject" button
And I click the poem "Poem 1" on "Pending Approval"

Scenario: I am approving Poem 1
Then I press "Approve"
Then I should see a "Reject" button

Scenario: I am rejecting Poem 1
Then I press "Reject"
Then I should see a "Approve" button

Scenario: I am viewing Poem 1's Poet_teacher's profile page
  Then I should see link to profile: "Ronald Alexander"
  When I click "Ronald Alexander"
  Then I should see "Ron Alexander’s writing has won awards at the SB Writing Conference and other venues and a short film of his poem Zebra is in release to LGBTQ film festivals."