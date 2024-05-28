if DEF(FAITHFUL)
	db  70, 110,  80, 105,  55,  80 ; 500 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  70, 110,  80, 125,  55,  80 ; 520 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_SLOW ; gender ratio, step cycles to hatch

	abilities_for SCYTHER, SWARM, TECHNICIAN, STEADFAST
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	ev_yield 1 Atk

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, RETURN, ROCK_SMASH, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, ROOST, FALSE_SWIPE, X_SCISSOR, GIGA_IMPACT, U_TURN, SWORDS_DANCE, CUT, FLY, AGILITY, BATON_PASS, COUNTER, DOUBLE_EDGE, ENDURE, HEADBUTT, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
