@Servers @Smoke @Regression
Feature: Servers

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the option Servers

  @Automated
  Scenario: Servers - View Server Options
    When the user presses the + button
    Then the user sees all possible server options available for connection
      | Open Data Kit (ODK) |
      | Tella Web           |
      | Uwazi               |

  @Automated
  Scenario Outline: Server - Select Server <server>
    When the user presses the + button
    And selects the server "<server>"
    And the user presses "OK" button
    Then the user views the server <server> settings

    Examples:
      | server              |
      | Open Data Kit (ODK) |
      | Tella Web           |
      | Uwazi               |

  @Automated
  Scenario Outline: Servers - ODK Server Configuration
    When the user presses the + button
    And selects the server "Open Data Kit (ODK)"
    And the user presses "OK" button
    And enter the sever name <serverName>
    And enter the server url "<serverUrl>"
    And the user presses "SAVE" button
    Then the user views the message <message>
    And the user views the <serverName> in the connect list

    Examples:
      | serverName     | serverUrl                                      | message        |
      | Server Crowdar | https://kc.kobotoolbox.org/tella_internal_test | Server created |

  Scenario: Servers - Advanced Configuration in Open Data Kit Server
    When the user presses the + button
    And selects the server "Open Data Kit (ODK)"
    And the user presses "OK" button
    And expands the "Advanced" section
    Then the user views the fields "Username"; "Password" to fill

  @Automated
  Scenario: Server - Tella Web configuration with URL
    When the user presses the + button
    And selects the server "Tella Web"
    And the user presses "OK" button
    And enter the server url "https://tella.world/p/server-project-crowdar"
    And the user presses "Next" button
    Then the user views the "Log in to access the project"
    And the user views the fields "Username" and "Password"

  @Automated
  Scenario: Server - Uwazi configuration with URL
    When the user presses the + button
    And selects the server "Uwazi"
    And the user presses "OK" button
    And enter the server url "https://horizontal.uwazi.io"
    And the user presses "Next" button
    Then the user views the buttons:
      | Log in        |
      | Public access |

    @Automated
    Scenario Outline: Public Access with Uwazi in <language>
    When the user presses the + button
    And the user selects "Uwazi"
    And the user presses "OK"
    And the user enters the project URL
    And the user presses "Next"
    And selects the "Public access" option
    And the user presses "Next"
    And the user selects the language <language>
    And the user presses "Next"
    Then the message "You hace successfully connected to the server and will be able to share your data." appears
    And the user is now connected to Uwazi server in <language>

    Examples:
      | language |
      | English  |
      | Spanish  |
      | French   |