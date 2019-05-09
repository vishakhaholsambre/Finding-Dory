/* 
Updated Gameplay

    Finished Features:

        At this point, all the game states with appropriate labels have been implemented, and the user can switch between
        all of these game states intuitively. In the game state, the Dory sprite can be moved in any direction around the screen 
        to collect the shell sprites. Additionally, the distractor fish sprites move across the screen to distract Dory. Shells 
        appear at random locations on the screen for Dory to collect. The memory meter keeps track of Dory's memory by reducing 
        when she collides with a distractor fish and increasing when she collects a shell. If the meter runs out, the user loses. 
        If the user collects all shells on the screen without the meter running out, the user wins. Also, "B" activates the cheat, 
        which removes the memory meter. At this point, the user only has to collect shells to win and colliding with distractor 
        fish does not penalize. In terms of design, aesthetic backgrounds, sprites, and sounds have been implemented. 

    Future Features:

        All features have been added.

    Bugs:

        The shell appearance rate is predictable. 

    Current Gamplay:

        Press "Start" to view the instructions and enter the game state. Use any of the arrow keys to move Dory in any direction.
        Collect tan shells and avoid bumping into red distractor fish. If you collect all shells without the memory meter 
        running out, you win! However, if the memory meter runs out and you are not able to collect enough shells before
        Dory forgets what she's doing, you lose. You may activate the cheat mode, which nulls out the memory meter. At that point,
        bumping into fish doesn't matter, and all you have to do is collect enough shells to get home. 
*/

#include <stdlib.h>
#include <stdio.h>
#include "game.h"
#include "myLib.h"
#include "spritesheet.h"
#include "start.h"
#include "instructions.h"
#include "ocean.h"
#include "oceanfront.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "sound.h"
#include "TitleSong.h"
#include "GameSong.h"
#include "shellsound.h"
#include "story1.h"
#include "bump.h"
#include "wipe.h"

// Prototypes
void initialize();
void initGame();
void updateGame();
void drawGame();

// State Prototypes
void start();
void goToStart();
void instructions();
void goToInstructions();
void game();
void goToGame();
void pause();
void goToPause();
void win();
void goToWin();
void lose();
void goToLose();

// States
enum {START, INSTRUCTIONS, STORY1, STORY2, STORY3, GAME, PAUSE, WIN, LOSE};
int state;
int scroll;

// ShadowOAM Structure
OBJ_ATTR shadowOAM[128];

// Variables
int shellsCaught;
int fishHit;
int memoryDown;
int cheat;

unsigned short buttons;
unsigned short oldButtons;
int vOff;
int hOff;

int main() {

    setupSounds();
    setupInterrupts();
	initialize();

	while(1) {
		
		oldButtons = buttons;
		buttons = BUTTONS;

		// Game states
		switch(state) {
        	case START:
        		start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case STORY1:
                game();
                break;
            case STORY2:
                game();
                break;
            case STORY3:
                game();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
            default:
                break;
        }
	}
}

// Initializes game upon launching
void initialize() {

    playSoundA(TitleSong, TITLESONGLEN, TITLESONGFREQ, 1);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

	// Define variables for later use
    vOff = 0;
    hOff = 0;
	shellsCaught = 0;
    fishHit = 0;
    memoryDown = 6;
    cheat = 0;
	buttons = BUTTONS;

    hideSprites();

	goToStart();
}

// Switches to start state of game
void goToStart() {

	// Loads start screen palette, tiles, and map
    DMANow(3, startPal, PALETTE, startPalLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[30], startMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

	state = START;

    REG_DISPCTL = MODE0 | BG0_ENABLE;
}

// Start state of game
void start() {

    hideSprites();

	// Initialize game with start button
	if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }

    waitForVBlank();
}

// Switches to instructions state of game
void goToInstructions() {

    // Loads instructions screen palette, tiles, and map
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[30], instructionsMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    state = INSTRUCTIONS;

    REG_DISPCTL = MODE0 | BG0_ENABLE;
}

// Instructions state of game
void instructions() {

    hideSprites();

    // Start game with Start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
}

// Switches to game state of game
void goToGame() {

    waitForVBlank();

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_DISPCTL |= MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);

    // Load game screen palette, tiles, and map
	DMANow(3, oceanPal, PALETTE, oceanPalLen / 2);
    DMANow(3, oceanTiles, &CHARBLOCK[1], oceanTilesLen / 2);
    DMANow(3, oceanMap, &SCREENBLOCK[28], oceanMapLen / 2);
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;


    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);

    DMANow(3, oceanfrontTiles, &CHARBLOCK[0], oceanfrontTilesLen / 2);
    DMANow(3, oceanfrontMap, &SCREENBLOCK[30], oceanfrontMapLen / 2);
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

	state = GAME;
}

// Game state of game
void game() {

	// Pauses with start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }

    // Wins when all shells caught
    if (shellsCaught == 15) {
    	goToWin();
    }

    // Loses when memory meter runs out
    if (memoryDown == 0) {
        goToLose();
    }

    updateGame();
    waitForVBlank();
    drawGame();
    
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Switches to pause state of game
void goToPause() {

    hOff = 0;
    REG_BG0HOFF = hOff;

	// Loads pause screen palette, tiles, and map
	DMANow(3, pausePal, PALETTE, 256);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[30], pauseMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

	state = PAUSE;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
}

// Pause state of game
void pause() {

	hideSprites();
	
	// Resume game with start button
	if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    } 

    // Loses with B button
    if (BUTTON_PRESSED(BUTTON_B)) {
        unpauseSound();
        initialize();
    }
}

// Switches to win state of game
void goToWin() {

    hOff = 0;
    REG_BG0HOFF = hOff;

	// Loads win screen palette, tiles, and map
    DMANow(3, winPal, PALETTE, 256);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[30], winMapLen/2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

	state = WIN;

    REG_DISPCTL = MODE0 | BG0_ENABLE;
}

// Win state of game
void win() {

	hideSprites();

	// Initialize game from beginning with start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        initialize();
    } 
}

// Switches to lose state of game
void goToLose() {

    hOff = 0;
    REG_BG0HOFF = hOff;

	// Loads lose screen palette, tiles, and map
    DMANow(3, losePal, PALETTE, 256);

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[30], loseMapLen/2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

	state = LOSE;

    REG_DISPCTL = MODE0 | BG0_ENABLE;
}

// Lose state of game
void lose() {

	hideSprites();

	// Initialize game from beginning with start button
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        initialize();
    }
}