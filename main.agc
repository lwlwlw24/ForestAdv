// Project: ForestAdv
// Created: 2018-05-14

#include "../Function Lib/CoreLibrary.agc"
#include "../Function Lib/HealthBar.agc"

//****** Data Types ******
type HumanType
	imgID as integer //Image used
	sprID as integer //Sprite ID
	health as float
	healthMax as float
	level as integer
	experience as float
	money as float
	offence as integer
	defence as integer	
	cards	as integer	
endtype

type AnimalType
	imgID as integer //Image used
	sprID as integer //Sprite ID
	name as string
	health as float
	healthMax as float
	experience as float
	money as float
	offence as integer
	defence as integer
endtype

type GameType
	animal as AnimalType
	human as HumanType
endtype

type ButtonType
	imgIDUnpressed as integer
	imgIDPressed as integer
	sprID as integer
endtype


global game as GameType
global dim animals[3] as AnimalType
global dim button[3] as ButtonType
global humanHealthBar as HealthBarType
global animalHealthBar as HealthBarType

global fontID as integer
//****** Named Constants ******
//debugging use
#constant DEBUGDELAY = 500

//games
#constant MONEYTARGET = 40

#constant LEVEL2THRESHOLD = 20 
#constant LEVEL3THRESHOLD = 40 

//UIs button index
#constant BUTTONID_FEED = 1
#constant BUTTONID_PET = 2
#constant BUTTONID_LEAVE = 3

//animal index
#constant INDEXPIG = 0
#constant INDEXWOLF = 1
#constant INDEXBEAR = 2

//***************************************
//*** Main program ***
//***************************************

InitialiseScreen(1024,768,"Forest Adventure", 0x28A1DE,%1111)

//***************************************
//uncommom the following code if you need a splash page

ShowSplashScreen("Wayne_Logo v2.png")
LoadResources()
HideSplashScreen(4)

//***************************************
//or just without a splash page
//LoadResources()

InitialiseGameVariables()
CreateInitialLayout()

startFromHome()


repeat
	meetAnimal()
	
	battle()
	
	//in = GetUserInput()
	//HandleUserInput(in)
	//HandleOther()
	//Sync()
until game.human.money >= MONEYTARGET

gameEnd()

end

//do
	//in = GetUserInput()
	//HandleUserInput(in)
	//HandleOther()
	//Sync()
//loop

//*** Main Program END



//***************************************
//*** Functions ***
//***************************************

function InitialiseGameVariables()
	//sample code
	//game.crabs_caught = 0
	//game.time_remaining = GAMETIME
	//ResetTimer()
	
	//test code
	//init human
	game.human.level = 1
	game.human.defence = 2
	game.human.offence = 3
	game.human.experience = 0
	game.human.money = 10
	game.human.healthMax = 10
	game.human.health = game.human.healthMax
	//test code end
	
	animals[INDEXPIG].defence = 1
	animals[INDEXPIG].offence = 1
	animals[INDEXPIG].experience = 10
	animals[INDEXPIG].health = 1
	animals[INDEXPIG].healthMax = animals[INDEXPIG].health
	animals[INDEXPIG].money = 3
	animals[INDEXPIG].name = "Pig"

	
	animals[INDEXWOLF].defence = 2
	animals[INDEXWOLF].offence = 2
	animals[INDEXWOLF].experience = 10
	animals[INDEXWOLF].health = 1
	animals[INDEXWOLF].healthMax = animals[INDEXWOLF].health
	animals[INDEXWOLF].money = 5
	animals[INDEXWOLF].name = "Wolf"

	
	animals[INDEXBEAR].defence = 3
	animals[INDEXBEAR].offence = 3
	animals[INDEXBEAR].experience = 10
	animals[INDEXBEAR].health = 6
	animals[INDEXBEAR].healthMax = animals[INDEXBEAR].health
	animals[INDEXBEAR].money = 6
	animals[INDEXBEAR].name = "Bear"
	

	
