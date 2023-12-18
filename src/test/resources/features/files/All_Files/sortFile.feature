Feature: Organize files in the "All files" folder

Background:
Given the user has an account on Tella
And has logged in to Tella
And is within the "All files" folder

Scenario Outline: Sort files by <sortBy> in the "All files" folder
When the user taps the "Name ↑" icon
And chooses to sort files in <sortBy> order
Then the files are displayed according to the specified order
And the selected <sortBy> order persists upon re-entering the folder

Examples:
  | sortBy                |
  | From newest to oldest |
  | From oldest to newest |
  | Name A-Z              |
  | Name Z-A              |

Scenario Outline: Sort files by <view> in the "All files" folder
When the user taps the <view> button
Then the files are displayed according to the selected view
And the selected <view> persists upon re-entering the folder

Examples:
  | view |
  | grid |
  | list |