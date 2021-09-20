@NEXTBASE-322
Feature: As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track
  the tasks or events on "Calendar" page.

  @NEXTBASE-316
  Scenario: Verify that HR user should be able to edit Repeat section as "Daily".
    Given  User logins with "HR" credentials
    And user clicks "Calendar" menu
    When user clicks event and selects edit
    Then user should be able to change repeat section as "Daily"

  @NEXTBASE-324
  Scenario: Verify that user should not be able to add event with past event date
    Given  User logins with "HR" credentials
    And user clicks "Calendar" menu
    When user clicks add
    And user enters the below event details
      | Event name              | NextBase-290                                               |
      | Description             | MY_FIRST_DESCRIPTION_OF_BIRTHDAY                           |
      | This event is important | true                                                       |
      | Event date              | 08/25/2021                                                 |
      | Event end date          | 08/30/2021                                                 |
      | Time zone               | (UTC +02:00) Europe/Stockholm                              |
      | Location                | Central Meeting Room                                       |
      | Attendees               | marketing1@cybertekschool.com/helpdesk1@cybertekschool.com |
      | Event color             | Pink                                                       |
      | Availability            | Occupied                                                   |

    Then user should not be able to add event when click the SAVE button