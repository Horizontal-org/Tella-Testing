@PlusButton
Feature: Plus button

Background:
Given that the user is unlocked in the Tella app
And is in the Tella Home

@Smoke
Scenario Outline: Capture a file of type <type> from folder <folder>
  When the user enters the folder <folder>
  And taps the "+" button
  And selects the option "Take photo/video"
  And selects the option <option>
  And captures the file of type <type>
  Then the message "file encrypted" appears
  And the file of type <type> is saved correctly in the folder <folderSave>
  And the file of type <type> appears in the list of files in the folder <folderSave>
  And the file appears in the "All files" folder

Examples:
| type  | folderSave | option | folder    |
| image | Images     | Photo  | All files |
| video | Videos     | Video  | All files |
| image | Images     | Photo  | Documents |
| video | Videos     | Video  | Documents |
| image | Images     | Photo  | Images    |
| video | Videos     | Video  | Images    |
| image | Images     | Photo  | Audio     |
| video | Videos     | Video  | Audio     |
| image | Images     | Photo  | Video     |
| video | Videos     | Video  | Video     |
| image | Images     | Photo  | Others    |
| video | Videos     | Video  | Others    |

@Smoke
Scenario Outline: Record an audio file from the folder <folder>
  When the user enters the folder <folder>
  And taps the "+" button
  And selects the option "Record audio"
  And captures the audio
  Then the message "The audio recording was saved to your Tella files" appears
  And the audio file is saved correctly in the "Audio" folder
  And the audio file appears in the list of files in the "Audio" folder
  And the audio file appears in the list of files in the "All files" folder

Examples:
| folder    |
| All files |
| Documents |
| Images    |
| Audio     |
| Video     |
| Others    |

@Smoke
Scenario Outline: Import a file of type <type> from a folder <folder> - preserving the original
  When the user enters the folder <folder>
  And taps the "+" button
  And selects the option "Import from device"
  And taps the "KEEP ORIGINAL" button
  And taps the "Continue" button
  And selects a file of type <type> from the device
  Then the file is saved in the folder <folderSave>
  And the file of type <type> appears in the list of files in the folder <folderSave>
  And the file appears in the "All files" folder

Examples:
| type      | folderSave | folder    |
| image     | Images     | All files |
| video     | Videos     | All files |
| audio     | Audios     | All files |
| document  | Documents  | All files |
| image     | Images     | Documents |
| video     | Videos     | Documents |
| audio     | Audios     | Documents |
| document  | Documents  | Documents |
| image     | Images     | Images    |
| video     | Videos     | Images    |
| audio     | Audios     | Images    |
| document  | Documents  | Images    |
| image     | Images     | Videos    |
| video     | Videos     | Videos    |
| audio     | Audios     | Videos    |
| document  | Documents  | Videos    |
| image     | Images     | Audio     |
| video     | Videos     | Audio     |
| audio     | Audios     | Audio     |
| document  | Documents  | Audio     |

@Regression
Scenario Outline: Import a file of type <type> from a folder <folder> - deleting the original
  When the user enters the folder <folder>
  And taps the "+" button
  And selects the option "Import from device"
  And taps the "DELETE ORIGINAL" button
  And taps the "Continue" button
  And selects a file of type <type> from the device
  Then the file is saved in the folder <folderSave>
  And the file of type <type> appears in the list of files in the folder <folderSave>
  And The original file is deleted from the device

Examples:
| type      | folderSave | folder    |
| image     | Images     | All files |
| video     | Videos     | All files |
| audio     | Audios     | All files |
| document  | Documents  | All files |
| image     | Images     | Documents |
| video     | Videos     | Documents |
| audio     | Audios     | Documents |
| document  | Documents  | Documents |
| image     | Images     | Images    |
| video     | Videos     | Images    |
| audio     | Audios     | Images    |
| document  | Documents  | Images    |
| image     | Images     | Videos    |
| video     | Videos     | Videos    |
| audio     | Audios     | Videos    |
| document  | Documents  | Videos    |
| image     | Images     | Audio     |
| video     | Videos     | Audio     |
| audio     | Audios     | Audio     |
| document  | Documents  | Audio     |

@Regression
Scenario Outline: Import a duplicate file of type <type> from folder <folder>
  When the user enters the folder <folder>
  And taps the "+" button
  And selects the option "Import from device"
  And taps the "KEEP ORIGINAL" button
  And taps the "Continue" button
  And selects a file of type <type> from the device
  And taps the "+" button again
  And selects the option "Import from device"
  And taps the "KEEP ORIGINAL" button
  And taps the "Continue" button
  And selects the same file type <type> from the device
  Then the duplicate file is imported correctly with a different name
  And the file of type <type> appears in the list of files in the folder <folderSave>
  And the file appears in the "All files" folder

Examples:
| type      | folderSave | folder    |
| image     | Images     | All files |
| video     | Videos     | Documents |
| document  | Documents  | Images    |
| image     | Images     | Videos    |
| audio     | Videos     | Audio     |

@Smoke
Scenario: Successfully add a folder
  When the user enters the "All Files" folder
  And taps the "+" button
  And selects the option "Create"
  And enters a folder name "folder1"
  And taps the "OK" button
  Then a folder with the specified name "folder1" is created

@Regression
Scenario: Successfully add a folder inside another
  When the user enters the "All Files" folder
  And taps the "+" button
  And selects the option "Create"
  And enters a folder name "folder1"
  And taps the "OK" button
  And enters "folder1"
  And taps the "+" button
  And selects the option "Create"
  And enters a folder name "folder2"
  And taps the "OK" button
  And taps the "Create" button
  Then "folder2" is successfully created inside "folder1"

@Regression
Scenario: Attempt to add a new folder with a duplicate name
  When the user enters the "All Files" folder
  And taps the "+" button
  And selects the option "Create"
  And enters a folder name "folder1"
  And taps the "OK" button
  And enters "folder1"
  And taps the "+" button
  And selects the option "Create"
  And enters a folder name "folder1"
  And taps the "OK" button
  Then the folder "folder1" is not created