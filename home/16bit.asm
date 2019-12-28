GetPokemonIndexFromID::
	; in: a = 8-bit index
	; out: hl = 16-bit index; a clobbered
	ld h, a
	ldh a, [hROMBank]
	push af
	ld a, BANK(_GetPokemonIndexFromID)
	rst Bankswitch
	ld a, h
	call _GetPokemonIndexFromID
	pop af
	rst Bankswitch
	ret

GetPokemonIDFromIndex::
	; in: hl = 16-bit index
	; out: a = 8-bit index, hl clobbered
	ldh a, [hROMBank]
	push af
	ld a, BANK(_GetPokemonIDFromIndex)
	rst Bankswitch
	call _GetPokemonIDFromIndex
	ld l, a
	pop af
	rst Bankswitch
	ld a, l
	ret

LockPokemonID::
	; in: a = 8-bit index or zero (to clear), l = position
	; out: a = unchanged, hl = clobbered, carry = set if error
	ld h, a
	ldh a, [hROMBank]
	push af
	ld a, BANK(_LockPokemonID)
	rst Bankswitch
	call _LockPokemonID
	pop hl
	ld l, a
	ld a, h
	rst Bankswitch
	ld a, l
	ret

GetLockedPokemonID::
	; in: a = position
	; out: a = 8-bit index; everything else preserved
	push hl
	add a, LOW(wPokemonIndexTableLockedEntries)
	ld l, a
	ldh a, [rSVBK]
	ld h, a
	ld a, BANK(wPokemonIndexTableLockedEntries)
	ldh [rSVBK], a
	ld a, h
	ld h, HIGH(wPokemonIndexTableLockedEntries)
	ld l, [hl]
	ldh [rSVBK], a
	ld a, l
	pop hl
	ret
