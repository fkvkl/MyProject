package com.myProject.pages;
import com.myProject.utilities.BrowserUtils;
import com.myProject.utilities.Driver;
import org.openqa.selenium.*;
import org.openqa.selenium.support.Color;
import org.openqa.selenium.support.FindBy;

import java.util.*;

public class CalendarPage extends BasePage {

    private String firstEventName = "event";
    private String editedEventName = "editedEvent";

    public String getFirstEventName() {
        return firstEventName;
    }
    public String getEditedEventName() {
        return editedEventName;
    }

    @FindBy(xpath = "//button[@class='ui-btn-main']")
    public WebElement add;

    @FindBy(xpath = "//input[@name='name']")
    public WebElement eventName;

    @FindBy(xpath = "//span[@data-bx-calendar-view='list']")
    public WebElement schedule;

    @FindBy(xpath = "//input[@name='importance']")
    public WebElement importance;

    @FindBy(xpath = "//input[@name='date_from']")
    public WebElement dateFrom;

    @FindBy(xpath = "//input[@name='date_to']")
    public WebElement dateTo;

    @FindBy(css = ".calendar-options-timezone-collapse-btn")
    public WebElement timeZone;

    @FindBy(xpath = "//select[@name='tz_from']")
    public WebElement timeZoneFrom;

    @FindBy(xpath = "//select[@name='EVENT_RRULE[FREQ]']")
    public WebElement repeat;

    @FindBy(xpath = "//input[@name='lo_cation']")
    public WebElement location;

    @FindBy(css = ".event-grid-dest-wrap")
    public WebElement attendeesField;

    @FindBy(css = ".event-grid-dest-text")
    public List<WebElement> allAttendees;

    @FindBy(xpath = "(//span[@class='feed-event-del-but'])[2]")
    public WebElement removeFirstAttendee;

    @FindBy(css = ".calendar-slider-sidebar-user-info-name")
    public List<WebElement> invitedParticipants;

    @FindBy(css = ".calendar-member-total-count")
    public WebElement invitedButton;

    @FindBy(css = ".bx-lm-tab-department")
    public WebElement employeesAndDeps;

    @FindBy(css = ".calendar-additional-alt-promo")
    public WebElement more;

    @FindBy(css = ".calendar-field-colorpicker-color-item-more-link")
    public WebElement otherColor;

    @FindBy(css = ".main-color-picker-custom-action")
    public WebElement customColor;

    @FindBy(css = ".main-color-picker-custom-input")
    public WebElement colorCode;

    @FindBy(xpath = "//select[@name='accessibility']")
    public WebElement availability;

    @FindBy(xpath = "//body")
    public WebElement descriptionInput;

    @FindBy(xpath = "//iframe[@class='bx-editor-iframe']")
    public WebElement descriptionFrame;

    @FindBy(xpath = "//span[contains(text(),'Ctrl+Enter')]")
    public WebElement save;

    @FindBy(xpath = "//span[@class='calendar-right-block-event-info-btn'][2]")
    public WebElement editEvent;

    @FindBy(xpath = "//span[@class='calendar-right-block-event-info-btn'][1]")
    public WebElement openEvent;

    @FindBy(xpath = "//input[@name='private_event']")
    public WebElement privateEvent;

    @FindBy(xpath = "(//div[@class='calendar-slider-detail-option-value'])[1]")
    public WebElement getAvailability;

    @FindBy(css = ".calendar-timeline-stream-content-event")
    public WebElement eventDetails;

    @FindBy(xpath = "(//div[@class='calendar-slider-detail-option-value'])[3]")
    public WebElement specialNotes;

    @FindBy(xpath = "//*[@class='calendar-timeline-stream-content-event-name-link']")
    public List<WebElement> allEvents;

    @FindBy(css = "#calendar-filter-personal_search")
    public WebElement filterAndSearch;

    @FindBy(css = ".main-ui-square-item")
    public WebElement currentFilter;

    @FindBy(css = ".main-ui-filter-field-add-item")
    public WebElement addField;

    @FindBy(xpath = "//div[.='Participation status']/div")
    public WebElement participationStatus;

