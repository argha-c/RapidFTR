Feature: Manage Users

#Story: Changing user disabled status from user list page

  Background:
    Given a user "jerry"
    Given I am logged in as an admin

    And I follow "USERS"

  @javascript
  @wip
  Scenario: Admins should be able to change user disabled status from index page
    Given a user "homersimpson"
      And user "homersimpson" is disabled
      And I am logged in as an admin
      And I follow "USERS"

     When I uncheck the disabled checkbox for user "homersimpson"
     Then user "homersimpson" should not be disabled

  Scenario: Admins should be able view himself
     Then I should see "Show"
    Then I should see "Edit"
     Then I should not see "Delete User" within "#user-row-admin"
     Then I should see "Back"
     Then I should see "Create User"

  Scenario: On the show User page, the breadcrumb consists of List User link and User Name
    When I follow "Show" within "#user-row-jerry"
    Then I should see "jerry (Edit)"
    And I am on manage users page

  Scenario: On the edit User page, the breadcrumb consists of Edit User link and User Name
    When I follow "Edit" within "#user-row-jerry"
    Then I should see "Users > jerry"
    Then I follow "Users"
   And I am on manage users page

  Scenario: On the create User page, the breadcrumb consists of List Users page
    Then I follow "Create User"
    Then I follow "Users"
    And I am on manage users page

  Scenario: User clicks Cancel button and is then on the listing page
     When I follow "Edit" within "#user-row-jerry"
     Then I follow "Cancel"
     And I am on manage users page

   Scenario: User clicks Save button on Edit User page and is then on User listing page
     When I follow "Edit" within "#user-row-jerry"
     Then I fill in "9876543210" for "Phone"
     And I press "Update"
     Then I should see "9876543210"







