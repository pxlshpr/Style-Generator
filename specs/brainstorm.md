# Here you'll find notes that I write down as I brainstorm on the app and its feature set

According to the video, the colors should be categorized as follows for apps:
500 - dominant colors, toolbars
700 - status bar
300 - secondary information
accent colors - encourage user interaction. gives a subtle color pop. Hihlighting primary acttion buttons, switches, sliders, etc

So for our app, in its simplest form, the inpu should be: a 500 color.
It should then filter out the accents and allow you to pick from the possible accents for that 500.
Then, we output a palette containing the 500, 700, 300 and accent colors, *reminding* the designer what each of them should be used for.

500 -> 300, 700, A200


As for the app itself:

- It should basically start off with a screen that has a dummy toolbar at the bottom, a navigation bar with a title, and a bunch of all the colors to pick from in the middle.
- The UI's primary color should be as plain as possible, grey, if not white.
- Use system fonts etc.
- Once you pick one:
	- It should first (animatedly, ie with a nice fluid transition) change the primary color of the entire UI. We want as much color around here as possible to make this happen.
	- It should also perhaps 'grey' out all the squares with the primary colors now as much as possible, so that the colors of the UI itself sticks out and you can compare it.
	- The squares can maybe have the color name fade in on top of them now so that you can pick another one and move between them. The idea is that you see the colors (with no name and a bland UI) initiailly, and then have these in mind once they are greyed out with the names in the middle.
	- Once you press the next button:
		- It should then transition you to a second screen that lets you choose from a filtered selection of the accent colors. Similar experience to the primary color.
		- Picking an accent color should do the same thing as the primary color did, greying out, etc.
		- Once you press the next button:
			- It should take you to a screen where you select from a list of possible fonts. Include system fonts and other free options like maybe Google Fonts, and maybe some really famous good ones that people can download easily.
			- The cells on this screen should each describe a font that you can pick from, having as many labels as possible (in a compelx heirarchy) to be able to display a few of the different weights and styles (italic/bold) that may be used. So we're talking about include stuff like the creator of the font, what style it is, yadi ya. Start with the basics and add stuff as you need them. We basically need to have enough text for the user to be able to see and decide on a primary font.
			- Picking a new font should change the fonts in the entire app, even in the title. So we have to pick the fonts by their names and then see how they look.
			- Pressing the next button:
				- Should now take you to the next screen where you select a secondary font, and you can see the results in the cells as you select them.
				- Once you press the next button:
					- You should be now presented with a summary of your selections, and also be on a page where you're seeing the results in the styling. So colors and fonts, pretty nicely presented!