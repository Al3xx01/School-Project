# MindArkanoid

Game create by Casale Alex, Damiano Edoardo, Bagnis Davide, Esposito Christian, Carpinato Andrea of 4AROB (ITIS "M. Delpozzo" - Cuneo).

## What is MindGames?

We thought of a new way to play videogames: using your mind and your own body as a controller you can be in full control of the game and you can avoid every kind of issue with others physical controllers (such as joysticks).

This way to play videogames furthermore is fully accessible to people with physical or mental disabilities and it allows them to have fun with videogames.

### This Is MindGames

MindArkanoid is the practical implementation of the project MindGames.
We developed a version of the good old Arkanoid making sure that he can be controlled by player's mind.

## Hardware Components

To make our videogame interact with player's mind we used an EEG Helmet (Emotiv Epoc+ ©), provided by IIT.
It's able to read people's brain activity and turn it into mental commands for the videogame.
In our case if the one who's playing loses his focus on the game, the paddle gets invisible so that it's more and more difficult to see it and as a consequence to play the videogame: the player is required to keep his focus on the game in this way.
The helmet also detects the movements of player's head and we have used this feature to move the paddle to right or to left so as to not let the ball fall.

This is very useful especially for people with disabilities who might not be able to move their hands or other parts of their body.

## Software Components

Our developers use Processing to write their code and implement it with the signals obtained from the helmet.
This IDE also allows the developers to create a nice graphic of the videogame without the need to use any further IDE.

The Emotiv software is essential to set the helmet while you're wearing it.
Furthermore the software allows us to set limit values to detect only real commands from player's mind, distinguish signals from background noise.
In case there are some issues with the signals, you can see a clear report of all brain activities detected by the helmet so that you can change the limit values or adjust the code on the basis of the bugs you have to solve.

When the player has hit every block on the top of the videogame, the match finishes and he sees a sign: "You won! Click to try again".
If the ball falls missing the paddle, the match finishes and the player sees another sign: "Game Over! Click to try again".
While someone's playing there's a bacground music that start again every time the match gets restarted.

Using the arrow keys on the keyboard you can set the speed of the ball while the match is going on.
