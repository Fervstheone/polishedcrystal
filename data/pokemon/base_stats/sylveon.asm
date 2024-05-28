if DEF(FAITHFUL)
	db  95,  65,  65,  60, 110, 130 ; 525 BST
	;   hp  atk  def  spe  sat  sdf
else
	db  100,  65,  65,  60, 120, 150 ; 560 BST
	;   hp  atk  def  spe  sat  sdf
endc

	db FAIRY, FAIRY ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM, PINK_BOW ; held items
	dn GENDER_F12_5, HATCH_SLOWER ; gender ratio, step cycles to hatch

if DEF(FAITHFUL)
	abilities_for SYLVEON, CUTE_CHARM, CUTE_CHARM, PIXILATE
else
	abilities_for SYLVEON, CUTE_CHARM, SERENE_GRACE, PIXILATE
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield 2 SDf

	; tm/hm learnset
	tmhm CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, DAZZLINGLEAM, FLASH, CUT, DOUBLE_EDGE, ENDURE, HYPER_VOICE, PAY_DAY, SKILL_SWAP, SLEEP_TALK, SWAGGER
	; end
