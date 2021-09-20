
Feature: As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track
	the tasks or events on "Calendar" page.

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	#
	#*1. HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".*
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".

	Scenario: Verify that HR User should be able to add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied"
		Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks add
		    And user enters the below event details
		      | Event name              | NextBase-290                                               |
		      | Description             | MY_FIRST_DESCRIPTION_OF_BIRTHDAY                           |
		      | This event is important | true                                                       |
		      | Event date              | 09/25/2021                                                 |
		      | Event end date          | 09/30/2021                                                 |
		      | Time zone               | (UTC +02:00) Europe/Stockholm                              |
		      | Location                | Central Meeting Room                                       |
		      | Attendees               | marketing1@cybertekschool.com/helpdesk1@cybertekschool.com |
		      | Event color             | Pink                                                       |
		      | Availability            | Occupied                                                   |
		
		    Then user should be able to add event by clicking SAVE button and display event on calendar	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# *2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".*
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-311
	Scenario: Verify that HR User should be able to edit the 1st AC's task color as "Navy" by using "other color".
		Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks event and selects edit
		    Then user should be able to change event color as "Navy"

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# *3. HR User can edit the 1st AC's privacy as "Private event".*
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-312
	Scenario: Verify that HR user should be able to edit the 1st AC's privacy as "Private event".
		Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks event and selects edit
		    Then user should be able to change privacy as "Private Event"	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# *4. Marketing user can not display the 3rd AC's private event on his/her calendar.*
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-313
	Scenario: Verify that Marketing user should not be able to display the 3rd AC's private event on his/her calendar.
		Given User logins with "Marketing" credentials
		    And user clicks "Calendar" menu
		    When user clicks Schedule
		    Then user should not be able to display HR user's event on his-her calendar	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# *5. HR User can edit his/her availability from "Occupied" to "Unsure".*
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-314
	Scenario: Verify that HR user should be able to edit his/her availability from "Occupied" to "Unsure".
		Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks event and selects edit
		    Then user should be able to change his-her availability as "Unsure"	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# *6. HR User can edit his/her event's name.*
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-315
	Scenario: Verify that HR user should be able to edit his/her event's name.
		Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks event and selects edit
		    Then user should be able to change his-her event's name as "MY_TEST_EVENT"	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# *8. HR User can delete attendee by editing the event.*
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-317
	Scenario: Verify that HR user should be able to delete attendee by editing the event.
		    Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks event and selects edit
		    Then user should be able to delete an attendee	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# *9. HR User can add one more attendee by editing the event.*
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-318
	Scenario: Verify that HR user should be able to add one more attendee by editing the event.
		 Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks event and selects edit
		    Then user should be able to add one more attendee("marketing1@cybertekschool.com") by editing the event	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# *10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.*
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-319
	Scenario: Verify that Marketing User should be able to display the invitations by using "Filter and search" box after clicking "Invitations" button.
		Given  User logins with "Marketing" credentials
		    And user clicks "Calendar" menu
		    When user clicks Filter and search and clicks Invitations
		    Then user should be able to display "Invitations"	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# *11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.*
	# 12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
	@NEXTBASE-320
	Scenario: Verify that HR User should be able to filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
		Given  User logins with "HR" credentials
		    And user clicks "Calendar" menu
		    When user clicks Filter and search and clicks I'M AN ORGANIZER
		    Then user should be able to display "I'm an organiser"	

	#*User Story:*
	#
	#As a user, I should be able to navigate "Calendar" page so that user can filter and search, display, add and track the tasks or events on "Calendar" page.
	#
	#*Acceptance Criteria:*
	# # HR User can add new important event with description by specifying the start-end dates in the specific time zones, adding certain location, adding attendees, color as "Pink" and availability as "Occupied".
	# 2. HR User can edit the 1st AC's task color as "Navy Blue" by using "other color".
	# 3. HR User can edit the 1st AC's privacy as "Private event".
	# 4. Marketing user can not display the 3rd AC's private event on his/her calendar.
	# 5. HR User can edit his/her availability from "Occupied" to "Unsure".
	# 6. HR User can edit his/her event's name.
	# 7. HR User can edit Repeat section as "Daily".
	# 8. HR User can delete attendee by editing the event.
	# 9. HR User can add one more attendee by editing the event.
	# 10. Marketing User can display the invitations by using "Filter and search" box after clicking "Invitations" button.
	# 11. HR User can filter events and/or tasks by using "Filter and search" box after clicking "I'M AN ORGANISER" button.
	# *12. Helpdesk User can reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".*
	@NEXTBASE-321
	Scenario: Verify that Helpdesk User should be able to reset after selecting "Yes" under "Event with participants" menu and "Invited" under "Participant status".
		Given  User logins with "Helpdesk" credentials
		    And user clicks "Calendar" menu
		    When user clicks Filter and search
		    And user selects Yes under Event with participants, Invited under Participation status and click reset
		    Then user should be able to reset user input fields to "Not specified"