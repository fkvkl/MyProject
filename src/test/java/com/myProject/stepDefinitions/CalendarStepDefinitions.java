package com.myProject.stepDefinitions;

import com.myProject.pages.CalendarPage;
import com.myProject.pages.HomePage;
import com.myProject.pages.LoginPage;
import com.myProject.utilities.BrowserUtils;
import com.myProject.utilities.ConfigurationReader;
import com.myProject.utilities.Driver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.Color;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CalendarStepDefinitions {
    String user = null;
    CalendarPage calendarPage = new CalendarPage();
    String event_name = "";
    String event_date = "";

    @Given("User logins with {string} credentials")
    public void user_logins_with_credentials(String userType) {
        user = userType.toLowerCase();
        new LoginPage().loginAs(userType);
    }

    @Given("user clicks {string} menu")
    public void user_clicks_menu(String menu) {
        new HomePage().navigateToMenu(menu);
        BrowserUtils.waitForPageToLoad(5);
    }

    @When("user clicks add and enters the below event details")
    public void user_clicks_add_and_enters_the_below_event_details(Map<String, String> data) {
        event_name = data.get("Event name");
        event_date = data.get("Event date");
        calendarPage.eventHandler(event_name, event_date);
        calendarPage.add.click();
        BrowserUtils.waitForPageToLoad(5);
        if (Boolean.parseBoolean(data.get("This event is important"))) {
            calendarPage.importance.click();
        }
        calendarPage.eventName.clear();
        calendarPage.eventName.sendKeys(event_name);
        calendarPage.dateFrom.clear();
        calendarPage.dateFrom.sendKeys(data.get("Event date"));
        calendarPage.dateTo.clear();
        calendarPage.dateTo.sendKeys(data.get("Event end date"));
        calendarPage.timeZone.click();
        Select select = new Select(calendarPage.timeZoneFrom);
        select.selectByVisibleText(data.get("Time zone"));
        calendarPage.location.click();
        calendarPage.location.sendKeys(data.get("Location"));
        calendarPage.addAttendees(data.get("Attendees"));
        BrowserUtils.waitForPageToLoad(10);
        calendarPage.more.click();
        calendarPage.eventDescription(data.get("Description"));
        BrowserUtils.waitForPageToLoad(10);
        calendarPage.selectColor(data.get("Event color"));
        Select selectAvailability = new Select(calendarPage.availability);
        selectAvailability.selectByVisibleText(data.get("Availability"));
    }

    @Then("user should be able to add event by clicking SAVE button and display event on calendar")
    public void user_should_be_able_to_add_event_by_clicking_SAVE_button_and_display_event_on_calendar() {
        calendarPage.save.click();
        Assert.assertTrue(calendarPage.checkEvents(event_name, event_date));
    }

    @When("user clicks event and selects edit")
    public void user_clicks_event_and_selects_edit() {
        // actions.doubleClick(calendarPage.eventDetails).perform();        // ****DOUBLE CLICK****
        calendarPage.schedule.click();
        calendarPage.findEvent(event_name, event_date).click();
        calendarPage.editEvent.click();
        BrowserUtils.waitForClickablility(calendarPage.more, 10);
    }

    @Then("user should be able to change event color as {string}")
    public void user_should_be_able_to_change_event_color_as(String color) {
        calendarPage.more.click();
        calendarPage.selectColor(color);
        calendarPage.save.click();
        Driver.get().navigate().refresh();
        String style = calendarPage.eventColor(event_name, event_date).getAttribute("style");
        System.out.println("style = " + style);
        Color a = Color.fromString(color);
        String expected = a.asRgb();
        System.out.println("expected = " + expected);
        Assert.assertTrue(style.contains(expected));
    }

    @Then("user should be able to change privacy as {string}")
    public void user_should_be_able_to_change_privacy_as(String privacy) {
        calendarPage.more.click();
        if (!calendarPage.privateEvent.isSelected()) {
            calendarPage.privateEvent.click();
        }
        calendarPage.save.click();
        Driver.get().navigate().refresh();
        calendarPage.schedule.click();
        calendarPage.findEvent(event_name, event_date).click();
        calendarPage.openEvent.click();
        String text = calendarPage.specialNotes.getText();

        Assert.assertEquals(privacy, text);
    }

    @When("user clicks Schedule")
    public void user_clicks_Schedule() {
        calendarPage.schedule.click();
    }

    @Then("user should be able to change his-her availability as {string}")
    public void user_should_be_able_to_change_his_her_availability_as(String availability) {
        calendarPage.more.click();
        BrowserUtils.waitForVisibility(calendarPage.privateEvent, 5);
        Select selectAvailability = new Select(calendarPage.availability);
        selectAvailability.selectByVisibleText(availability);
        calendarPage.save.click();
        Driver.get().navigate().refresh();
        calendarPage.schedule.click();
        calendarPage.findEvent(event_name, event_date).click();
        calendarPage.openEvent.click();
        String text = calendarPage.getAvailability.getText();
        String actual = text.equals("Free") ? "Available" : text.equals("Undecided") ? "Unsure" : text;
        Assert.assertEquals(availability, actual);
    }

    @Then("user should be able to change his-her event's name as {string}")
    public void user_should_be_able_to_change_his_her_event_s_name_as(String string) {
        event_name = string;
        calendarPage.eventName.clear();
        calendarPage.eventName.sendKeys(string);
        calendarPage.save.click();
    }

    @Then("user should be able to change repeat section as {string}")
    public void user_should_be_able_to_change_repeat_section_as(String string) {
        Select select = new Select(calendarPage.repeat);
        select.selectByVisibleText(string);
        calendarPage.save.click();
        String actualTitle = Driver.get().getTitle();
        String expectedTitle = ConfigurationReader.get(user + "_username") + ": Calendar";
        Assert.assertEquals(expectedTitle, actualTitle);
    }

    @Then("user should be able to delete an attendee")
    public void user_should_be_able_to_delete_an_attendee() {
        List<WebElement> allAttendees = calendarPage.allAttendees;
        List<String> allAttendeesList = new ArrayList<>();
        for (WebElement attendee : allAttendees) {
            allAttendeesList.add(attendee.getText());
        }
        calendarPage.removeFirstAttendee.click();
        calendarPage.save.click();
        Driver.get().navigate().refresh();
        calendarPage.schedule.click();
        calendarPage.findEvent(event_name, event_date).click();
        calendarPage.invitedButton.click();
        List<WebElement> participants = calendarPage.invitedParticipants;
        List<String> participantList = new ArrayList<>();
        for (WebElement participant : participants) {
            participantList.add(participant.getText());
        }
        Assert.assertNotEquals(allAttendeesList, participantList);
    }

    @Then("user should be able to add one more attendee\\({string}) by editing the event")
    public void user_should_be_able_to_add_one_more_attendee_by_editing_the_event(String newAttendee) {

        calendarPage.addAttendees(newAttendee);
        calendarPage.save.click();
        Driver.get().navigate().refresh();
        calendarPage.schedule.click();
        calendarPage.findEvent(event_name, event_date).click();
        calendarPage.invitedButton.click();
        List<WebElement> participants = calendarPage.invitedParticipants;
        List<String> participantList = new ArrayList<>();
        for (WebElement participant : participants) {
            participantList.add(participant.getText());
        }
        Assert.assertTrue(participantList.contains(newAttendee));
    }

    @Then("user should not be able to display HR user's event on his-her calendar")
    public void user_should_not_be_able_to_display_HR_user_s_event_on_his_her_calendar() {
        String[] events = {calendarPage.getFirstEventName(), calendarPage.getEditedEventName()};
        for (int i = 0; i < 2; i++) {
            boolean displayed = calendarPage.checkEvents(events[i], event_date);
            Assert.assertFalse(displayed);
        }
    }

    @When("user clicks Filter and search and clicks Invitations")
    public void user_clicks_Filter_and_search_and_clicks_Invitations() {
        calendarPage.filterAndSearch.click();
        calendarPage.invitations.click();
    }

    @Then("user should be able to display {string}")
    public void user_should_be_able_to_display(String expected) {
        String actual = calendarPage.currentFilter.getText();
        Assert.assertEquals(expected, actual);
    }

    @When("user clicks Filter and search and clicks I'M AN ORGANIZER")
    public void user_clicks_Filter_and_search_and_clicks_I_M_AN_ORGANIZER() {
        calendarPage.filterAndSearch.click();
        calendarPage.i_am_an_organiser.click();
    }

    @When("user clicks Filter and search")
    public void user_clicks_Filter_and_search() {
        calendarPage.filterAndSearch.click();
    }

    @When("user selects Yes under Event with participants, Invited under Participation status and click reset")
    public void user_selects_Yes_under_Event_with_participants_Invited_under_Participation_status_and_click_reset() {
        calendarPage.addField.click();
        if (!calendarPage.participationStatus.isEnabled()) {
            calendarPage.participationStatus.click();
        }
        calendarPage.eventWithParticipants.click();
        calendarPage.participantsYes.click();
        BrowserUtils.waitForClickablility(calendarPage.participationStatusField, 2);
        calendarPage.participationStatusField.click();
        calendarPage.participationInvited.click();
        calendarPage.reset.click();
    }

    @Then("user should be able to reset user input fields to {string}")
    public void user_should_be_able_to_reset_user_input_fields_to(String expected) {
        String actual1 = calendarPage.eventWithParticipants.getText();
        String actual2 = calendarPage.participationStatusField.getText();
        Assert.assertEquals(expected, actual1);
        Assert.assertEquals(expected, actual2);
    }

    @Then("user should not be able to add event when click the SAVE button")
    public void user_should_not_be_able_to_add_event_when_click_the_SAVE_button() {
        calendarPage.save.click();
        Assert.assertFalse(calendarPage.checkEvents(event_name, event_date));
    }
}
