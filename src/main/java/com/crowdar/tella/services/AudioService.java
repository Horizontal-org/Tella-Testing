package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.AudioConstants;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.util.List;


public class AudioService {

    static WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
    static WebDriverWait wait = new WebDriverWait(driver, 10);

    public static void clickRecOption(){
        MobileActionManager.waitVisibility(AudioConstants.REC_OPTION);
        MobileActionManager.click(AudioConstants.REC_OPTION);
    }

    public static void clickMicrophoneIcon(){
        MobileActionManager.waitVisibility(AudioConstants.MICROPHONE_ICON);
        MobileActionManager.click(AudioConstants.MICROPHONE_ICON);
        acceptPermissions();
        MobileActionManager.click(AudioConstants.MICROPHONE_ICON);
    }

    public static void clickPencilIcon(){
        MobileActionManager.waitVisibility(AudioConstants.PENCIL_ICON);
        MobileActionManager.click(AudioConstants.PENCIL_ICON);
    }

    public static void deleteLastName(){
        WebElement inputField = wait.until(ExpectedConditions.presenceOfElementLocated(By.id(AudioConstants.TITLE_AUDIO_RECORDING_INPUT)));
        inputField.clear();
    }

    public static void addNewRecordingName(String recordingName){
        MobileActionManager.setInput(AudioConstants.RECORD_NAME_INPUT,recordingName);
    }

    public static void clickOkbutton(){
        MobileActionManager.waitClickable(AudioConstants.OK_BUTTON);
        MobileActionManager.click(AudioConstants.OK_BUTTON);
    }

    public static void clickStopOption(){
        MobileActionManager.waitClickable(AudioConstants.STOP_BUTTON);
        MobileActionManager.click(AudioConstants.STOP_BUTTON);
    }


    public static void acceptPermissions() {
        wait.until(ExpectedConditions.presenceOfElementLocated(By.id(AudioConstants.PERMISSIONS_MESSAGE)));
        List<WebElement> elems = DriverManager.getDriverInstance().getWrappedDriver().findElements(By.id(AudioConstants.PERMISSIONS_MESSAGE));
        if (elems.size() > 0) {
            DriverManager.getDriverInstance().getWrappedDriver().findElement(By.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
        }
    }
}
