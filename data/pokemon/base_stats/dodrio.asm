if DEF(FAITHFUL)	
	db  60, 110,  70, 110,  60,  60 ; 470 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  70, 110,  80, 110,  60,  70 ; 500 BST
	;   hp  atk  def  spe  sat  sdf
endc

if DEF(FAITHFUL)
	db NORMAL, FLYING ; type
else
	db FLYING, GROUND ; type
endc
	db 45 ; catch rate
	db 158 ; base exp
	db NO_ITEM, SHARP_BEAK ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for DODRIO, RUN_AWAY, EARLY_BIRD, TANGLED_FEET
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, BULLDOZE, RETURN, DIG, DOUBLE_TEAM, SWIFT, AERIAL_ACE, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, ROOST, GIGA_IMPACT, SWORDS_DANCE, FLY, AGILITY, BATON_PASS, BODY_SLAM, DOUBLE_EDGE, ENDURE, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
