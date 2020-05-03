	object_const_def ; object_event constants

SilentHills_MapScripts:
	db 0

	db 0

SilentHills_MapEvents:
	db 0, 0 ; filler

	db 4 ; warps
	warp_event 42, 31, ROUTE_01, 1
	warp_event 43, 31, ROUTE_01, 2
	warp_event  4,  5, OLD_CITY, 1
	warp_event  5,  5, OLD_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
