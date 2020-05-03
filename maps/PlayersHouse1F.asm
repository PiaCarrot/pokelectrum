	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	buttonsound
	getstring STRING_BUFFER_4, GearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

GearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	setflag ENGINE_POKEDEX
	givepoke RAIKOU, 10
	givepoke SUICUNE, 10
	givepoke ENTEI, 10
	givepoke FLAMBEAR, 10
	givepoke CHIKORITA, 10
	givepoke CRUZ, 10
	giveitem HONEY
	giveitem HEART_STONE
	giveitem POTION
	giveitem TM_DYNAMICPUNCH ; c2
	giveitem TM_HEADBUTT     ; c3
	giveitem TM_CURSE        ; c4
	giveitem TM_ROLLOUT      ; c5
	giveitem TM_ROAR         ; c6
	giveitem TM_TOXIC        ; c7
	giveitem TM_ZAP_CANNON   ; c8
	giveitem TM_ROCK_SMASH   ; c9
	giveitem TM_PSYCH_UP     ; ca
	giveitem TM_HIDDEN_POWER ; cb
	giveitem TM_SUNNY_DAY    ; cc
	giveitem TM_SWEET_SCENT  ; cd
	giveitem TM_SNORE        ; ce
	giveitem TM_BLIZZARD     ; cf
	giveitem TM_HYPER_BEAM   ; d0
	giveitem TM_ICY_WIND     ; d1
	giveitem TM_PROTECT      ; d2
	giveitem TM_RAIN_DANCE   ; d3
	giveitem TM_GIGA_DRAIN   ; d4
	giveitem TM_ENDURE       ; d5
	giveitem TM_FRUSTRATION  ; d6
	giveitem TM_SOLARBEAM    ; d7
	giveitem TM_IRON_TAIL    ; d8
	giveitem TM_DRAGONBREATH ; d9
	giveitem TM_THUNDER      ; da
	giveitem TM_EARTHQUAKE   ; db
	giveitem TM_RETURN       ; dc
	giveitem TM_DIG          ; dd
	giveitem TM_PSYCHIC_M    ; de
	giveitem TM_SHADOW_BALL  ; df
	giveitem TM_MUD_SLAP     ; e0
	giveitem TM_DOUBLE_TEAM  ; e1
	giveitem TM_ICE_PUNCH    ; e2
	giveitem TM_SWAGGER      ; e3
	giveitem TM_SLEEP_TALK   ; e4
	giveitem TM_SLUDGE_BOMB  ; e5
	giveitem TM_SANDSTORM    ; e6
	giveitem TM_FIRE_BLAST   ; e7
	giveitem TM_SWIFT        ; e8
	giveitem TM_DEFENSE_CURL ; e9
	giveitem TM_THUNDERPUNCH ; ea
	giveitem TM_DREAM_EATER  ; eb
	giveitem TM_DETECT       ; ec
	giveitem TM_REST         ; ed
	giveitem TM_ATTRACT      ; ee
	giveitem TM_THIEF        ; ef
	giveitem TM_STEEL_WING   ; f0
	giveitem TM_FIRE_PUNCH   ; f1
	giveitem TM_FURY_CUTTER  ; f2
	giveitem TM_NIGHTMARE    ; f3
	giveitem TM_MEGA_PUNCH
	giveitem TM_RAZOR_WIND
	giveitem TM_SWORDS_DANCE
	giveitem TM_WHIRLWIND
	giveitem TM_MEGA_KICK
	giveitem TM_HORN_DRILL
	giveitem TM_BODY_SLAM
	giveitem TM_TAKE_DOWN
	giveitem TM_DOUBLE_EDGE
	giveitem TM_BUBBLEBEAM
	giveitem TM_WATER_GUN
	giveitem TM_ICE_BEAM
	giveitem TM_PAY_DAY
	giveitem TM_SUBMISSION
	giveitem TM_COUNTER
	giveitem TM_SEISMIC_TOSS
	giveitem TM_RAGE
	giveitem TM_MEGA_DRAIN
	giveitem TM_DRAGON_RAGE
	giveitem TM_THUNDERBOLT
	giveitem TM_FISSURE
	giveitem TM_TELEPORT
	giveitem TM_MIMIC
	giveitem TM_REFLECT
	giveitem TM_BIDE
	giveitem TM_METRONOME
	giveitem TM_SELFDESTRUCT
	giveitem TM_EGG_BOMB
	giveitem TM_SKULL_BASH
	giveitem TM_SOFTBOILED
	giveitem TM_SKY_ATTACK
	giveitem TM_THUNDER_WAVE
	giveitem TM_PSYWAVE
	giveitem TM_EXPLOSION
	giveitem TM_ROCK_SLIDE
	giveitem TM_TRI_ATTACK
	giveitem TM_SUBSTITUTE
	giveitem TM_FLAMETHROWER
	giveitem HM_CUT
	giveitem HM_FLY
	giveitem HM_SURF
	giveitem HM_STRENGTH
	giveitem HM_FLASH
	giveitem HM_WHIRLPOOL
	giveitem HM_WATERFALL
	callasm CheatFillPokedex
;	writetext NeighborText
;	special NameMom
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end
	
CheatFillPokedex:
	ld a, 1
	ld [wFirstUnownSeen], a
	ld hl, wPokedexSeen
	call .Fill
	ld hl, wPokedexCaught
.Fill:
	ld a, %11111111
	ld bc, 36 ; 001-288
	call ByteFill
	ld a, %00000011
	ld [hl], a ; 289-290
	ret

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…! Our"
	line "neighbor, PROF."

	para "ELM, was looking"
	line "for you."

	para "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #MON"

	para "GEAR is back from"
	line "the repair shop."

	para "Here you go!"
	done

MomGivesPokegearText:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done

KnowTheInstructionsText:
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done

DontKnowTheInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

InstructionsNextText:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done

HurryUpElmIsWaitingText:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

SoWhatWasProfElmsErrandText:
	text "So, what was PROF."
	line "ELM's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting"
	line "<MOM>!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting"
	cont "<MOM>!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting"
	line "<MOM>!"
	done

NeighborText:
	text "What do you"
	line "call your mom?"
	done

StoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SILENT_TOWN, 1
	warp_event  7,  7, SILENT_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  8,  4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  4, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
