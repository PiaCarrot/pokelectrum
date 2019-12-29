	object_const_def ; object_event constants

SilentTown_MapScripts:
	db 0

	db 0

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 1 ; warps
	warp_event  5,  4, PLAYERS_HOUSE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