    @FindBy(xpath = "(//div[@data-name='MEETING_STATUS'])[2]")
    public WebElement participationStatusField;

    @FindBy(xpath = "(//div[@data-name='IS_MEETING']/div)[1]")
    public WebElement eventWithParticipants;

    @FindBy(xpath = "//div[@data-item='{\"NAME\":\"Yes\",\"VALUE\":\"Y\"}']")
    public WebElement participantsYes;

    @FindBy(xpath = "//div[@data-item='{\"NAME\":\"Invited\",\"VALUE\":\"Q\"}']/div")
    public WebElement participationInvited;

    @FindBy(xpath = "//span[.='Invitations']")
    public WebElement invitations;

    @FindBy(xpath = "//span[.=\"I'm an organiser\"]")
    public WebElement i_am_an_organiser;

    @FindBy(xpath = "(//span[contains(text(),'Reset')])[2]")
    public WebElement reset;

    @FindBy(xpath = "//span[.='Delete']")
    public WebElement delete;

    public void eventDescription(String description) {
        BrowserUtils.waitForVisibility(descriptionFrame, 10);
        Driver.get().switchTo().frame(descriptionFrame);
        descriptionInput.click();
        descriptionInput.sendKeys(description);
        Driver.get().switchTo().defaultContent();
    }

    public void addAttendees(String list) {
        attendeesField.click();
        employeesAndDeps.click();
        if (list.contains("/")) {
            String[] split = list.split("/");
            for (String s : split) {
                Driver.get().findElement(By.xpath("//div[@class='bx-finder-company-department-employee-name' " +
                        "and contains(text(),'" + s + "')]")).click();
            }
        } else {
            Driver.get().findElement(By.xpath("//div[@class='bx-finder-company-department-employee-name' " +
                    "and contains(text(),'" + list + "')]")).click();
        }
    }

    public void selectColor(String color) {
        Color color1 = Color.fromString(color);
        String colorAsHex = color1.asHex();
        otherColor.click();
        customColor.click();
        colorCode.sendKeys(colorAsHex + Keys.ENTER);
    }

    public WebElement eventColor(String event, String date) {
        WebElement colorLocator;
        try {
            colorLocator = Driver.get().findElement(By.xpath(eventLocatorFinder(event, date)));
        } catch (Exception e) {
            colorLocator = Driver.get().findElement(By.xpath(eventLocatorFinder(editedEventName, date)));
        }
        return colorLocator;
    }

    String eventLocatorFinder(String event, String date) {
        String[] array = date.split("/");
        int year = Integer.parseInt(array[2]);
        int month = Integer.parseInt(array[0]);
        int day = Integer.parseInt(array[1]);
        String locator = "//div[@data-bx-calendar-list-year='"
                + year + "']/div[@data-bx-calendar-list-month='" + month + "']/div[@data-bx-calendar-list-day='"
                + day + "']//span[@class='calendar-timeline-stream-content-event-name-link' and text()='"
                + event + "']";
        return locator;
    }

    public boolean checkEvents(String event, String date) {
        List<WebElement> list = Driver.get().findElements(By.xpath(eventLocatorFinder(event, date)));
        return list.size() > 0;
    }

    public void eventHandler(String event, String date) {

        List<WebElement> list = Driver.get().findElements(By.xpath(eventLocatorFinder(event, date)));
        if (list.size() > 0) {
            for (WebElement webElement : list) {
                webElement.click();
                delete.click();
                Driver.get().switchTo().alert().accept();
            }
        }
        List<WebElement> editedEvents = Driver.get().findElements(By.xpath(eventLocatorFinder(editedEventName, date)));
        if (editedEvents.size() > 0) {
            for (WebElement editedEvent : editedEvents) {
                editedEvent.click();
                delete.click();
                Driver.get().switchTo().alert().accept();
            }
        }
    }

    public WebElement findEvent(String event, String date) {
        WebElement eventLocator;
        try {
            eventLocator = Driver.get().findElement(By.xpath(eventLocatorFinder(event, date)));
        } catch (Exception e) {
            eventLocator = Driver.get().findElement(By.xpath(eventLocatorFinder(editedEventName, date)));
        }
        return eventLocator;
    }
}
