if DEF(FAITHFUL)	
	db 115, 115,  85, 100,  90,  75 ; 580 BST
	;   hp  atk  def  spe  sat  sdf
else
	db 125, 135, 105, 100,  90,  85 ; 640 BST
	;   hp  atk  def  spe  sat  sdf
endc

if DEF(FAITHFUL)
	db FIRE, FIRE ; type
else
	db FIRE, GROUND ; type
endc
	db 3 ; catch rate
	db 217 ; base exp
	db ALWAYS_ITEM_2, CHARCOAL ; held items
	dn GENDER_UNKNOWN, HATCH_UNKNOWN ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for ENTEI, PRESSURE, PRESSURE, INNER_FOCUS
else
	abilities_for ENTEI, PRESSURE, INNER_FOCUS, FLASH_FIRE
endc
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 1 HP, 2 Atk

	; tm/hm learnset
	tmhm CURSE, CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, SOLAR_BEAM, IRON_TAIL, EARTHQUAKE, RETURN, DIG, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, REFLECT, FLAMETHROWER, SANDSTORM, FIRE_BLAST, SWIFT, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, WILL_O_WISP, GIGA_IMPACT, FLASH, STONE_EDGE, CUT, STRENGTH, AGILITY, BODY_SLAM, DOUBLE_EDGE, ENDURE, HEADBUTT, IRON_HEAD, SLEEP_TALK, SWAGGER
	; end
