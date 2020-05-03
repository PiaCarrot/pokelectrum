newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup                                                      ;  1

	newgroup                                                      ;  2  7

	newgroup                                                      ;  3
	map_const SILENT_HILLS,  			                   25, 18 ; 15

	newgroup                                                      ;  4

	newgroup                                                      ;  5

	newgroup                                                      ;  6

	newgroup                                                      ;  7

	newgroup                                                      ;  8

	newgroup                                                      ;  9

	newgroup                                                      ; 10

	newgroup                                                      ; 11

	map_const ROUTE_34,                                    10, 27 ;  1
	map_const DAY_CARE,                                     5,  4 ; 24

	newgroup                                                      ; 12

	newgroup                                                      ; 13

	newgroup                                                      ; 14

	newgroup                                                      ; 15

	newgroup                                                      ; 16

	map_const INDIGO_PLATEAU_POKECENTER_1F,                 9,  7 ;  2
	map_const WILLS_ROOM,                                   5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const BRUNOS_ROOM,                                  5,  9 ;  5
	map_const KARENS_ROOM,                                  5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	newgroup                                                      ; 18

	newgroup                                                      ; 19

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4

	newgroup                                                      ; 21

	newgroup                                                      ; 22

	map_const BATTLE_TOWER_1F,                              8,  5 ; 11
	map_const BATTLE_TOWER_BATTLE_ROOM,                     4,  4 ; 12
	map_const BATTLE_TOWER_ELEVATOR,                        2,  2 ; 13
	map_const BATTLE_TOWER_HALLWAY,                        11,  2 ; 14
	map_const BATTLE_TOWER_OUTSIDE,                        10, 14 ; 16

	newgroup                                                      ; 23

	newgroup                                                      ; 24

	map_const NEW_BARK_TOWN,                               10,  9 ;  4
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                             4,  3 ;  7
	map_const SILENT_TOWN,								   10,  9
	map_const SILENT_FOREST,							   20, 18
	map_const ROUTE_01,									   25, 18

	newgroup                                                      ; 25

	newgroup                                                      ; 26
