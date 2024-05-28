if DEF(FAITHFUL)
	db  70, 130,  95, 85,  45,  75 ; 500 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  70, 130, 115, 85,  45, 115 ; 560 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db BUG, ROCK ; type
	db 25 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for KLEAVOR, SWARM, SHEER_FORCE, SHARPNESS
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, RETURN, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ROCK_SLIDE, ROOST, FALSE_SWIPE, X_SCISSOR, GIGA_IMPACT, U_TURN, STONE_EDGE, SWORDS_DANCE, CUT, FLY, COUNTER, DOUBLE_EDGE, ENDURE, HEADBUTT, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
