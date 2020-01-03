	object_const_def ; object_event constants

SilentTown_MapScripts:
	db 0

	db 0
SilentTownSign:
	jumptext SilentTownSignText

SilentTownPlayersHouseSign:
	jumptext SilentTownPlayersHouseSignText

SilentTownLabSign:
	jumptext SilentTownLabSignText

SilentTownHouseSign:
	jumptext SilentTownHouseSignText
	
SilentTownSignText:
	text "Ever peaceful"
	line "SILENT HILL TOWN"
	done
	
SilentTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done
	
SilentTownLabSignText:
	text "HOUSE FOR RENT"
	done
	
SilentTownHouseSignText:
	text "<RIVAL>'s House"
	done
	
SilentTownPokecenterSign:
	jumpstd pokecentersign

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 1 ; warps
	warp_event  5,  4, PLAYERS_HOUSE_1F, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 16,  5, BGEVENT_READ, SilentTownSign
	bg_event  8,  4, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event 10, 11, BGEVENT_READ, SilentTownLabSign
	bg_event  6, 12, BGEVENT_READ, SilentTownHouseSign
	bg_event 14,  4, BGEVENT_READ, SilentTownPokecenterSign

	db 0 ; object events
