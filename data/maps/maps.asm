map: MACRO
;\1: map name: for the MapAttributes pointer (see data/maps/attributes.asm)
;\2: tileset: a TILESET_* constant
;\3: environment: TOWN, ROUTE, INDOOR, CAVE, ENVIRONMENT_5, GATE, or DUNGEON
;\4: location: from constants/landmark_constants.asm
;\5: music: a MUSIC_* constant
;\6: phone service flag: TRUE to prevent phone calls
;\7: time of day: a PALETTE_* constant
;\8: fishing group: a FISHGROUP_* constant
	db BANK(\1_MapAttributes), \2, \3
	dw \1_MapAttributes
	db \4, \5
	dn \6, \7
	db \8
ENDM

MapGroupPointers::
; pointers to the first map of each map group
	dw MapGroup_Olivine     ;  1
	dw MapGroup_Mahogany    ;  2
	dw MapGroup_Dungeons    ;  3
	dw MapGroup_Ecruteak    ;  4
	dw MapGroup_Blackthorn  ;  5
	dw MapGroup_Cinnabar    ;  6
	dw MapGroup_Cerulean    ;  7
	dw MapGroup_Azalea      ;  8
	dw MapGroup_LakeOfRage  ;  9
	dw MapGroup_Violet      ; 10
	dw MapGroup_Goldenrod   ; 11
	dw MapGroup_Vermilion   ; 12
	dw MapGroup_Pallet      ; 13
	dw MapGroup_Pewter      ; 14
	dw MapGroup_FastShip    ; 15
	dw MapGroup_Indigo      ; 16
	dw MapGroup_Fuchsia     ; 17
	dw MapGroup_Lavender    ; 18
	dw MapGroup_Silver      ; 19
	dw MapGroup_CableClub   ; 20
	dw MapGroup_Celadon     ; 21
	dw MapGroup_Cianwood    ; 22
	dw MapGroup_Viridian    ; 23
	dw MapGroup_NewBark     ; 24
	dw MapGroup_Saffron     ; 25
	dw MapGroup_Cherrygrove ; 26

MapGroup_Olivine:

MapGroup_Mahogany:

MapGroup_Dungeons:
	map SilentHills, TILESET_FOREST, ROUTE, ILEX_FOREST, MUSIC_UNION_CAVE, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN

MapGroup_Ecruteak:

MapGroup_Blackthorn:

MapGroup_Cinnabar:

MapGroup_Cerulean:

MapGroup_Azalea:

MapGroup_LakeOfRage:

MapGroup_Violet:
	map OldCity, TILESET_JOHTO, TOWN, VIOLET_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_AUTO, FISHGROUP_POND

MapGroup_Goldenrod:
	map Route34, TILESET_JOHTO_MODERN, ROUTE, ROUTE_34, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map DayCare, TILESET_HOUSE, INDOOR, ROUTE_34, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_SHORE

MapGroup_Vermilion:

MapGroup_Pallet:

MapGroup_Pewter:

MapGroup_FastShip:

MapGroup_Indigo:
	map IndigoPlateauPokecenter1F, TILESET_POKECENTER, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map WillsRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map KogasRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map BrunosRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map KarensRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map LancesRoom, TILESET_CHAMPIONS_ROOM, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map HallOfFame, TILESET_ICE_PATH, INDOOR, INDIGO_PLATEAU, MUSIC_NEW_BARK_TOWN, TRUE, PALETTE_DAY, FISHGROUP_SHORE

MapGroup_Fuchsia:

MapGroup_Lavender:

MapGroup_Silver:

MapGroup_CableClub:
	map Pokecenter2F, TILESET_POKECENTER, INDOOR, SPECIAL_MAP, MUSIC_POKEMON_CENTER, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map TradeCenter, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map Colosseum, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map TimeCapsule, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_SHORE

MapGroup_Celadon:

MapGroup_Cianwood:
	map BattleTower1F, TILESET_BATTLE_TOWER, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_LOBBY, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map BattleTowerBattleRoom, TILESET_BATTLE_TOWER, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map BattleTowerElevator, TILESET_BATTLE_TOWER, INDOOR, BATTLE_TOWER, MUSIC_NONE, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map BattleTowerHallway, TILESET_BATTLE_TOWER, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map BattleTowerOutside, TILESET_BATTLE_TOWER_OUTSIDE, ROUTE, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, FALSE, PALETTE_AUTO, FISHGROUP_SHORE

MapGroup_Viridian:

MapGroup_NewBark:
	map NewBarkTown, TILESET_JOHTO, TOWN, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map PlayersHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map PlayersHouse2F, TILESET_PLAYERS_ROOM, INDOOR, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map SilentTown, TILESET_JOHTO, TOWN, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map SilentForest, TILESET_JOHTO, ROUTE, ROUTE_29, MUSIC_UNUSED_SONG, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map Route01, TILESET_JOHTO, ROUTE, ROUTE_29, MUSIC_ROUTE_29, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN

MapGroup_Saffron:


MapGroup_Cherrygrove: