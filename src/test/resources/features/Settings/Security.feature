@Regression @Security
Feature: Security

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the category Security

  @Smoke @ToBeAutomated @Lock
  Scenario Outline: Security - Lock - <LockOption> option
    When the user clicks the "Lock" option
    And set security code valid
    And tap "<LockOption>" option
    And set <passPin>
    And taps "next" button
    And set confirm <passPin>
    And taps "next" button
    Then "Your lock has been changed" message is shown

    Examples:
      | passPin | LockOption |
      | 1234560 | Password   |
      | 1234560 | PIN        |

  @Android @Lock
  Scenario: Security - Lock - Pattern option
    When the user clicks the "Lock" option
    And set security code valid
    And taps "Pattern" option
    And set pattern
    And taps "next" button
    And set confirm pattern
    And taps "next" button
    Then "Your lock has been changed" message is shown

  @Smoke @SmokeManual @LockTimeout
  Scenario Outline: Security - Lock Timeout
    When the user clicks the "Lock timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    And wait <timeout> of time
    Then view screen lock

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |

  @Smoke @LockTimeout @Automated
  Scenario Outline: Security - Change Lock Timeout
    When the user clicks the "Lock Timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    Then the option timeout <timeout> is selected

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |

  @Smoke @DeleteAfterFailedUnlock @SmokeManual
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And the sucessfull message <message> is displayed
    And select attempts <attempts> option
    And taps "OK" button
    And the user close the app
    And the user set incorrect <PIN> in <attempts>
    Then sees that the files have been deleted

    Examples:
      | attempts    | PIN    | message                                                         |
      | 5 attempts  | 123450 | Your Tella data will be deleted after 5 failed unlock attempts  |
      | 10 attempts | 123451 | Your Tella data will be deleted after 10 failed unlock attempts |
      | 20 attempts | 123450 | Your Tella data will be deleted after 20 failed unlock attempts |

  @Smoke @DeleteAfterFailedUnlock @Automated
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    Then the sucessfull message <message> is displayed
    And The option show remaining unlock attempts will be displayed enabled

    Examples:
      | attempts                 | status | message                                                         |
      | Off (do not delete data) | Off    |                                                                 |
      | 5 attempts               | On     | Your Tella data will be deleted after 5 failed unlock attempts  |
      | 10 attempts              | On     | Your Tella data will be deleted after 10 failed unlock attempts |
      | 20 attempts              | On     | Your Tella data will be deleted after 20 failed unlock attempts |

  @Smoke @Camouflage @SmokeManual
  Scenario Outline: Security - camouflage - change camuflaje method - change name and icon
    When the user clicks the "Camouflage" option
    And The user enter the password <password>
    And select "CHANGE NAME AND ICON" option
    And select icon <icon> option
    And tap the next button
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <icon>

    Examples:
      | password | icon       | message                                                                     |
      | 123456   | MiCamera   | Please wait. You will return to your device's home screen in a few seconds. |
      | 123456   | Calculator | Please wait. You will return to your device's home screen in a few seconds. |

  #Linea repetida a la 306 
  @Smoke @Camouflage @SmokeManual @igualesPrueba
  Scenario Outline: Security - camouflage - change camuflaje method - hide behind a calculator
    When the PIN is selected in lock option
    And the user clicks the "Camouflage" option
    And enter the valid PIN
    And select "HIDE BEHIND A CALCULATOR APP" option
    And select <calculator> option
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <calculator>

    Examples:
      | calculator   | message                                                                     |
      | Calculator_1 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_2 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_3 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_4 | Please wait. You will return to your device's home screen in a few seconds. |

  @Smoke @QuickDelete @SmokeManual
  Scenario Outline: Security - Quick delete - <quickDeleteCheck>
    When toggle the switch on the "Quick delete" option
    And select check box "<quickDeleteCheck>"
    And go to Tella home page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message "Quick Delete mode activation"
    And waits finish counter
    And open Tella application again
    And set security code valid
    Then that files were deleted

    Examples:
      | quickDeleteCheck                 |
      | Delete files                     |
      | Delete draft and submitted forms |
      | Delete server settings           |

  @Smoke @QuickDelete @SmokeManual
  Scenario: Security - Quick delete - Delete Tella
    When toggle the switch on the "Quick delete" option
    And select check box “Delete Tella”
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    Then uninstall message appears

  @Smoke @QuickDelete @Automated
  Scenario Outline: Security - Quick delete - Help info
    When toggle the switch on the "Quick delete" option
    And click on the help icon in <deleteOption>
    Then the help info message <message> is displayed

    Examples:
      | deleteOption                     | message                                                                |
      | Delete files                     | Delete all the files stored in Tella.                                  |
      | Delete draft and submitted forms | Delete all draft and submitted forms.                                  |
      | Delete server settings           | Delete your connections to servers and all forms associated with them. |

  @Smoke @Automated
  Scenario Outline: Security - <option> ON
    When toggle the switch on the "<option>" option
    Then the "<option>" option is activated

    Examples:
      | option                           |
      | Quick delete                     |
      | Preserve metadata when importing |
      | Camera silent mode               |
  
  #Ver linea 355
  @Smoke @CameraSilentMode @SmokeManual 
  Scenario: Security - Camera silent mode
    When toggle the switch on the "Camera silent mode" option
    And go to Tella home page
    And taps camera button
    And take photo
    Then the camera did not make the sound
    
  #Colocarlos Tags 
  #Scenario Outline: Security - Camera silent mode 
  #  Given the user is on the Tella home page 
  #  And the user taps the settings icon 
  #  And clicks on the Security category 
  # When the user <action> the switch of the "Camera silent mode" option 
  #  And goes to the Tella home page 
  #  And taps the camera button 
  #  And takes a photo 
  #  Then the camera <result> 
  
  Examples: 
    | action    | result                  |
    | enables   | did not make the sound  |
    | disables  | made the sound          |  

  @Smoke @ScreenSecurity @ToBeAutomated
  Scenario: Security - Screen secuCamera silent mode
    When toggle the switch on the "Screen security" option
    And go to Tella home page
    And take screenshot
    Then view warning permissions

  Scenario Outline: Security - Lock - <LockOption> option
    When the user clicks the "Lock" option
    And set security code valid
    And tap "<LockOption>" option
    And set <passPin>
    And taps "next" button
    And set confirm <passPin>
    And taps "next" button
    Then "Your lock has been changed" message is shown

    Examples:
      | passPin | LockOption |
      | 1234560 | password   |
      | 1234560 | PIN        |

  Scenario: Security - lock - pattern option
    When the user clicks the "Lock" option
    And set security code valid
    And taps "pattern" option
    And set pattern
    And taps "next" button
    And set confirm pattern
    And taps "next" button
    Then  "Your lock has been changed" message is shown

  @Smoke @LockTimeout @SmokeManual
  Scenario Outline: Security - Lock Timeout
    When the user clicks the "Lock timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    And wait <timeout> of time
    Then view screen lock

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |


  @Smoke @DeleteAfterFailedUnlock @SmokeManual
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    And the user close the app
    And the user set incorrect <PIN> in <attempts>
    Then the files have been deleted

    Examples:
      | attempts    | PIN    |
      | 5 attempts  | 123450 |
      | 10 attempts | 123451 |
      | 20 attempts | 123450 |

  @Smoke @Automated
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    Then the sucessfull message <message> is displayed
    And the "Delete after failed unlock" option is changed to status <status>

    Examples:
      | attempts                 | status | message                                                         |
      | Off (do not delete data) | Off    |                                                                 |
      | 5 attempts               | On     | Your Tella data will be deleted after 5 failed unlock attempts  |
      | 10 attempts              | On     | Your Tella data will be deleted after 10 failed unlock attempts |
      | 20 attempts              | On     | Your Tella data will be deleted after 20 failed unlock attempts |

  @Smoke @Camouflage @SmokeManual
  Scenario Outline: Security - camouflage - change camouflage method - change name and icon
    When the user clicks the "Camouflage" option
    And The user enter the password <password>
    And select "CHANGE NAME AND ICON" option
    And select icon <icon> option
    And tap the next button
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <icon>

    Examples:
      | password | icon       | message                                                                     |
      | 123456   | MiCamera   | Please wait. You will return to your device's home screen in a few seconds. |
      | 123456   | Calculator | Please wait. You will return to your device's home screen in a few seconds. |

  @Smoke @Camouflage @SmokeManual @igualesPrueba
  Scenario Outline: Security - camouflage -  change camouflage method - hide behind a calculator
    When the PIN is selected in lock option 
    And the user clicks the "Camouflage" option
    And enter the valid PIN
    And select "HIDE BEHIND A CALCULATOR APP" option
    And select <calculator> option
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <calculator>

    Examples:
      | calculator   | message                                                                     |
      | Calculator_1 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_2 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_3 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_4 | Please wait. You will return to your device's home screen in a few seconds. |
      
  #Scenario Outline: Security - Camouflage - Change camouflage method - Hide behind a calculator
  #When the user clicks the "Camouflage" option
  #And the user enters a valid PIN
  #And the user selects the option "HIDE BEHIND A CALCULATOR APP"
  #And the user selects the <calculator> icon
  #And the user taps the "Exit Tella" button
  #Then the message "Please wait. You will return to your device's home screen in a few seconds." is displayed
  #And the Tella icon is displayed as <calculator>

  Examples:
    | calculator   |
    | Calculator_1 |
    | Calculator_2 |
    | Calculator_3 |
    | Calculator_4 |    

  @Smoke @QuickDelete @SmokeManual
  Scenario Outline: Security - Quick delete - <quickDeleteCheck>
    When taps switch in "Quick delete" option
    And select check box "<quickDeleteCheck>"
    And go to Tella home page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message "Quick Delete mode activation"
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that files were deleted

    Examples:
      | quickDeleteCheck                 |
      | Delete files                     |
      | Delete draft and submitted forms |
      | Delete server settings           |

  Scenario: Security - Quick delete - Delete Tella
    When taps switch in "Quick delete" option
    And select check box “Delete Tella”
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    Then view uninstall message

  @Smoke @QuickDelete @ToBeAutomated @Bug
  Scenario Outline: Security - Quick delete - help info
    When taps switch in "Quick delete" option
    And taps icon help in <deleteOption>
    Then the message "<message>" is displayed

    Examples:
      | deleteOption                     | message                                                               |
      | Delete files                     | Delete all the files stored in Tella                                  |
      | Delete draft and submitted forms | Delete all draft and submitted forms                                  |
      | Delete server settings           | Delete your connections to servers and all forms associated with them |

  @Smoke @ToBeAutomated
  Scenario: Security - Preserve metadata when importing
    When view "Preserve metadata when importing"
    And taps switch in ON to option "Preserve metadata when importing"
    Then the "Preserve metadata when importing" option is activated

  @Smoke @CameraSilentMode @SmokeManual
  Scenario: Security - Camera silent mode
    When view "Camera silent mode"
    And taps switch in ON to option "Camera silent mode"
    And go to Tella home page
    And taps camera button
    And take photo
    Then the camera did not make the sound

  @Smoke @SmokeManual
  Scenario: Security - Screen security
    When view "Screen security"
    And taps switch in ON to option "Screen security"
    And go to Tella home page
    And take screenshot
    Then view warning permissions
