#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "start.h"
#include "instructions.h"
#include "ocean.h"
#include "oceanfront.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "TitleSong.h"
#include "shellsound.h"
#include "sound.h"
#include "bump.h"
#include "wipe.h"

// Variables
int shellsCaught = 0;
int fishHit = 0;
int memoryDown = 6;
int cheat = 0;
int vOff = 0;
int hOff = 0;
int counter = 0;

// Game Structures
DORY dory;
SHELL shells[SHELLCOUNT];
FISH fish[FISHCOUNT];
MEMORY memory[MEMORYCOUNT];

// ShadowOAM Structure
OBJ_ATTR shadowOAM[128];

// Initializes games and sprites
void initGame() {

	// Loads spritesheet palette and tiles
	DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
   	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

   	// Initializes all sprites used in game
   	initMemory();
   	initDory();
   	initShells();
   	initFish();
}

// Draws sprites to screen display
void drawGame() {

	drawDory();

	for (int i = 0; i < SHELLCOUNT; i++) {
		drawShells(&shells[i], i + 30);
	}

	for (int i = 0; i < FISHCOUNT; i++){
		drawFish(&fish[i], i + 70);
	}

	for (int i = 0; i < MEMORYCOUNT; i++){
		drawMemory(&memory[i]);
	}

	shadowOAM[10].attr0 = 3 | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[10].attr1 = 5 | ATTR1_SMALL;
	shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 0);

	for (int i = 1; i < 6; i++) {
		shadowOAM[i * 10 + 1].attr0 = 3 | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[i* 10  + 1].attr1 = (5 * i * 3) | ATTR1_SMALL;
		shadowOAM[i* 10 + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, i);
	}
}

// Updates sprites on screen display
void updateGame() {

	updateDory();

	for (int i = 0; i < SHELLCOUNT; i++) {
		updateShells(&shells[i]); 
	}

	for (int i = 0; i < FISHCOUNT; i++){
		updateFish(&fish[i]);
	}

	for (int i = 0; i < MEMORYCOUNT; i++){
		updateMemory(&memory[i]);
	}

	if (BUTTON_PRESSED(BUTTON_B)) {
        
        for (int i = 0; i < MEMORYCOUNT; i++) {
        	memory[i].active = 0;
        }

        memoryDown = 100;

        playSoundB(wipe, WIPELEN, WIPEFREQ, 0);
    }
}

// Initializes memory sprites
void initMemory() {

	// Memory bar 1
	memory[0].row = 7;
	memory[0].col = 5;
	memory[0].height = 8;
	memory[0].width = 8;
	memory[0].active = 1;
	memory[0].index = 1;

	// Memory bar 2
	memory[1].row = 7;
	memory[1].col = 12;
	memory[1].height = 8;
	memory[1].width = 8;
	memory[1].active = 1;
	memory[1].index = 2;

	// Memory bar 3
	memory[2].row = 7;
	memory[2].col = 22;
	memory[2].height = 8;
	memory[2].width = 8;
	memory[2].active = 1;
	memory[2].index = 3;

	// Memory bar 4
	memory[3].row = 7;
	memory[3].col = 37;
	memory[3].height = 8;
	memory[3].width = 8;
	memory[3].active = 1;
	memory[3].index = 4;

	// Memory bar 5
	memory[4].row = 7;
	memory[4].col = 52;
	memory[4].height = 8;
	memory[4].width = 8;
	memory[4].active = 1;
	memory[4].index = 5;

	// Memory bar 6
	memory[5].row = 7;
	memory[5].col = 67;
	memory[5].height = 8;
	memory[5].width = 8;
	memory[5].active = 1;
	memory[5].index = 6;
}

// Draws memory sprites
void drawMemory(MEMORY* m, int index) {

	if (m->active) {

		// Retrieve memory sprite from spritesheet
		shadowOAM[m->index].attr0 = (m->row)| ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[m->index].attr1 = (m->col) | ATTR1_SMALL;
		shadowOAM[m->index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12,0);

	} else {

		// Hide sprite if memory bar reduced
		shadowOAM[m->index].attr0 = ATTR0_HIDE;
	}
}

// Updates memory sprites
void updateMemory() {

}

// Initialize dory sprite
void initDory() {

	dory.row = 70;
	dory.col = 40;
	dory.rdel = 2;
	dory.cdel = 2;
	dory.width = 8;
	dory.height = 8;
	dory.aniState = 0;
	dory.aniCounter = 0;
	dory.curFrames = 0;
	dory.numFrames = 3;

}

// Draw dory sprite
void drawDory() {

	// Retrieve dory sprite from spritesheet
	shadowOAM[0].attr0 = (0xFF & dory.row) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = (0x1FF & dory.col) | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 2 * dory.aniState);
}

