if DEF(FAITHFUL)
	db  90, 100,  90,  90, 125,  85 ; 580 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  90, 100, 120,  95, 150,  85 ; 640 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp
	db ALWAYS_ITEM_2, LUM_BERRY ; held items
	dn GENDER_UNKNOWN, HATCH_UNKNOWN ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for MOLTRES, PRESSURE, PRESSURE, FLAME_BODY
else
	abilities_for MOLTRES, PRESSURE, DROUGHT, FLAME_BODY
endc
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 3 SAt

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, SOLAR_BEAM, RETURN, ROCK_SMASH, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, FLAME_CHARGE, REST, STEEL_WING, ROOST, WILL_O_WISP, GIGA_IMPACT, U_TURN, FLY, AGILITY, DOUBLE_EDGE, ENDURE, SLEEP_TALK, SWAGGER
	; end
