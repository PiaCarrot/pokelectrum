ChrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MaleNames
	db 1 ; ????
	db 0 ; default option

.MaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
MalePlayerNameArray:
	db "GOLD@"
	db "ASH@"
	db "JACK@"
	db "ETHAN@"
	db 2 ; displacement
	db " NAME @" ; title

KrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .FemaleNames
	db 1 ; ????
	db 0 ; default option

.FemaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
FemalePlayerNameArray:
	db "GOLD@"
	db "ASHLEY@"
	db "JILL@"
	db "KRIS@"
	db 2 ; displacement
	db " NAME @" ; title
	
SilverNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .RivalNames
	db 1 ; ????
	db 0 ; default option

.RivalNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
RivalNameArray:
	db "SILVER@"
	db "GARY@"
	db "JOHN@"
	db "???@"
	db 2 ; displacement
	db " NAME @" ; title
	
MomsNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MomsNames
	db 1 ; ????
	db 0 ; default option

.MomsNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
MomsNameArray:
	db "MOM@"
	db "MAMA@"
	db "MOMMY@"
	db "MOTHER@"
	db 2 ; displacement
	db " NAME @" ; title