// Update dory sprite
void updateDory() {

	// Up key movement
	if (BUTTON_HELD(BUTTON_UP)) {
		if (dory.row > 0) {
			dory.row--;
		}

	}

	// Down key movement
	if (BUTTON_HELD(BUTTON_DOWN)) {
		if (dory.row + dory.height < 160) {
			dory.row++;
		}
	}

	// Right key movement
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		if (dory.col >= 90) {
			hOff++;
			counter--;
		} else {
			dory.col++;
		}
	}

	// Left key movement
	if (BUTTON_HELD(BUTTON_LEFT)) {
		if (dory.col >= 3) {
			dory.col--;
		}
	}

	REG_BG1HOFF = hOff;
	REG_BG1VOFF = vOff;

	REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff / 2; 

    if (dory.aniCounter % 20 == 0) {
		dory.aniState++;
		if (dory.aniState == 0) {
			dory.aniState = 1;
		} else if (dory.aniState == 3) {
            dory.aniState = 0;
        }
	}

	dory.aniCounter++;
}

// Initialize shell sprites
void initShells() {

	for (int i = 0; i < SHELLCOUNT; i++) {

		shells[i].row = rand() % 240;
		shells[i].col = 240;
		shells[i].oldRow = shells[i].row;
		shells[i].oldCol = shells[i].col;
		shells[i].rdel = 2;
		shells[i].cdel = 1;
		shells[i].width = 13;
		shells[i].height = 13;
		shells[i].aniState = 0;
		shells[i].aniCounter = 0;
		shells[i].curFrames = 0;
		shells[i].numFrames = 2;
		shells[i].active = 1;
		shells[i].erased = 0;

		counter = shells[i].col;
	}
}

// Draw shell sprites
void drawShells(SHELL* s, int index) {

	if (s->active) {

		// Retrieve shell sprite from spritesheet
		shadowOAM[index].attr0 = s->row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[index].attr1 = s->col | ATTR1_SMALL;
		shadowOAM[index].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(8, 2 * s->aniState);

	} else {

		// Hide sprite
		shadowOAM[index].attr0 = ATTR0_HIDE;
	}
}

// Update shell sprite
void updateShells(SHELL* s) {

	if (s->active) {

		if (s->aniCounter % 5) {
				s->col -= s->cdel;
		}

		if(s->aniCounter % 21 == 0) {
			s->aniState++;
			if (s->aniState == 0) {
				s->aniState = 1;
			} else if (s->aniState == 7) {
	            s->aniState = 0;
	        }
		}

		s->col = counter;

		// In the case of a collision, collect the shell
		if (collision(dory.row, dory.col, dory.height, dory.width, s->row, s->col, s->height, s->width)) {
					if (memoryDown < 6) {
						memory[memoryDown].active = 1;
						memoryDown++;
					}

					s->active = 0;
					shellsCaught++;

					playSoundB(shellsound, SHELLSOUNDLEN, SHELLSOUNDFREQ, 0);
		}

		// Update positions of shells 
		if (s->col <= 0) {
			counter = 240;
			s->col = counter;
			s->row = rand() % 150;
		}
	}

	if (s->active == 0) {

		counter = 240;

		s->col = counter;
		s->row = rand() % 150;
		s->active = 1;
		s->erased = 1;

		if (s->col <= 0) {
			s->col = counter;
			s->row = rand() % 150;
		}
	}

	s->aniCounter++;
}

// Initialize fish sprite
void initFish() {

	for (int i = 0; i < FISHCOUNT; i++) {

		fish[i].row = rand() % 150;
		fish[i].col = rand() % 231;
		fish[i].oldRow = fish[i].row;
		fish[i].oldCol = fish[i].col;
		fish[i].rdel = 2;
		fish[i].cdel = 2;
		fish[i].width = 16;
		fish[i].height = 16;
		fish[i].aniState = 0;
		fish[i].aniCounter = 0;
		fish[i].curFrames = 0;
		fish[i].numFrames = 3;
		fish[i].active = 1;
		fish[i].erased = 0;
	}
}

// Draw fish sprite
void drawFish(FISH* f, int index) {

	if (f->active) {

		// Retrieve fish sprite from spritesheet
		shadowOAM[index].attr0 = f->row | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[index].attr1 = f->col | ATTR1_MEDIUM;
		shadowOAM[index].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4, 4 * f->aniState);

	} else {

		// Hide sprite 
		shadowOAM[index].attr0 = ATTR0_HIDE;
	}
}

// Update fish sprite
void updateFish(FISH* f) {

	if (f->active) {

		// Speed of the moving fish
		f->col -= f->cdel;

		if (f->aniCounter % 20 == 0) {
				f->aniState++;
				if (f->aniState == 0) {
					f->aniState = 1;
				} else if (f->aniState == 3) {
		            f->aniState = 0;
		        }
		}

		//In the case of a collision, memory meter reduces
		if (collision(dory.row, dory.col, dory.height, dory.width, f->row, f->col, f->height, f->width)) {

					memory[memoryDown - 1].active = 0;
					memoryDown--;

					f->erased = 0;
					f->active = 0;
					fishHit++;

					playSoundB(bump, BUMPLEN, BUMPFREQ, 0);
		}

		// Update positions of the moving fish
		if (f->col <= 0) {
			f->col = 240;
			f->row = rand() % 144;
		}

	} 

	if (f->active == 0) {

		f->col = 240;
		f->row = rand() % 144;

		if (f->col <= 0) {
			f->col = 240;
			f->row = rand() % 144;
		}

		f->active = 1;
		f->erased = 1;
	}

	f->aniCounter++;
}