if DEF(FAITHFUL)	
	db  90,  85, 100,  85,  95, 125 ; 580 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  90,  85, 120,  95,  100, 150 ; 640 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp
	db ALWAYS_ITEM_2, LUM_BERRY ; held items
	dn GENDER_UNKNOWN, HATCH_UNKNOWN ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for ARTICUNO, PRESSURE, PRESSURE, SNOW_CLOAK
else
	abilities_for ARTICUNO, PRESSURE, SNOW_WARNING, SNOW_CLOAK
endc
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	ev_yield 3 SDf

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, ROCK_SMASH, DOUBLE_TEAM, REFLECT, SANDSTORM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, STEEL_WING, ROOST, WATER_PULSE, AVALANCHE, GIGA_IMPACT, U_TURN, FLY, AGILITY, DOUBLE_EDGE, ENDURE, ICY_WIND, SLEEP_TALK, SWAGGER
	; end
