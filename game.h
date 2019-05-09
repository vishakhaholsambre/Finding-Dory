// Memory Struct
typedef struct {
	int row;
	int col;
	int width;
	int height;
	int active;
	int erased;
	int index;

} MEMORY;

// Dory Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniState;
	int aniCounter;
	int curFrames;
	int numFrames;
} DORY;

// Shell Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int width;
	int height;
	int active;
	int erased;
	int aniState;
	int aniCounter;
	int curFrames;
	int numFrames;
} SHELL;

// Distractor Fish Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int erased;
	int aniState;
	int aniCounter;
	int curFrames;
	int numFrames;
} FISH;

// Prototypes
void initGame();
void drawGame();
void updateGame();

void initMemory();
void drawMemory();
void updateMemory();

void initDory();
void drawDory();
void updateDory();

void initShells();
void drawShells();
void updateShells();

void initShells();
void drawShells();
void updateShells();

// Definitions
#define SHELLCOUNT 1
#define FISHCOUNT 5
#define MEMORYCOUNT 6

// Variables
extern DORY dory;
extern SHELL shells[SHELLCOUNT];
extern FISH fish[FISHCOUNT];
extern MEMORY memory[MEMORYCOUNT];
extern int shellsCaught;
extern int fishHit;
extern int memoryUp;
extern int memoryDown;