endfunction
	
	
function LoadResources()
	//sample code
	//game.crab.soundID = LoadSound("Scuttle.wav")

	animals[INDEXPIG].imgID = LoadImage("Pig.png")
	animals[INDEXWOLF].imgID = LoadImage("Wolf.png")
	animals[INDEXBEAR].imgID = LoadImage("Bear.png")
	
	button[BUTTONID_FEED].imgIDUnpressed = LoadImage("buttonFeed.png")
	button[BUTTONID_PET].imgIDUnpressed = LoadImage("buttonUsePet.png")
	button[BUTTONID_LEAVE].imgIDUnpressed = LoadImage("buttonLeave.png")
	
	humanHealthBar.imgBar = LoadImage("HealthBar.png")
	humanHealthBar.imgOverLay = LoadImage("HealthBarOverLay.png")
	
	animalHealthBar.imgBar = humanHealthBar.imgBar
	animalHealthBar.imgOverLay = humanHealthBar.imgOverLay
	
	fontID = LoadFont("font_GB2312.ttf")
	
endfunction

function CreateInitialLayout()
	//sample code
	
	//*** Position rock ***
	//game.rock.sprID = CreateSprite(game.rock.imgID)
	//SetSpriteSize(game.rock.sprID,15,-1)
	//SetSpritePosition(game.rock.sprID,40,45)
	
	//*** Set up time text ***
	//game.txtTime = CreateText("Time: "+Str(game.time_remaining))
	//SetTextColor(game.txtTime,0,0,0,255)
	//SetTextSize(game.txtTime,3.5)
	//SetTextPosition(game.txtTime,85,2)
	
endfunction

function GetUserInput()
	//sample code
	//result = 0
	//if GetPointerPressed() = 1
		//result = 1
	//elseif GetPointerReleased() = 1
		//result = 2
	//elseif GetPointerState() = 1
		//result = 3
	//endif
	
	result = 1
endfunction result

function HandleUserInput(in as integer)

endfunction

function HandleOther()
	//sample code
	//game.time_remaining = GAMETIME - Timer()
	//SetTextString(game.txtTime,"Time: "+Str(game.time_remaining))

endfunction

function startFromHome()
	Print("Start From Home")
	Sync()
	Sleep(DEBUGDELAY)
endfunction

function meetAnimal()
	Print("Meet Animals")
	//Sync()
	//Sleep(DEBUGDELAY)
	
	//genenrate a random animal according to user level
	if game.human.level = 1
		game.animal = animals[INDEXPIG]
	elseif game.human.level = 2
		game.animal = animals[Random(INDEXPIG, INDEXWOLF)]
	elseif game.human.level = 3
		game.animal = animals[Random(INDEXPIG, INDEXBEAR)]
	endif
	
	PrintC("You will meet ")
	Print(game.animal.name)
	Sync()
	Sleep(DEBUGDELAY)
	
	//assign the animal to game.animal
	//test code
	//init animal
	//game.animal.defence = 1
	//game.animal.offence = 1
	//game.animal.experience = 1
	//game.animal.health = 3
	//game.animal.name = "PIG"
	//game.animal.money = 1
	//test code end
	
	//** Init UI for animal
	
endfunction

function battle()
	Print("Battle Start")
	Sync()
	Sleep(DEBUGDELAY)
	
	combatResult as integer
	newBattleFlag as integer = 1
	
	//** battle main loop 
	//** test data
	//game.human.health = 0
	//game.animal.health = 10
	//game.human.money = 40
	//*** test data end

	repeat
		combatResult = combat(newBattleFlag)
		newBattleFlag = 0
		if combatResult = -1
			exit
		endif
		//** human lost all the health point
		if game.human.health <= 0	
			humanLose()
			restartFromHome()
			exit
		endif
	until game.animal.health <= 0
	
	if game.human.health > 0
		humanWin(combatResult)
	endif
	
endfunction

