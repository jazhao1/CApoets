Feature: Writers tag subject matter

    As a writer
    So that I can categorize my poems to (help) view related poems
    I wanted to add a tagging feature
  
Scenario: I wrote a new poem and I want to tag a poem called "poem1"
  Given I am a user on the new poem page who wants to tag a poem called "poem1"
  Then I can see a button on the poem page labeled "All Tags"
  Then I can see a button on the poem page labeled "Pending Approval"
  Then I can create a new tag called "something"

