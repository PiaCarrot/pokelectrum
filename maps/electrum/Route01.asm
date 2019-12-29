	object_const_def ; object_event constants

Route01_MapScripts:
	db 0

	db 0

Route01_MapEvents:
	db 0, 0 ; filler

	db 2 ; warps
	warp_event  8,  5, SILENT_HILLS, 1
	warp_event  9,  5, SILENT_HILLS, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