function combat(newBattle as integer)
	Print("combat")
	Sync()
	Sleep(DEBUGDELAY)
	
	if newBattle = 1
		//** Init UI for animal
		createCombatAnimal()
		//** Init UI for user input
		createCombatUserInput()
	endif
	
	//** Wait for user input
	buttonInput = getUserCombatInput()
	//Print(buttonInput)
	//Sync()
	//Sleep(DEBUGDELAY)
	//** Generate animal output by Random(1,2):1 for feed human, 2 for ready to eat
	//** then Calculate & update human and animal parameters
	
	sprAnimalText as integer
	sprHumanText as integer
	
	sprAnimalText = CreateText("动物准备")
	SetTextColor(sprAnimalText, 0x7f, 0x7f, 0x00, 0xEE)
	SetTextFont(sprAnimalText, fontID)
	SetTextAlignment(sprAnimalText, 1)
	SetTextPosition(sprAnimalText, 50, 45)
	
	sprHumanText = CreateText(" ")
	SetTextColor(sprHumanText, 0x7f, 0x7f, 0x3f, 0x7f)
	SetTextFont(sprHumanText, fontID)
	SetTextAlignment(sprHumanText, 1)
	SetTextPosition(sprHumanText, 50, 60)
	
	
	//animal going to feed human
	if Random(1,2) = 1
		Print("animal feed human")
		Sync()	
		SetTextString(sprAnimalText, "动物给你准备了食物")
		Sleep(DEBUGDELAY * 5)

		//** 
		select buttonInput
			case BUTTONID_FEED
				SetTextString(sprAnimalText, "动物吃了"+Str(game.human.offence)+"个食物")
				SetTextString(sprHumanText, "主角吃了"+Str(game.animal.offence)+"个食物")
				
				game.human.health = game.human.health - game.animal.offence
				game.animal.health = game.animal.health - game.human.offence
				
				PrintC("human health update ")
				Print(game.human.health)
				PrintC("animal health update ")
				Print(game.animal.health)
				Sync()
				Sleep(DEBUGDELAY * 5)
			endcase
			case BUTTONID_PET
				SetTextString(sprHumanText, "宠物来帮忙, 主角吃了"+Str(game.animal.offence - game.human.defence)+"个食物")
				
				game.human.health = game.human.health - (game.animal.offence - game.human.defence)
				PrintC("human health update ")
				Print(game.human.health)
				Sync()
				Sleep(DEBUGDELAY * 5)
			endcase
			case BUTTONID_LEAVE
				SetTextString(sprHumanText, "主角吃了"+Str(game.animal.offence)+"个食物")
				game.human.health = game.human.health - game.animal.offence
				PrintC("human health update ")
				Print(game.human.health)
				Sync()
				Sleep(DEBUGDELAY * 5)
			endcase
		endselect
	//anmial gets ready to eat
	else
		Print("animal ready to eat")
		Sync()	
		SetTextString(sprAnimalText, "动物准备好要吃了")	
		Sleep(DEBUGDELAY * 5)
		//** 
		select buttonInput
			case BUTTONID_FEED
				SetTextString(sprAnimalText, "动物吃了"+Str(game.human.offence - game.animal.defence)+"个食物")
				game.animal.health = game.animal.health - (game.human.offence - game.animal.defence)
				PrintC("animal health update ")
				Print(game.animal.health)
				Sync()
				Sleep(DEBUGDELAY * 5)
			endcase
			case BUTTONID_PET
				SetTextString(sprAnimalText, "准备好了，但是吃了空气")
				SetTextString(sprHumanText, "准备好了，但是吃了空气")
				Print("combat but nothing happen")
				Sync()
				Sleep(DEBUGDELAY * 5)
			endcase
			case BUTTONID_LEAVE
				SetTextString(sprHumanText, "主角离开了")
				PrintC("human will leave")
				Sync()
				Sleep(DEBUGDELAY * 5)
				exitfunction -1
			endcase
		endselect
	endif
	DeleteText(sprAnimalText)
	DeleteText(sprHumanText)
	UpdateCombatUserInput()
endfunction 1

function createCombatAnimal()
	game.animal.sprID = CreateSprite(game.animal.imgID)
	SetSpriteSize(game.animal.sprID, 50, -1)
	SetSpritePosition(game.animal.sprID, 25, 15)
	
	animalHealthBar.sizeX = 50
	animalHealthBar.sizeY = -1
	animalHealthBar.positionX = 25
	animalHealthBar.positionY = 5
	animalHealthBar.healthMax = game.animal.healthMax
	animalHealthBar.percentage = game.animal.health / game.animal.healthMax
	CreateHealthBar(animalHealthBar)
	
	
endfunction


