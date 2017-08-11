Feature: Public audience viewing poems in a gallery

  As a poetry lover
  I want to view students' poems 

Background: 
  Given the following poems exist: 
  | teacher_name     | county | email   | student_name | grade | student_teacher_name | poem |school  | title         | status   |
  | a                | a      | a@a.com | a            | K     | a                    | a    | a      | PendingPoem1  | Pending  |
  | Ronald Alexander | a      | a@a.com | a            | K     | a                    | po   | b      | ApprovedPoem1 | Approved |
  | a                | a      | a@a.com | a            | K     | a                    | a    | a      | RejectedPoem1 | Rejected |
  | a                | a      | a@a.com | a            | K     | a                    | a    | a      | PendingPoem2  | Pending  |
  | Michelle Bitting | a      | a@a.com | a            | K     | a                    | ta   | a      | ApprovedPoem2 | Approved |
  | a                | a      | a@a.com | a            | K     | a                    | a    | a      | RejectedPoem2 | Rejected |
  | a                | a      | a@a.com | a            | K     | a                    | a    | a      | PendingPoem3  | Pending  |
  | a                | a      | a@a.com | a            | K     | a                    | to   | a      | ApprovedPoem3 | Approved |
  | a                | a      | a@a.com | a            | K     | a                    | a    | a      | RejectedPoem3 | Rejected |
  Given I am on the home page

Scenario: I am viewing all poems on the gallery
  Then I should see "Fresh poems from our students across California"
  Then I should see "Back to California Poets"
  # Then I should see "Donate"
  Then I should see "ApprovedPoem1"
  And I should see "ApprovedPoem2"
  And I should see "ApprovedPoem3"
  And I should not see "RejectedPoem1"
  And I should not see "RejectedPoem2"
  And I should not see "RejectedPoem3"
  And I should not see "PendingPoem1"
  And I should not see "PendingPoem2"
  And I should not see "PendingPoem3"

Scenario: I am viewing Poem 1 in detail
  Then I click the box "ApprovedPoem1"
  Then I should see "po"

Scenario: I am viewing Poem 2 in detail
  Then I click the box "ApprovedPoem2"
  Then I should see "ta"

Scenario: I am viewing Poem 3 in detail
  Then I click the box "ApprovedPoem3"
  Then I should see "to"

