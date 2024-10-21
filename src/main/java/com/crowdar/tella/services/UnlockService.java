package com.crowdar.tella.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.LockUnlockConstants;
import io.appium.java_client.*;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.testng.Assert;

import java.time.Duration;


public class UnlockService {
    public static final int NEXT_BUTTON_CLICK_COUNT = 4;

    public static void isViewLoaded() {
        MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
        MobileActionManager.click(LockUnlockConstants.START_BUTTON);
    }

    public static void isViewLoadedReopenAppWithPassword() {
        MobileActionManager.waitVisibility(LockUnlockConstants.REOPEN_APP_PASSWORD_VERIFICATION);
        MobileActionManager.click(LockUnlockConstants.REOPEN_APP_PASSWORD_VERIFICATION);
    }

    public static void  isViewLoadedReopenAppWithPin() {
        MobileActionManager.waitVisibility(LockUnlockConstants.REOPEN_APP_PIN_VERIFICATION);
        MobileActionManager.click(LockUnlockConstants.REOPEN_APP_PIN_VERIFICATION);
    }

    public static void setPassword(String password) {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(LockUnlockConstants.LOCK_PASSWORD_BUTTON);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void enterPassword(String password){
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        EventFiringWebDriver driver = DriverManager.getDriverInstance();
        driver.getKeyboard().sendKeys(Keys.ENTER);
    }

    public static void goTella() {
        MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
        MobileActionManager.click(LockUnlockConstants.START_BUTTON);
    }

    public static void setNumbers(String pin) {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(LockUnlockConstants.LOCK_PIN_BUTTON);
        setPin(pin);
        MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
        setPin(pin);
        MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static String convertNumberToText(String number) {
        String[] textNumbers = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
        int num;
        try {
            num = Integer.parseInt(number);
        } catch (NumberFormatException e) {
            return number;
        }
        if (num >= 0 && num <= 9) {
            return textNumbers[num];
        } else {
            return number;
        }
    }

    public static void setPin(String pin) {
        String[] strArrayNums = pin.split("");
        for (String number : strArrayNums) {
            String convertedNumber = convertNumberToText(number);
            String id = String.format("id:%sBtn", convertedNumber);
            ActionManager.click(id);
        }
    }

    public static void enterPin(String pin){
        setPin(pin);
        MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
    }

    public static void setPattern() {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(LockUnlockConstants.LOCK_PATTERN_BUTTON);
        MobileActionManager.click(LockUnlockConstants.LOCK_PATTERN_ID);

        MobileActionManager.waitVisibility(LockUnlockConstants.SCREEN_PATTERN_ID);
        definePattern();
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void clickNextButtons(int count) {
        for (int i = 0; i < count; i++) {
            MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        }
    }

    private static void definePattern() {
        /*Código para definir el patrón por coordenadas usando touchAction*/
        TouchAction touchAction = new TouchAction((PerformsTouchActions) DriverManager.getDriverInstance().getWrappedDriver());
        touchAction.press(PointOption.point(270, 2250))
                .moveTo(PointOption.point(270, 1350))
                .moveTo(PointOption.point(1160, 1353))
                .moveTo(PointOption.point(1160, 2243))
                .release()
                .perform();

        MobileActionManager.click(LockUnlockConstants.NETX_BUTTON_PATTERN_ID);

        /*Se vuelve a repetir el patrón*/
        touchAction.press(PointOption.point(270, 2250))
                .moveTo(PointOption.point(270, 1350))
                .moveTo(PointOption.point(1160, 1353))
                .moveTo(PointOption.point(1160, 2243))
                .release()
                .perform();
    }

    public static void clickExit(){
        MobileActionManager.click(LockUnlockConstants.EXIT_BUTTON);
    }

    public static void tapTellaApp(){
        TouchAction touchAction = new TouchAction((PerformsTouchActions) DriverManager.getDriverInstance().getWrappedDriver());
        touchAction.press(PointOption.point(550, 1700))
                   .waitAction(WaitOptions.waitOptions(Duration.ofMillis(3000)))
                   .moveTo(PointOption.point(550, 400))
                   .release()
                   .perform();
        MobileActionManager.click(LockUnlockConstants.TELLA_APP);
    }

    public static void reopenTheApp () throws InterruptedException {
            AppiumDriver<MobileElement> driver;
            driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
            driver.runAppInBackground(Duration.ofSeconds(5)); // Envía la app al fondo por 5 segundos
            driver.activateApp("org.hzontal.tella"); // Usa el package name de tu app para traerla de vuelta al frente
        }

    }

