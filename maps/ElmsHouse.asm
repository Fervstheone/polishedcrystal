ElmsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  4, NEW_BARK_TOWN, 5
	warp_event  7,  5, NEW_BARK_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, ElmsHouseFridgeText
	bg_event  6,  1, BGEVENT_JUMPTEXT, ElmsHousePCText
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsWifeText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsSonText, -1
	object_event  7,  7, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsHouseCuteGirlScript, -1
	
	object_const_def
	const ELMSHOUSE_CUTE_GIRL

ElmsHouseCuteGirlScript:
	faceplayer
	opentext
	checkevent EVENT_CUTE_INTRO
	iffalsefwd .CuteGirlIntro
	checkevent ENGINE_EARTHBADGE
	iftruefwd .ContinueCuteGirl
	writetext .NeedToGetBadgesText
	waitbutton
	closetext
	end

.CuteGirlIntro
	writetext .CuteGirlIntroText
	setevent EVENT_CUTE_INTRO
	waitbutton
	closetext
	end

.ContinueCuteGirl:
	writetext .CuteGirlBattleText
	yesorno
	iffalse_jumpopenedtext .DontNeedItText
	writetext .AcceptedText
	waitbutton
	closetext
	winlosstext .BeatenCuteGirlText, .HowDidYouLoseText
	setlasttalked ELMSHOUSE_CUTE_GIRL
	loadtrainer CUTE, 1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapafterbattle
	opentext
	writetext .CuteGirlAfterBattleText
	closetext
	end

.CuteGirlIntroText
	text "Hello!"
	
	para "I'm just a cute"
	line "little Girl!"

	para "Prof. Elm has"
	line "tasked me with"

	cont "helping trainers"
	cont "train faster."
	done

.NeedToGetBadgesText
	text "I'm sorry, but"
	line "you need"
	
	cont "to prove yourself"
	cont "first!"

	para "You need more"
	line "Badges!"
	done

.CuteGirlBattleText
	text "Would you like"
	line "some fairly"
	cont "easy experience"
	cont "points and money?"
	done

.DontNeedItText
	text "Wow! You must be"
	line "really sure of"
	cont "yourself!"
	done
	
.AcceptedText
	text "OK! Easy Battle"
	line "Start Now!"
	done

.BeatenCuteGirlText
	text "You won!"
	line "Congratulations!"
	done

.HowDidYouLoseText
	text "Oh? I'm not quite"
	line "sure how you lost,"
	cont "but you can always"
	cont "try again!"
	done

.CuteGirlAfterBattleText
	text "Feel free to"
	line "battle again at"
	cont "any time!"
	
	para "Thank you for"
	line "using Cute Girl"
	cont "Exp. Services!"
	done


ElmsWifeText:
	text "Hi, <PLAYER>! My"
	line "husband's always"

	para "so busy--I hope"
	line "he's OK."

	para "When he's caught"
	line "up in his #mon"

	para "research, he even"
	line "forgets to eat."
	done

ElmsSonText:
	text "When I grow up,"
	line "I'm going to help"
	cont "my dad!"

	para "I'm going to be a"
	line "great #mon"
	cont "professor!"
	done

ElmsHouseFridgeText:
	text "There's some food"
	line "here. This must be"
	cont "for #mon."
	done

ElmsHousePCText:
	text "#mon. Where do"
	line "they come from?"

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#mon's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #mon!"

	para "…"

	para "It's a part of"
	line "Prof.Elm's re-"
	cont "search papers."
	done
