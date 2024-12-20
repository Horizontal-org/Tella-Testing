@Regression @Uwazi @Servers
Feature: Uwazi

  Background:
    Given the user is in Tella home page
    And the user is connected to the "Uwazi" server
    #With public access

  @Smoke @ToBeAutomated
  Scenario: Download templates
    When the user taps on the "Uwazi" connection
    And taps the "+" button
    And presses the Download button in the download template
    Then a green checkmark appears next to the download template
    And the template is now on the Uwazi templates list, ready for the user to fill out

  @Smoke @ToBeAutomated
  Scenario: Submit entity without attachments
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And presses "Next"
    And presses "Submit"
    Then the entity is saved on the Submitted tab with the corresponding information

  @Smoke @ToBeAutomated
  Scenario Outline: Delete entity from <Category>
    Given the user has an entity in <Category>
    When the user taps on the "Uwazi" connection
    And the user selects the category <Category>
    And taps the "⁝" button of the corresponding entity
    And selects Delete
    And confirms the Delete option
    Then the entity is deleted

    Examples:
      | Category  |
      | Outbox    |
      | Submitted |
      | Draft     |

  @Smoke @ToBeAutomated
  Scenario Outline: Submit entity with only primary document
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a PDF file from the Primary Documents field with the option <selection>
    And presses "Next"
    And presses "Submit"
    Then the file is uploaded
    And the entity is saved on the Submitted tab with the corresponding information

    Examples:
      | selection               |
      | Select from Tella files |
      | Select from your device |

  @Smoke @SmokeManual
  Scenario Outline: Submit entity with both primary document and supporting documentation
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a PDF file from the Primary Documents field with the option <selection>
    And selects a file from the Supporting files field with the option <option>
    And presses "Next"
    And presses "Submit"
    Then the files are uploaded
    And the entity is saved on the Submitted tab with the corresponding information

    Examples:
      | selection               | option                  |
      | Select from Tella files | Take photo with camera  |
      | Select from your device | Select from Tella files |
      | Select from Tella files | Select from your device |

  @Smoke @SmokeManual
  Scenario Outline: Submit entity with only supporting documentation
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a file from the Supporting files field with the option <option>
    And presses "Next"
    And presses "Submit"
    Then the file is uploaded
    And the entity is saved on the Submitted tab with the corresponding information

    Examples:
      | option                  |
      | Take photo with camera  |
      | Select from Tella files |
      | Select from your device |

  Scenario Outline: Submit entity with large attachments from the Supporting files <Files>
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a file of more than 100 MB from the Supporting files field with the option <option>
    And presses "Next"
    And presses "Submit"
    Then the file is uploaded
    And the entity is saved on the Submitted tab with the corresponding information

    Examples:
      | Files                   |
      | Select from Tella files |
      | Select from your device |

  @Smoke @SmokeManual
  Scenario Outline: Submit entity with large attachments while disconnecting the internet
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a file of more than 100 MB from the Supporting files field with the option <option>
    And disconnects the internet
    And presses "Next"
    And presses "Submit"
    Then the message "There was an error submitting the form. Please try again" appears
    And the entity is saved on the Outbox tab with the corresponding information

    Examples:
      | Select from Tella files |
      | Select from your device |

  @Smoke @SmokeManual
  Scenario Outline: Submit entity with large attachments while disconnecting and reconnecting to the internet
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a file of more than 100 MB from the Supporting files field with the option <option>
    And disconnects the internet
    And presses "Next"
    And presses "Submit"
    And selects the corresponding entity saved on the Outbox
    And reconnects to the internet
    And presses "Submit"
    Then the file is uploaded
    And the entity is saved on the Submitted tab with the corresponding information

    Examples:
      | Select from Tella files |
      | Select from your device |

  @Smoke @ToBeAutomated
  Scenario: Save entity to Outbox
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And presses "Next"
    And presses "Submit later"
    Then the entity is saved on the Outbox tab with the corresponding information

  @Smoke @ToBeAutomated
  Scenario: Save entity as Draft
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes the title
    And presses the "Save" icon
    Then the entity is saved on the Draft tab with the corresponding information
    And the message "Entity is saved as draft" appears
    
  #The edit can be add files, change the title or the type of incident
  Scenario Outline: Edit an entity from draft
    Given the user has an entity as draft
    When the user taps on the "Uwazi" connection
    And selects the category Draft
    And taps the "⁝" button of the corresponding entity
    And selects "Edit draft"
    And <edit> to the entity
    And presses the "Save" icon
    Then the edits are saved correctly to the entity as a draft

    Examples:
      | edit                         |
      | changes the title            |
      | changes the type of incident |
      | adds a file                  |
      | adds a geolocation           |

  Scenario: Fail to submit an entity due to missing required fields
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And presses "Next"
    Then the message "There were validation errors in some answers" appears

  Scenario: Fail to save entity as draft due to missing title
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And presses the "Save" icon
    Then the message "You must fill in the title" appears