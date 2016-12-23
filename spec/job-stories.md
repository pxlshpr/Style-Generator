# Job Stories
## [VC01] Primary Color Selection

| Story | Description |
| --- | --- |
| 1 | When this view controller loads, it should have one collection view, so that it can display the primary material colors to pick from |
| 2 | When I tap on one of the primary colors, the navigation bar should take its color, so that the user can get a feel of what that color would look like |
| 3 | When I tap on one of the primary colors, the navigation and status bar’s text should take on the associated text color, so that they are visible over the navigation bar’s new color |
| 4 | When I tap on one of the primary colors, every color but the one selected should be greyed out, so that I can clearly see what that color would look like |
| 5 | When I tap on one of the primary colors, the labels for each of the colors should appear (including the selected one), so that I can tell which color is which when selecting a new one |
| 6 | When I tap on one of the primary colors, the chosen color’s text should take on the associated text value for that color, so that it is clearly visible over the color |
| 7 | When I have already chosen a primary color and tap on it again, the UI should return to its initial state, so that I have a way of seeing the initial colors again |
| 8 | When I have already chosen a primary color and tap on another one, the UI should change similarly to when I had initially chosen that primary color, so that I am able to switch colors without reseting the UI |
| 9 | When this view controller loads, the Next button should be disabled, so that I can’t proceed without first selecting a primary color |
| 10 | When I tap one of the primary colors, the Next button should be enabled, so that I have the option of proceeding to the next screen |
| 11 | When I have already chosen a primary color and deslect it, the Next button should become disabled again, so that I am not able to proceed with no primary color selected |

## [VC02] Accent Color Selection

| Story | Description |
| --- | --- |
| 1 | When this view controller loads, it should have one collection view, so that so that it can display the accent colors to pick from |
| 2 | When I tap on one of the accent colors, every color but the one selected should be greyed out, so that I can clearly see what that color would look like against the primary color |
| 3 | When I tap on one of the accent colors, the labels for each of the colors should appear (including the selected one), so that I can tell which color is which when selecting a new one |
| 4 | When I tap on one of the accent colors, the chosen color’s text should take on the associated text value for that color, so that it is clearly visible over the color |
| 5 | When I have already chosen an accent color and tap on it again, the UI should return to its initial state, so that I have a way of seeing the initial colors again |
| 6 | When this view controller loads, the Next button should be disabled (with the 800 of the primary color), so that I can’t proceed without first selecting an accent color |
| 7 | When I tap one of the accent colors, the Next button should be enabled, so that I have the option of proceeding to the next screen |
| 8 | When I have already chosen an accent color and deslect it, the Next button should become disabled again, so that I am not able to proceed with no accent color selected |
| 9 | When I have already chosen an accent color and tap the Back button, the selected color should be saved and reselected when I come back to this view |

## [VC03] Primary Font Selection

| Story | Description |
| --- | --- |
| 1 | When this view controller loads, it should have one table view, so that so that it can display the (inbuilt) fonts to pick from |
| 2 | When I tap on one of the fonts, every font name should take on that font, so that I can clearly see what that they look like |
| 3 | When I tap on one of the fonts, the background color of the selected font cell should take on the chosen accent color and the font should take on the primary color, so that it is clearly legible |
| 4 | When I tap on one of the fonts, navigation bar title should take on that font and be a bit larger, while the secondary font should disappear, so that I can see how it would look up there | 
| 5 | When I have already chosen a font and tap on it again, the UI should return to its initial state, so that I have a way of seeing the initial fonts again |
| 6 | When this view controller loads, the Next button should be disabled (with the 800 of the primary color), so that I can’t proceed without first selecting a font |
| 7 | When I tap one of the fonts, the Next button should be enabled, so that I have the option of proceeding to the next screen |
| 8 | When I have already chosen a font and deslect it, the Next button should become disabled again, so that I am not able to proceed with no font selected |
| 9 | When I have already chosen a font and tap the Back button, the selected font should be saved and reselected when I come back to this view |

## [VC04] Secondary Font Selection

| Story | Description |
| --- | --- |
| 1 | When this view controller loads, it should have one table view, so that so that it can display the (inbuilt) fonts to pick from |
| 2 | When I tap on one of the fonts, every font name should take on that font, so that I can clearly see what that they look like |
| 3 | When I tap on one of the fonts, the background color of the selected font cell should take on the chosen accent color and the font should take on the primary color, so that it is clearly legible |
| 4 | When I have already chosen a font and tap on it again, the UI should return to its initial state, so that I have a way of seeing the initial fonts again |
| 5 | When this view controller loads, the Next button should be disabled (with the 800 of the primary color), so that I can’t proceed without first selecting a font |
| 6 | When I tap one of the fonts, the Next button should be enabled, so that I have the option of proceeding to the next screen |
| 7 | When I have already chosen a font and deslect it, the Next button should become disabled again, so that I am not able to proceed with no font selected |
| 8 | When I have already chosen a font and tap the Back button, the selected font should be saved and reselected when I come back to this view |

## [VC05] Summary

| Story | Description |
| --- | --- |
| 1 | When this VC loads, it should have a title using a bold version of the chosen text font, at a reasonably larger size than the regular body font size, so that I can se what headings would look like | 
| 2 | When this VC loads, it should have a few paragraphs (in the body text font) describing the chosen fonts, with the font names highlighted in the chosen primary color, so that I can see what they are and see what it the text font looks like |
| 3 | When this VC loads, the paragraph describing the body text font should have a couple of relevant words highlighted in an italiciszed version of the body text font, so that I can see what they would look like within a body text | 
| 4 | When this VC loads, there should be a paragraph describing what the chosen primary color is with the hex value highlighted in the chosen primary color, so that I can see what it is | 
| 5 | When this VC loads, there should be a section at the bottom that contains white text on a dark bacground stating what the accent color is with the hex and another couple of words highlighted using it (the accent color), so that I can see what it is and see it paired with the primary color in a real situation | 
| 6 | When I tap on the ‘Start Over’ button, there should be an alert informing me that all the selections will be discarded and confirming that I actually want to proceed, so that I don’t accidentally lose all my selections |