function createCombatUserInput()

	button[BUTTONID_FEED].sprID = CreateSprite(button[BUTTONID_FEED].imgIDUnpressed)
	SetSpriteSize(button[BUTTONID_FEED].sprID, 10, -1)
	SetSpritePosition(button[BUTTONID_FEED].sprID, 25, 70)
	
	button[BUTTONID_PET].sprID = CreateSprite(button[BUTTONID_PET].imgIDUnpressed)
	SetSpriteSize(button[BUTTONID_PET].sprID, 10, -1)
	SetSpritePosition(button[BUTTONID_PET].sprID, 45, 70)
	
	button[BUTTONID_LEAVE].sprID = CreateSprite(button[BUTTONID_LEAVE].imgIDUnpressed)
	SetSpriteSize(button[BUTTONID_LEAVE].sprID, 10, -1)
	SetSpritePosition(button[BUTTONID_LEAVE].sprID, 65, 70)
	
	humanHealthBar.sizeX = 50
	humanHealthBar.sizeY = -1
	humanHealthBar.positionX = 25
	humanHealthBar.positionY = 85
	humanHealthBar.healthMax = game.human.healthMax
	humanHealthBar.percentage = game.human.health / game.human.healthMax
	CreateHealthBar(humanHealthBar)
	
endfunction

function UpdateCombatUserInput()
	if game.human.health > 0
		humanHealthBar.percentage = game.human.health / game.human.healthMax
	else
		humanHealthBar.percentage = 0
	endif
	UpdateHealthBar(humanHealthBar)
	if game.animal.health > 0
		animalHealthBar.percentage = game.animal.health / game.animal.healthMax
	else
		animalHealthBar.percentage = 0
	endif
	UpdateHealthBar(animalHealthBar)
	
endfunction

function getUserCombatInput()
	Print("getUserCombatInput")
	Sync()
	Sleep(DEBUGDELAY)
	sprHit as integer
	
	do
		Print("loopingUserCombatInput")
		Sync()
		if GetPointerPressed() = 1
			sprHit = GetSpriteHit(GetPointerX(), GetPointerY())
			select sprHit
				case button[BUTTONID_FEED].sprID
					Print("FEED")
					Sync()
					Sleep(DEBUGDELAY)
					exitfunction BUTTONID_FEED
				endcase
				case button[BUTTONID_PET].sprID
					Print("USE PET")
					Sync()
					Sleep(DEBUGDELAY)
					exitfunction BUTTONID_PET
				endcase
				case button[BUTTONID_LEAVE].sprID
					Print("Leave")
					Sync()
					Sleep(DEBUGDELAY)
					exitfunction BUTTONID_LEAVE
				endcase
			endselect
		endif
	loop
	Print("getUserCombatInput end")
	Sync()
	Sleep(DEBUGDELAY)
endfunction 0

function destoryCombatUserInput()
	DeleteSprite(game.animal.sprID)
	DeleteSprite(button[BUTTONID_FEED].sprID)
	DeleteSprite(button[BUTTONID_PET].sprID)
	DeleteSprite(button[BUTTONID_LEAVE].sprID)
	DestoryHealthBar(animalHealthBar)
endfunction

function humanLose()
	Print("Human Lose")
	Sync()
	Sleep(DEBUGDELAY)
endfunction

function restartFromHome()
	Print("Human Restart From Home")
	Sync()
	Sleep(DEBUGDELAY)
endfunction

function humanWin(in as integer)
	if in = 1
		Print("Human Win")
		game.human.experience = game.human.experience + game.animal.experience
		calculateHumanLevel()
		game.human.money = game.human.money + game.animal.money
	else
		Print("Human leave")
	endif
	
	destoryCombatUserInput()
	
	Sync()
	Sleep(DEBUGDELAY)
endfunction

function calculateHumanLevel()
	if game.human.experience <= LEVEL2THRESHOLD
		game.human.level = 1
	elseif game.human.experience <= LEVEL3THRESHOLD
		game.human.level = 2 
	else
		game.human.level = 3
	endif
	PrintC("Human level ")
	Print(game.human.level)
	Sync()
	Sleep(DEBUGDELAY)
endfunction

function gameEnd()
	Print("Found Mama")
	Sync()
	Sleep(DEBUGDELAY)
endfunction

