	object_const_def ; object_event constants

OldCity_MapScripts:
	db 0

	db 0

OldCity_MapEvents:
	db 0, 0 ; filler

	db 2 ; warps
	warp_event 16, 33, SILENT_HILLS, 3
	warp_event 17, 33, SILENT_HILLS, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
