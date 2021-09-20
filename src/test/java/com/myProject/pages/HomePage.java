package com.myProject.pages;

import com.myProject.utilities.Driver;
import org.openqa.selenium.By;
import org.openqa.selenium.support.PageFactory;

public class HomePage extends BasePage {

    public HomePage() {
        PageFactory.initElements(Driver.get(), this);
    }

    public void navigateToMenu(String menu) {
        Driver.get().findElement(By.xpath("//span[@class='menu-item-link-text' and contains(text(), '"
                + menu + "')]")).click();
    }

    public void navigateToTab(String tab) {
        Driver.get().findElement(By.xpath("//span[@class='main-buttons-item-text-title' and contains(text(), '"
                + tab + "')]")).click();
    }
}
