
Feature: File Options in the "Images" Folder

Background:
Given the user has an account on Tella
And has logged in to Tella
And is in the "Images" folder
And the files "image1.jpg" and "image2.jpg" exist

Scenario: Open an image from the "Images" folder
When they click on an "image1.jgp" in the folder
Then the image opens
  
Scenario: Rename an image file from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Rename"
And enters the name: "img"
And presses "OK"
Then the file name is updated

Scenario: Cancel renaming an image file from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Rename"
And enters the name: "img"
And presses "CANCEL"
Then the file name is not updated

Scenario: Rename a file with an identical name to an existing file
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Rename"
And enters the name: "image2.jpg"
And presses "OK"
Then the file name is not updated

Scenario Outline: Edit Image
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Edit"
And makes the <modification>
And presses the check button "V"
And the modification is saved as a new image
And the message "your changes have been saved" appears

Examples:
| Modification |
| Crop         |
| Rotate       |

Scenario Outline: Cancel image editing
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Edit"
And makes the <modification>
And presses the cancel button "x"
And the image editor closes

Examples:
| Modification |
| Crop         |
| Rotate       |

Scenario Outline: Share an image file via <SocialMedia> from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared successfully

Examples:
| SocialMedia | shareInformation                       |
| WhatsApp    | share files + verification information |
| WhatsApp    | share files only                       |
| Instagram   | share files + verification information |
| Instagram   | share files only                       |
| Gmail       | share files + verification information |
| Gmail       | share files only                       |

Scenario Outline: Share multiple image files via <SocialMedia> from the "Images" folder
When the user clicks the "v" button to select files
And selects "image1.jpg" and "image2.jpg"
And taps the "Share" button
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the files are shared successfully

Examples:
| SocialMedia | shareInformation                       |
| WhatsApp    | share files + verification information |
| WhatsApp    | share files only                       |
| Instagram   | share files + verification information |
| Instagram   | share files only                       |
| Gmail       | share files + verification information |
| Gmail       | share files only                       |

Scenario Outline: Cancel sharing an image file from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "CANCEL"
Then the dialog box closes
And the file is not shared

Scenario: Save a file to the device
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the image is saved successfully on the device
And the message "1 file saved to device" appears

Examples:
| shareInformation                       |
| share files + verification information |
| share files only                       |

Scenario: Save multiple files to the device
When the user clicks the "v" button to select files
And selects "image1.jpg" and "image2.jpg"
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the image is saved successfully on the device
And the message "1 file saved to device" appears

Examples:
| shareInformation                       |
| share files + verification information |
| share files only                       |
 
Scenario: Delete an image file from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Delete"
And taps "Delete"
Then the file is deleted
And the message "the file was deleted" appears

Scenario: Delete multiple image files from the "Images" folder
When the user clicks the "v" button to select files
And selects "image1.jpg" and "image2.jpg"
And taps the options button "⋮"
And selects the option "Delete"
Then the files are deleted
And the message "the file was deleted" appears

Scenario: Cancel deleting an image file from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "Delete"
And taps "Cancel"
Then the file is not deleted
And the dialog box closes

Scenario: View information of a file from the "Images" folder
When the user taps the options button "⋮" for the file "image1.jpg"
And selects the option "File information"
Then the file information appears