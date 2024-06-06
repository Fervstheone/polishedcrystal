if DEF(FAITHFUL)	
	db  35, 100,  60, 110,  50,  70 ; 425 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  60, 100,  90, 110,  50,  80 ; 490 BST
	;   hp  atk  def  spe  sat  sdf
endc
	db GROUND, STEEL ; type
	db 50 ; catch rate
	db 153 ; base exp
	db NO_ITEM, SOFT_SAND ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for DUGTRIO_ALOLAN, SAND_VEIL, TANGLING_HAIR, SAND_FORCE
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Spe

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HONE_CLAWS, HYPER_BEAM, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, ROCK_SMASH, DOUBLE_TEAM, FLASH_CANNON, SLUDGE_BOMB, SANDSTORM, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, SHADOW_CLAW, GIGA_IMPACT, STONE_EDGE, CUT, AGILITY, BODY_SLAM, CHARM, DOUBLE_EDGE, EARTH_POWER, ENDURE, HEADBUTT, IRON_HEAD, SLEEP_TALK, SUCKER_PUNCH, SWAGGER
	; end
