Feature: User Login

  In order to get new offers
  As a user
  I want to check the offer query page

@javascript
Scenario: Should not allow an invalid query
  Given A valid used is logged in
  And I click "Submit" button
  Then I should see a message "Page Size and atleast one User Param is required."

@javascript
Scenario: Should give valid offers if all is fine
  Given A valid used is logged in
  And I provide user param "campaign1"
  And I click "Submit" button
  Then I should see a message "Success"