# Concentration
## Required Tasks
- [x] 1. Get the Concentration game working as demonstrated in lectures 1 and 2. Type in all the code. Do not copy/paste from anywhere.

- [x] 2. Add more cards to the game.

- [x] 3. Add a “New Game” button to your UI which ends the current game in progress and begins a brand new game.

- [x] 4. Currently the cards in the Model are not randomized (that’s why matching cards end up always in the same place in our UI). Shufﬂe the cards in `Concentration`’s `init()` method.

- [x] 5. Give your game the concept of a “theme”. A theme determines the set of emoji from which cards are chosen. All emoji in a given theme are related by that theme. See the Hints for example themes. Your game should have at least 6 different themes and should choose a random theme each time a new game starts.

- [x] 6. Your architecture must make it possible to add a new theme in a single line of code.

- [x] 7. Add a game score label to your UI. Score the game by giving 2 points for every match and penalizing 1 point for every previously seen card that is involved in a mismatch.

- [x] 8. Tracking the ﬂip count almost certainly does not belong in your Controller in a proper MVC architecture. Fix that.

- [x] 9. All new UI you add should be nicely laid out and look good in portrait mode on an iPhone X.

## Extra Credit
- [ ] 1. Change the background and the “card back color” to match the theme. For example, our Halloween theme has a black background and orange card backs. Maybe a “winter” theme might have blue and white colors. A “construction” theme could be black and yellow. `UIViewController` has a property called `view` which is connected to the top-level view in the scene (i.e. the view that was black in lecture).

- [ ] 2. You can ﬁnd out what time it is using the `Date` struct. Read the documentation to ﬁgure out how it works and then use it to adjust your scoring so that the more quickly moves are made, the better the user’s score is. You can modify the scoring Required Task in doing this, but the score must still somehow be dependent on matches being rewarded and mismatches of previously-seen cards being penalized (in addition to being time-based). It’s okay if a “good score” is a low number and a “bad score” is a high number.
