if DEF(FAITHFUL)
	db  70, 110, 100,  50,  50,  60 ; 440 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  80, 120, 120,  60,  50,  70 ; 500 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db STEEL, STEEL ; type
	db 90 ; catch rate
	db 148 ; base exp
	db NO_ITEM, NO_ITEM ; held items
	dn GENDER_F50, HATCH_MEDIUM_FAST ; gender ratio, step cycles to hatch

	abilities_for PERRSERKER, BATTLE_ARMOR, TOUGH_CLAWS, STEELY_SPIRIT
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 Atk

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HONE_CLAWS, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, DARK_PULSE, SHADOW_CLAW, GIGA_IMPACT, U_TURN, FLASH, GYRO_BALL, SWORDS_DANCE, CUT, BATON_PASS, BODY_SLAM, CHARM, DOUBLE_EDGE, ENDURE, HEADBUTT, HYPER_VOICE, IRON_HEAD, KNOCK_OFF, PAY_DAY, SEED_BOMB, SLEEP_TALK, SWAGGER, ZAP_CANNON
	; end
