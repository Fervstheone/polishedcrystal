INCLUDE "includes.asm"
INCLUDE "macros/wram.asm"
INCLUDE "vram.asm"


SECTION "Stack", WRAM0

wRAM0Start::
wStackBottom::
	ds $100 - 1
wStack::
wStackTop::
	ds 1


SECTION "Audio RAM", WRAM0

wMusic::
wMusicPlaying:: ds 1 ; nonzero if playing

wChannels::
wChannel1:: channel_struct wChannel1
wChannel2:: channel_struct wChannel2
wChannel3:: channel_struct wChannel3
wChannel4:: channel_struct wChannel4

wSFXChannels::
wChannel5:: channel_struct wChannel5
wChannel6:: channel_struct wChannel6
wChannel7:: channel_struct wChannel7
wChannel8:: channel_struct wChannel8

	ds 1 ; unused

wCurTrackDuty:: ds 1
wCurTrackIntensity:: ds 1
wCurTrackFrequency:: ds 2
	ds 1 ; BCD value, dummied out
wCurNoteDuration:: ds 1 ; used in MusicE0 and LoadNote

wCurMusicByte:: ds 1
wCurChannel:: ds 1
wVolume::
; corresponds to rNR50
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	ds 1
wSoundOutput::
; corresponds to rNR51
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	ds 1
wSoundInput::
; corresponds to rNR52
; bit 7: global on/off
; bit 0: ch1 on/off
; bit 1: ch2 on/off
; bit 2: ch3 on/off
; bit 3: ch4 on/off
	ds 1

wMusicID::
wMusicIDLo:: ds 1
wMusicIDHi:: ds 1
wMusicBank:: ds 1
wNoiseSampleAddress::
wNoiseSampleAddressLo:: ds 1
wNoiseSampleAddressHi:: ds 1
wNoiseSampleDelay:: ds 1 ; noise delay?
	ds 1
wMusicNoiseSampleSet:: ds 1
wSFXNoiseSampleSet:: ds 1
wLowHealthAlarm::
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	ds 1
wMusicFade::
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	ds 1
wMusicFadeCount:: ds 1
wMusicFadeID::
wMusicFadeIDLo:: ds 1
wMusicFadeIDHi:: ds 1
	ds 5
wCryPitch:: ds 2
wCryLength:: ds 2
wLastVolume:: ds 1
	ds 1
wSFXPriority:: ds 1 ; if nonzero, turn off music when playing sfx
	ds 1
wChannel1JumpCondition:: ds 1
wChannel2JumpCondition:: ds 1
wChannel3JumpCondition:: ds 1
wChannel4JumpCondition:: ds 1
wStereoPanningMask:: ds 1
wCryTracks::
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	ds 1
wSFXDuration:: ds 1
wCurSFX:: ds 1 ; id of sfx currently playing
wChannelsEnd::

wMapMusic:: ds 1
wDontPlayMapMusicOnReload:: ds 1
wMusicEnd::


SECTION "WRAM 0", WRAM0

wLZAddress:: ds 2
wLZBank:: ds 1

	ds 1

wBoxAlignment:: ds 1
wInputType:: ds 1
wAutoInputAddress:: ds 2
wAutoInputBank:: ds 1
wAutoInputLength:: ds 1

wMonStatusFlags:: ds 1
wGameLogicPaused:: ds 1
wSpriteUpdatesEnabled:: ds 1
	ds 1
wMapTimeOfDay:: ds 1
	ds 3
wPrinterConnectionOpen:: ds 1
wPrinterOpcode:: ds 1
wLastDexEntry:: ds 1

	ds 1

wPreviousLandmark:: ds 1
wCurrentLandmark:: ds 1
wLandmarkSignTimer:: ds 2
wLinkMode::
; 0 not in link battle
; 1 link battle
; 4 mobile battle
	ds 1

wScriptVar:: ds 1

wPlayerNextMovement:: ds 1
wPlayerMovement:: ds 1
	ds 2
wMovementPerson:: ds 1
wMovementDataPointer:: ds 3 ; dba
	ds 4
wMovementByteWasControlSwitch:: ds 1
wMovementPointer:: ds 2
	ds 3

wTempObjectCopyMapObjectIndex:: ds 1
wTempObjectCopySprite:: ds 1
wTempObjectCopySpriteVTile:: ds 1
wTempObjectCopyPalette:: ds 1
wTempObjectCopyMovement:: ds 1
wTempObjectCopyRange:: ds 1
wTempObjectCopyX:: ds 1
wTempObjectCopyY:: ds 1
wTempObjectCopyRadius:: ds 1

	ds 1

wTileDown:: ds 1
wTileUp:: ds 1
wTileLeft:: ds 1
wTileRight:: ds 1

wTilePermissions::
; set if tile behavior prevents
; you from walking in that direction
; bit 3: down
; bit 2: up
; bit 1: left
; bit 0: right
	ds 1

	ds 1


SECTION "Sprite Animations", WRAM0

; wSpriteAnimDict is a 10x2 dictionary.
; keys: taken from third column of SpriteAnimSeqData
; values: VTiles
wSpriteAnimDict:: ds 10 * 2

wSpriteAnimationStructs::
; Field  0: Index
; Fields 1-3: Loaded from SpriteAnimSeqData
wSpriteAnim1::  sprite_anim_struct wSpriteAnim1
wSpriteAnim2::  sprite_anim_struct wSpriteAnim2
wSpriteAnim3::  sprite_anim_struct wSpriteAnim3
wSpriteAnim4::  sprite_anim_struct wSpriteAnim4
wSpriteAnim5::  sprite_anim_struct wSpriteAnim5
wSpriteAnim6::  sprite_anim_struct wSpriteAnim6
wSpriteAnim7::  sprite_anim_struct wSpriteAnim7
wSpriteAnim8::  sprite_anim_struct wSpriteAnim8
wSpriteAnim9::  sprite_anim_struct wSpriteAnim9
wSpriteAnim10:: sprite_anim_struct wSpriteAnim10
wSpriteAnimationStructsEnd::

wSpriteAnimCount:: ds 1
wCurrSpriteOAMAddr:: ds 1

wCurIcon:: ds 1


wCurIconTile:: ds 1
wSpriteAnimAddrBackup::
wSpriteAnimIDBuffer::
wCurrSpriteAddSubFlags::
	ds 2
wCurrAnimVTile:: ds 1
wCurrAnimXCoord:: ds 1
wCurrAnimYCoord:: ds 1
wCurrAnimXOffset:: ds 1
wCurrAnimYOffset:: ds 1
wGlobalAnimYOffset:: ds 1
wGlobalAnimXOffset:: ds 1
wSpriteAnimsEnd::


SECTION "Music Player RAM", WRAM0

wMusicPlayerWRAM::
wSongSelection:: ds 2
wNumNoteLines:: ds 1
wTmpCh:: ds 1
wChLastNotes:: ds 3
wVolTimer:: ds 1
wC1Vol:: ds 1
wC1VolSub:: ds 1
wC2Vol:: ds 1
wC2VolSub:: ds 1
wC3Vol:: ds 1
wC3VolSub:: ds 1
wC4Vol:: ds 1
wC4VolSub:: ds 1
wNoteEnded:: ds 3
wSongInfoSwitch:: ds 1
;wRenderedWaveform:: ds 1
wPitchesTmp:: ds 4
;wWaveformTmp:: ds 16
wTmpValue:: ds 1
; song list
wSelectorTop:: ds 1
wSelectorCur:: ds 1
; song editor
wChannelSelector:: ds 1
wAdjustingTempo:: ds 1
; audio engine input
wChannelSelectorSwitches:: ds 4
wPitchTransposition:: ds 1
wTempoAdjustment:: ds 1
; audio engine output
wNoiseHit:: ds 1
wMusicPlayerWRAMEnd::


SECTION "Sprites", WRAM0

wSprites::
; 4 bytes per sprite
; 40 sprites
; struct:
;	y (px)
;	x (px)
;	tile id
;	attributes:
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds 4 * 40
wSpritesEnd::


SECTION "Tilemap", WRAM0

wTileMap:: ds SCREEN_WIDTH * SCREEN_HEIGHT ; 20x18 grid of 8x8 tiles
wTileMapEnd::


SECTION "Battle", WRAM0

UNION
; miscellaneous
wMisc:: ds (SCREEN_WIDTH + 4) * (SCREEN_HEIGHT + 2)
wMiscEnd::

NEXTU
; odd egg
wOddEgg:: party_struct wOddEgg
wOddEggName:: ds PKMN_NAME_LENGTH
wOddEggOTName:: ds PKMN_NAME_LENGTH

NEXTU
; battle tower temp struct
wBT_OTTemp:: battle_tower_struct wBT_OTTemp

NEXTU
; hall of fame temp struct
	hall_of_fame wHallOfFameTemp

NEXTU
; timeset temp storage
wTimesetBuffer:: ds 20
wInitHourBuffer:: ds 13
wInitMinuteBuffer:: ds 17

NEXTU
; link engine
wLinkMisc:: ds 10
wLinkPlayerFixedPartyMon1ID:: ds 3
	ds 37

NEXTU
; battle
	ds 1
NEXTU

wBattle::
wEnemyMoveStruct::  move_struct wEnemyMoveStruct
wPlayerMoveStruct:: move_struct wPlayerMoveStruct

wEnemyMonNick:: ds PKMN_NAME_LENGTH
wBattleMonNick:: ds PKMN_NAME_LENGTH

wBattleMon:: battle_struct wBattleMon

	ds 2

wWildMon:: ds 1
	ds 1
wEnemyTrainerItem1:: ds 1
wEnemyTrainerItem2:: ds 1
wEnemyTrainerBaseReward:: ds 1
wEnemyTrainerAIFlags:: ds 3
wOTClassName:: ds TRAINER_CLASS_NAME_LENGTH

wCurOTMon:: ds 1

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	ds 1

wTypeModifier::
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	ds 1

wCriticalHit::
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	ds 1

wAttackMissed::
; nonzero for a miss
	ds 1

wBattleSubStatusWRAM::
wPlayerSubStatus1::
; bit
; 7 attract
; 6 encore
; 5 endure
; 4 perish song
; 3 identified
; 2 protect
; 1 curse
; 0 unburden
	ds 1
wPlayerSubStatus2::
; bit
; 7 cant run
; 6 destiny bond
; 5 lock-on
; 4 encore
; 3 transformed
; 2
; 1
; 0 toxic
	ds 1
wPlayerSubStatus3::
; bit
; 7 confused
; 6 flying
; 5 underground
; 4 charged
; 3 flinch
; 2
; 1 rollout
; 0 bide
	ds 1
wPlayerSubStatus4::
; bit
; 7 leech seed
; 6 rage
; 5 recharge
; 4 substitute
; 3
; 2 focus energy
; 1 mist
; 0 curled
	ds 1

wEnemySubStatus1::
; see wPlayerSubStatus1
	ds 1
wEnemySubStatus2::
; see wPlayerSubStatus2
	ds 1
wEnemySubStatus3::
; see wPlayerSubStatus3
	ds 1
wEnemySubStatus4::
; see wPlayerSubStatus4
	ds 1

wPlayerAbility:: ds 1
wPlayerRolloutCount:: ds 1
wPlayerConfuseCount:: ds 1
wPlayerToxicCount:: ds 1
wPlayerDisableCount:: ds 1
wPlayerEncoreCount:: ds 1
wPlayerPerishCount:: ds 1
wPlayerProtectCount:: ds 1
	ds 1

wEnemyAbility:: ds 1
wEnemyRolloutCount:: ds 1
wEnemyConfuseCount:: ds 1
wEnemyToxicCount:: ds 1
wEnemyDisableCount:: ds 1
wEnemyEncoreCount:: ds 1
wEnemyPerishCount:: ds 1
wEnemyProtectCount:: ds 1
	ds 1
wBattleSubStatusWRAMEnd::

wPlayerDamageTaken:: ds 2
wEnemyDamageTaken:: ds 2

wBattleReward:: ds 3
wBattleAnimParam::
wKickCounter:: ds 1

wPartyBackupItems::
; Back up of party items before a battle. Modified in-battle for consumed/harvested.
; Berries and items stolen from wild Pokémon since those changes are retained.
	ds PARTY_LENGTH

wPartyUsedItems::
; For the benefit of Pickup/Harvest
	ds PARTY_LENGTH

wOTPartyUsedItems::
; See PartyUsedItems
	ds PARTY_LENGTH

; What move was selected last.
; Used for Choice locking and the Metronome item
wPlayerSelectedMove:: ds 1
wEnemySelectedMove:: ds 1

; How much the Metronome item is boosted. (Counts even if you don't have the item.)
wPlayerMetronomeCount:: ds 1
wEnemyMetronomeCount:: ds 1

; Stores enemy struct data temporarily when checking non-current mons
wAITempAbility:: ds 1
wAITempItem:: ds 1

wEnemyBackupSpecies:: ds 1

	ds 15

wBattleScriptBufferLoc:: ds 2

wTurnEnded:: ds 1

	ds 13

wPlayerStatLevels::
; 07 neutral
wPlayerAtkLevel:: ds 1
wPlayerDefLevel:: ds 1
wPlayerSpdLevel:: ds 1
wPlayerSAtkLevel:: ds 1

UNION
; battle subsection
wPlayerSDefLevel:: ds 1
wPlayerAccLevel:: ds 1
wPlayerEvaLevel:: ds 1
	ds 1

wEnemyStatLevels::
; 07 neutral
wEnemyAtkLevel:: ds 1
wEnemyDefLevel:: ds 1
wEnemySpdLevel:: ds 1
wEnemySAtkLevel:: ds 1
wEnemySDefLevel:: ds 1
wEnemyAccLevel:: ds 1
wEnemyEvaLevel:: ds 1
	ds 1

wEnemyTurnsTaken:: ds 1
wPlayerTurnsTaken:: ds 1

wPlayerSubstituteHP:: ds 2
wEnemySubstituteHP:: ds 2

	ds 1

wCurPlayerMove:: ds 1
wCurEnemyMove:: ds 1

wLinkBattleRNCount:: ds 1 ; how far through the prng stream

wEnemyItemState:: ds 1

	ds 2

wCurEnemyMoveNum:: ds 1

wEnemyHPAtTimeOfPlayerSwitch:: ds 2
wPayDayMoney:: ds 3

wSafariMonAngerCount:: ds 1
wSafariMonEating:: ds 1

	ds 1

; used when enemy is transformed
wEnemyBackupDVs:: ds 3
wEnemyBackupPersonality:: ; assumed to be after DVs
wEnemyBackupShiny::
wEnemyBackupAbility::
wEnemyBackupNature::
	ds 1
wEnemyBackupGender::
wEnemyBackupFainted::
wEnemyBackupForm::
	ds 1

wAlreadyDisobeyed:: ds 1

wDisabledMove:: ds 1
wEnemyDisabledMove:: ds 1

wWhichMonFaintedFirst:: ds 1

; exists so you can't counter on switch
wLastEnemyCounterMove:: ds 1
wLastPlayerCounterMove:: ds 1

wEnemyMinimized:: ds 1

wAlreadyFailed:: ds 1

wBattleParticipantsIncludingFainted:: ds 1

wBattleLowHealthAlarm:: ds 1

wPlayerMinimized:: ds 1

wPlayerScreens::
; bit
; 4 reflect
; 3 light screen
; 2 safeguard
; 0 spikes
	ds 1

wEnemyScreens::
; see wPlayerScreens
	ds 1

wPlayerSafeguardCount:: ds 1
wPlayerLightScreenCount:: ds 1
wPlayerReflectCount:: ds 1
	ds 1

wEnemySafeguardCount:: ds 1
wEnemyLightScreenCount:: ds 1
wEnemyReflectCount:: ds 1
	ds 1
wWeather::
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	ds 1

wWeatherCount:: ds 1 ; # turns remaining

wLoweredStat:: ds 1
wEffectFailed:: ds 1
wFailedMessage:: ds 1

wEnemyGoesFirst:: ds 1

wPlayerIsSwitching:: ds 1
wEnemyIsSwitching::  ds 1

wPlayerUsedMoves::
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: ds 1
wEnemySwitchMonParam:: ds 1
wEnemySwitchMonIndex:: ds 1

wTempLevel:: ds 1

wLastPlayerMon:: ds 1

wLastPlayerMove:: ds 1
wLastEnemyMove:: ds 1

	ds 9

wPlayerFutureSightCount:: ds 1
wEnemyFutureSightCount:: ds 1
wPlayerFutureSightDamage:: ds 2
wEnemyFutureSightDamage:: ds 2
wPlayerTrappingMove:: ds 1
wEnemyTrappingMove:: ds 1
wPlayerWrapCount:: ds 1
wEnemyWrapCount:: ds 1
wPlayerCharging:: ds 1
wEnemyCharging:: ds 1

wGivingExperienceToExpShareHolders:: ds 1

wAnimationsDisabled:: ds 1 ; used to temporarily disable animations for abilities

wBattleEnded:: ds 1

wWildMonMoves:: ds NUM_MOVES
wWildMonPP:: ds NUM_MOVES

wAmuletCoin:: ds 1

wSomeoneIsRampaging:: ds 1

wPlayerJustGotFrozen:: ds 1
wEnemyJustGotFrozen:: ds 1

wDVAndPersonalityBuffer:: ds 5
wBattleEnd::

NEXTU
; trade
wTrademons::
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon:: trademon wOTTrademon
wTrademonsEnd::
wTradeAnimPointer:: ds 2
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: ds 1
wLinkTradeGetmonSpecies:: ds 1

NEXTU
; naming screen
wNamingScreenDestinationPointer:: ds 2
wNamingScreenCurrNameLength:: ds 1
wNamingScreenMaxNameLength:: ds 1
wNamingScreenType:: ds 1
wNamingScreenCursorObjectPointer:: ds 2
wNamingScreenLastCharacter:: ds 1
wNamingScreenStringEntryCoord:: ds 2

NEXTU
; pokegear
wPokegearPhoneLoadNameBuffer:: ds 1
wPokegearPhoneCursorPosition:: ds 1
wPokegearPhoneScrollPosition:: ds 1
wPokegearPhoneSelectedPerson:: ds 1
wPokegearPhoneSubmenuCursor:: ds 1
wPokegearMapCursorObjectPointer:: ds 2
wPokegearMapCursorLandmark:: ds 1
wPokegearMapPlayerIconLandmark:: ds 1
wPokegearRadioChannelBank:: ds 1
wPokegearRadioChannelAddr:: ds 2
wPokegearRadioMusicPlaying:: ds 1
wPokegearNumberBuffer:: ds 1

NEXTU
; slot machine
wSlots::
wReel1:: slot_reel wReel1
wReel2:: slot_reel wReel2
wReel3:: slot_reel wReel3
wReel1Stopped:: ds 3
wReel2Stopped:: ds 3
wReel3Stopped:: ds 3
wSlotBias:: ds 1
wSlotBet:: ds 1
wFirstTwoReelsMatching:: ds 1
wFirstTwoReelsMatchingSevens:: ds 1
wSlotMatched:: ds 1
wCurrReelStopped:: ds 3
wPayout:: ds 2
wCurrReelXCoord:: ds 1
wCurrReelYCoord:: ds 1
	ds 2
wSlotBuildingMatch:: ds 1
wSlotsDataEnd::
	ds 28
wSlotsEnd::

NEXTU
; card flip
wCardFlip::
wDeck:: ds 24
wDeckEnd::
wCardFlipNumCardsPlayed:: ds 1
wCardFlipFaceUpCard:: ds 1
wDiscardPile:: ds 24
wDiscardPileEnd::
wCardFlipEnd::

;NEXTU
;; dummy game
;wDummyGame::
;wDummyGameCards:: ds 9 * 5
;wDummyGameCardsEnd::
;wDummyGameLastCardPicked:: ds 1
;wDummyGameCard1:: ds 1
;wDummyGameCard2:: ds 1
;wDummyGameCard1Location:: ds 1
;wDummyGameCard2Location:: ds 1
;wDummyGameNumberTriesRemaining:: ds 1
;wDummyGameLastMatches:: ds 5
;wDummyGameCounter:: ds 1
;wDummyGameNumCardsMatched:: ds 1
;wDummyGameEnd::

NEXTU
; Unown puzzle
wUnownPuzzle::
wPuzzlePieces:: ds 6 * 6
wUnownPuzzleEnd::

NEXTU
; Pokedex
wPokedexDataStart::
wPokedexOrder:: ds NUM_POKEMON +- 1
wPokedexOrderEnd:: ds 6
wPokedexMetadata::
wDexListingScrollOffset:: ds 1 ; offset of the first displayed entry from the start
wDexListingCursor:: ds 1 ; Dex cursor
wDexListingEnd:: ds 1 ; Last mon to display
wDexListingHeight:: ds 1 ; number of entries displayed at once in the dex listing
wCurrentDexMode:: ds 1 ; Pokedex Mode
wDexSearchMonType1:: ds 1 ; first type to search
wDexSearchMonType2:: ds 1 ; second type to search
wDexSearchResultCount:: ds 1
wDexArrowCursorPosIndex:: ds 1
wDexArrowCursorDelayCounter:: ds 1
wDexArrowCursorBlinkCounter:: ds 1
wDexSearchSlowpokeFrame:: ds 1
wUnlockedUnownMode:: ds 1
wDexCurrentUnownIndex:: ds 1
wDexUnownCount:: ds 1
wDexConvertedMonType:: ds 1 ; mon type converted from dex search mon type
wDexListingScrollOffsetBackup:: ds 1
wDexListingCursorBackup:: ds 1
wBackupDexListingCursor:: ds 1
wBackupDexListingPage:: ds 1
wDexCurrentLocation:: ds 1
wPokedexStatus:: ds 1
wDexMonShiny:: ds 1
wPokedexDataEnd::

ENDU

ENDU

SECTION "Overworld Map", WRAM0

UNION
; overworld map
wOverworldMap:: ds 1300
wOverworldMapEnd::

NEXTU
; credits image
wCreditsFaux2bpp:: ds 8 * 8 * 2

NEXTU
; Bill's PC
wBillsPCPokemonList::
; Pokemon, box number, list index
	ds 811
wBillsPC_ScrollPosition:: ds 1
wBillsPC_CursorPosition:: ds 1
wBillsPC_NumMonsInBox:: ds 1
wBillsPC_NumMonsOnScreen:: ds 1
wBillsPC_LoadedBox:: ds 1 ; 0 if party, 1 - 14 if box, 15 if active box
wBillsPC_BackupScrollPosition:: ds 1
wBillsPC_BackupCursorPosition:: ds 1
wBillsPC_BackupLoadedBox:: ds 1
wBillsPC_MonHasMail:: ds 1

NEXTU
; link data
wLinkData::
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: ds 1
wLinkPartySpecies:: ds PARTY_LENGTH + 1 ; legacy scripts don't check PartyCount

wLinkPlayerData::
wLinkPlayerPartyMon1:: party_struct wLinkPlayerPartyMon1
wLinkPlayerPartyMon2:: party_struct wLinkPlayerPartyMon2
wLinkPlayerPartyMon3:: party_struct wLinkPlayerPartyMon3
wLinkPlayerPartyMon4:: party_struct wLinkPlayerPartyMon4
wLinkPlayerPartyMon5:: party_struct wLinkPlayerPartyMon5
wLinkPlayerPartyMon6:: party_struct wLinkPlayerPartyMon6
wLinkPlayerPartyMonOTNames:: ds PARTY_LENGTH * NAME_LENGTH
wLinkPlayerPartyMonNicks:: ds PARTY_LENGTH * PKMN_NAME_LENGTH
wLinkPlayerDataEnd::
	ds 861
wLinkDataEnd::

NEXTU
; more link data
; TODO: replace with meaningful labels
	ds 271
wc90f:: ds 229
wc9f4:: ds 5
wc9f9:: ds 145
wHandshakeFrameDelay:: ds 53
wcabf:: ds 79
wcb0e:: ds 5
wcb13:: ds 113
wcb84:: ds 102
	ds 96
wcc4a:: ds 84
wcc9e:: ds 130

ENDU


SECTION "Video", WRAM0

UNION
; video
wBGMapBuffer:: ds 40
wBGMapPalBuffer:: ds 40
wBGMapBufferPtrs:: ds 40 ; 20 bg map addresses (16x8 tiles)
NEXTU
; credits
wCreditsPos:: ds 2
wCreditsTimer:: ds 1
ENDU

wSGBPredef:: ds 1
wPlayerHPPal:: ds 1
wEnemyHPPal:: ds 1

wHPPals:: ds PARTY_LENGTH
wCurHPPal:: ds 1
	ds 7
wSGBPals:: ds 48

wAttrMap::
; 20x18 grid of palettes for 8x8 tiles
; read horizontally from the top row
; bit 7: priority
; bit 6: y flip
; bit 5: x flip
; bit 4: pal # (non-cgb)
; bit 3: vram bank (cgb only)
; bit 2-0: pal # (cgb only)
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wAttrMapEnd::

wTileAnimBuffer:: ds 16

; addresses dealing with serial comms
wOtherPlayerLinkMode:: ds 1
wOtherPlayerLinkAction:: ds 4
wPlayerLinkAction:: ds 1
wcf57:: ds 4 ; TODO: replace with meaningful label
wLinkTimeoutFrames:: ds 2
wcf5d:: ds 2 ; TODO: replace with meaningful label

wMonType:: ds 1

wCurSpecies::
wCurMove::
wCreditsSpawn::
	ds 1

wNamedObjectTypeBuffer:: ds 1
wCurrentOptionsPage:: ds 1

wJumptableIndex::
wBattleTowerBattleEnded::
	ds 1

UNION
; intro and title data
wIntroSceneFrameCounter:: ds 1
wTitleScreenTimerLo:: ds 1
wTitleScreenTimerHi:: ds 1

NEXTU
; credits data
wCreditsBorderFrame:: ds 1
wCreditsBorderMon:: ds 1
wCreditsLYOverride:: ds 1

NEXTU
; unown puzzle data
wHoldingUnownPuzzlePiece:: ds 1
wUnownPuzzleCursorPosition:: ds 1
wUnownPuzzleHeldPiece:: ds 1

NEXTU
; card flip data
wCardFlipCursorY:: ds 1
wCardFlipCursorX:: ds 1
wCardFlipWhichCard:: ds 1

NEXTU
; miscellaneous
wDexEntryPrevJumptableIndex::
wMomBankDigitCursorPosition::
wNrOfBeatenBattleTowerTrainers::
	ds 1
wCurrPocket:: ds 1

NEXTU
; unidentified
wcf64:: ds 1 ; TODO: replace with meaningful labels
wcf65:: ds 1 ; TODO: replace with meaningful labels
wcf66:: ds 1 ; TODO: replace with meaningful labels

ENDU

	ds 10 ; unused

wWindowStackPointer:: ds 2
wMenuJoypad:: ds 1
wMenuSelection:: ds 1
wMenuSelectionQuantity:: ds 1
wWhichIndexSet:: ds 1
wScrollingMenuCursorPosition:: ds 1
wWindowStackSize:: ds 9

; menu data header
wMenuDataHeader::
wMenuFlags:: ds 1
wMenuBorderTopCoord:: ds 1
wMenuBorderLeftCoord:: ds 1
wMenuBorderBottomCoord:: ds 1
wMenuBorderRightCoord:: ds 1
wMenuData2Pointer:: ds 2
wMenuCursorBuffer:: ds 2
; end menu data header
wMenuDataBank:: ds 1 ; menu data bank?
	ds 6
wMenuDataHeaderEnd::

wMenuData2::
wMenuData2Flags::
; bit 7: When set, start printing text one tile to the right of the border
;        In scrolling menus, SELECT is functional
; bit 6: When set, start printing text one tile below the border
;        In scrolling menus, START is functional
; bit 5: ????
; bit 4: ????
; bit 3: ????
; bit 2: ????
; bit 1: Enable Select button
; bit 0: Disable B button
	ds 1
wMenuData2_ScrollingMenuHeight::
wMenuData2Items::
	ds 1
wMenuData2IndicesPointer::
wMenuData2Spacing::
wMenuData2_ScrollingMenuWidth::
	ds 1
wMenuData2_2DMenuItemStringsBank::
wMenuData2_ScrollingMenuSpacing::
	ds 1
wMenuData2_2DMenuItemStringsAddr::
wMenuData2DisplayFunctionPointer::
wMenuData2_ItemsPointerBank::
	ds 1
wMenuData2_ItemsPointerAddr::
	ds 1
wMenuData2PointerTableAddr::
wMenuData2_2DMenuFunctionBank::
	ds 1
wMenuData2_2DMenuFunctionAddr::
wMenuData2_ScrollingMenuFunction1::
	ds 3
wMenuData2_ScrollingMenuFunction2::
	ds 3
wMenuData2_ScrollingMenuFunction3::
	ds 3
wMenuData2End::

wMenuData3::
w2DMenuCursorInitY:: ds 1
w2DMenuCursorInitX:: ds 1
w2DMenuNumRows:: ds 1
w2DMenuNumCols:: ds 1
w2DMenuFlags1:: ds 1
w2DMenuFlags2:: ds 1
w2DMenuCursorOffsets:: ds 1
wMenuJoypadFilter:: ds 1
wMenuData3End::

wMenuCursorY:: ds 1
wMenuCursorX:: ds 1
wCursorOffCharacter:: ds 1
wCursorCurrentTile:: ds 2

wTrainerCardBadgePaletteAddr:: ds 2

wBTTempOTSprite:: ds 1

wOverworldDelay:: ds 1
wTextDelayFrames:: ds 1
wVBlankOccurred:: ds 1

	ds 8 ; unused

wGameTimerPause::
; bit 0
	ds 1

InputFlags::
; bits 7, 6, and 4 can be used to disable joypad input
	ds 2

wInBattleTowerBattle:: ds 1

	ds 1

wFXAnimID::
wFXAnimIDLo:: ds 1
wFXAnimIDHi:: ds 1

wPlaceBallsX:: ds 1
wPlaceBallsY:: ds 1

wTileAnimationTimer:: ds 1

; palette backups?
wBGP:: ds 1
wOBP0:: ds 1
wOBP1:: ds 1

wNumHits:: ds 2

wOptions1::
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle scene off/on
; bit 7: unused
	ds 1

wSaveFileExists:: ds 1

wTextBoxFrame::
; bits 0-3: textbox frame 0-8
	ds 1

wTextBoxFlags:: ds 1

	ds 1

wOptions2::
; bit 0-2: typeface
; bit 3: running shoes off/on
; bit 4: clock format 12/24-hour
; bit 5: pokédex units imperial/metric
; bit 6: battle style set/switch
; bit 7: battle style set/predict
; (bits 6 and 7 are never both set)
	ds 1

wInitialOptions::
; bit 0: natures off/on
; bit 1: abilities off/on
; bit 2: color variation off/on
; bit 3: perfect IVs off/on
; bit 4: traded behavior off/on
; bit 5: nuzlocke mode off/on
; bit 6: unused
; bit 7: ask to reset at start
	ds 1

wOptionsBuffer:: ds 1
wOptionsEnd::

; Time buffer, for counting the amount of time since an event began
wSecondsSince:: ds 1
wMinutesSince:: ds 1
wHoursSince:: ds 1
wDaysSince:: ds 1


SECTION "WRAM 1", WRAMX

wRAM0End::
wRAM1Start:: ds 1

wDefaultSpawnpoint:: ds 1

UNION
; mon buffer
wBufferMonNick:: ds PKMN_NAME_LENGTH
wBufferMonOT:: ds NAME_LENGTH
wBufferMon:: party_struct wBufferMon
	ds 8
wMonOrItemNameBuffer:: ds NAME_LENGTH

NEXTU
; mail temp storage
wTempMail:: mailmsg wTempMail

NEXTU
; bug-catching contest
wBugContestResults::
	bugcontestwinner wBugContestFirstPlace
	bugcontestwinner wBugContestSecondPlace
	bugcontestwinner wBugContestThirdPlace
wBugContestWinnersEnd::
	bugcontestwinner wBugContestTemp
	ds 4
wBugContestWinnerName:: ds NAME_LENGTH

NEXTU
; mart items
wMartItem1BCD:: ds 3
wMartItem2BCD:: ds 3
wMartItem3BCD:: ds 3
wMartItem4BCD:: ds 3
wMartItem5BCD:: ds 3
wMartItem6BCD:: ds 3
wMartItem7BCD:: ds 3
wMartItem8BCD:: ds 3
wMartItem9BCD:: ds 3
wMartItem10BCD:: ds 3
wMartItem11BCD:: ds 3
wMartItem12BCD:: ds 3
wMartItemBCDEnd::

NEXTU
; phone call data
wPhoneScriptBank:: ds 1
wPhoneCallerLo:: ds 1
wPhoneCallerHi:: ds 1

NEXTU
; radio data
wCurrentRadioLine:: ds 1
wNextRadioLine:: ds 1
wRadioTextDelay:: ds 1
wNumRadioLinesPrinted:: ds 1
wOaksPkmnTalkSegmentCounter:: ds 1
	ds 5
wRadioText:: ds 2 * SCREEN_WIDTH
wRadioTextEnd::

NEXTU
; trainer HUD data
	ds 1
wPlaceBallsDirection:: ds 1
wTrainerHUDTiles:: ds 1

NEXTU
; movement buffer data
wMovementBufferCount:: ds 1
wMovementBufferPerson:: ds 1
	ds 3
wMovementBuffer:: ds 55

NEXTU
; other buffers
wEarthquakeMovementDataBuffer::
wLuckyNumberDigitsBuffer:: ds 5

NEXTU
; unidentified
wd002:: ds 1 ; TODO: replace with meaningful labels
wd003:: ds 1 ; TODO: replace with meaningful labels
wd004:: ds 1 ; TODO: replace with meaningful labels

NEXTU
; miscellaneous
wTempDayOfWeek::
wApricorns:: ds 1
	ds 2

wStartFlypoint:: ds 1
wEndFlypoint:: ds 1

	ds 55

UNION
; engine buffers
wEngineBuffer1:: ds 1
wEngineBuffer2:: ds 1
wEngineBuffer3:: ds 1
wEngineBuffer4:: ds 1
wEngineBuffer5:: ds 1

NEXTU
; menu items list
wMenuItemsList:: ds 16
wMenuItemsListEnd::

NEXTU
; temporary script buffers
wTemporaryScriptBuffer:: ds 1
wJumpStdScriptBuffer:: ds 15

NEXTU
; item ball data
wCurItemBallContents:: ds 1
wCurItemBallQuantity:: ds 1

NEXTU
; fruit tree data
wCurFruitTree:: ds 1
	ds 1
wCurFruit:: ds 1

NEXTU
; elevator data
wElevatorPointerBank:: ds 1
wElevatorPointerLo:: ds 1
wElevatorPointerHi:: ds 1
wElevatorOriginFloor:: ds 1

NEXTU
; coord event data
wCurCoordEventTriggerID:: ds 1
wCurCoordEventMapY:: ds 1
wCurCoordEventMapX:: ds 1
wCurCoordEventScriptAddr:: ds 2

NEXTU
; signpost data
wCurSignpostYCoord:: ds 1
wCurSignpostXCoord:: ds 1
wCurSignpostType:: ds 1
wCurSignpostScriptAddr:: ds 1

NEXTU
; trainer data
	ds 3
wTempTrainerHeader::
wTempTrainerEventFlagLo:: ds 1
wTempTrainerEventFlagHi:: ds 1
wTempTrainerClass:: ds 1
wTempTrainerID:: ds 1
wSeenTextPointer:: ds 2
wWinTextPointer:: ds 2
wGenericTempTrainerHeaderEnd::
wLossTextPointer:: ds 2
wScriptAfterPointer:: ds 2
wRunningTrainerBattleScript:: ds 1
wTempTrainerHeaderEnd::
	ds 1
wStashedTextPointer:: ds 2

NEXTU
; mart data
	ds 1
wMartPointerBank:: ds 1
wMartPointer:: ds 2
	ds 1
wBargainShopFlags:: ds 1

NEXTU
; player movement data
wCurInput:: ds 1
	ds 3
wMovementAnimation:: ds 1
wWalkingDirection:: ds 1
wFacingDirection:: ds 1
wWalkingX:: ds 1
wWalkingY:: ds 1
wWalkingTile:: ds 1
	ds 6
wPlayerTurningDirection:: ds 1

NEXTU
; backup menu data
	ds 7
wMenuCursorBufferBackup:: ds 1
wMenuScrollPositionBackup:: ds 1

NEXTU
; phone script pointer
	ds 10
wPhoneScriptPointer:: ds 2

ENDU

ENDU

	ds 12 ; unused

wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH

wStringBuffer1::
	ds 24
wStringBuffer2::
	ds 19
wStringBuffer3::
	ds 19
wStringBuffer4::
	ds 19
wStringBuffer5::
	ds 19

wBattleMenuCursorBuffer:: ds 2

wCurBattleMon:: ds 1
wCurMoveNum:: ds 1

	ds 1 ; unused

wPCItemsCursor:: ds 1
wPartyMenuCursor:: ds 1
wItemsPocketCursor:: ds 1
wMedicinePocketCursor:: ds 1
wBallsPocketCursor:: ds 1
wTMHMPocketCursor:: ds 1
wBerriesPocketCursor:: ds 1
wKeyItemsPocketCursor:: ds 1

wPCItemsScrollPosition:: ds 1
wPartyMenuScrollPosition:: ds 1 ; unused
wItemsPocketScrollPosition:: ds 1
wMedicinePocketScrollPosition:: ds 1
wBallsPocketScrollPosition:: ds 1
wTMHMPocketScrollPosition:: ds 1
wBerriesPocketScrollPosition:: ds 1
wKeyItemsPocketScrollPosition:: ds 1

wMoveSwapBuffer::
wSwitchMon::
wSwitchItem:: ds 1

wMenuScrollPosition:: ds 4
wQueuedScriptBank:: ds 1
wQueuedScriptAddr:: ds 2
wNumMoves:: ds 1

wBattlePlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wFieldMoveSucceeded::
wItemEffectSucceeded::
wSolvedUnownPuzzle::
	ds 1

wVramState::
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	ds 1

wBattleResult:: ds 1
wUsingItemWithSelect:: ds 1

UNION
; mart data
wCurMart:: ds 16
wCurMartEnd::
NEXTU
; miscellaneous
wInverseBattleScore::
wCurElevator:: ds 1
wCurElevatorFloors::
wCurMessageIndex:: ds 1
wMailboxCount:: ds 1
wMailboxItems:: ds MAILBOX_CAPACITY
wMailboxEnd:: ds 1
ENDU

	ds 6 ; unused

wCurTMHM::
wCurItem::
	ds 1
wMartItemID::
wCurItemQuantity::
	ds 1
wCurPartySpecies::
	ds 1
wCurPartyMon::
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	ds 1
wWhichHPBar::
; 0: Enemy
; 1: Player
; 2: Party Menu
	ds 1
wPokemonWithdrawDepositParameter::
; 0: Take from PC
; 1: Put into PC
; 2: Take from Daycare
; 3: Put into Daycare
	ds 1
wIsCurMonInParty::
wItemQuantityChangeBuffer::
	ds 1
wItemQuantityBuffer::
	ds 1

;TempMPWaveform::
wTempMon::
	party_struct wTempMon

wSpriteFlags:: ds 1

wHandlePlayerStep:: ds 2

wPartyMenuActionText:: ds 1

wItemAttributeParamBuffer:: ds 1

wCurPartyLevel:: ds 1

wScrollingMenuListSize:: ds 2

; used when following a map warp
wNextWarp:: ds 1
wNextMapGroup:: ds 1
wNextMapNumber:: ds 1
wPrevWarp:: ds 1
wPrevMapGroup:: ds 1
wPrevMapNumber:: ds 1

wPlayerBGMapOffsetX:: ds 1 ; used in FollowNotExact; unit is pixels
wPlayerBGMapOffsetY:: ds 1 ; used in FollowNotExact; unit is pixels

; Player movement
wPlayerStepVectorX:: ds 1
wPlayerStepVectorY:: ds 1
wPlayerStepFlags:: ds 1
; bit 7: Start step
; bit 6: Stop step
; bit 5: Doing step
; bit 4: In midair
; bits 0-3: unused
wPlayerStepDirection:: ds 1

wSpinning:: ds 1

wBGMapAnchor:: ds 2

wUsedSprites:: ds 32 * 2 ; sprite ID, start tile
wUsedSpritesEnd::

wOverworldMapAnchor:: ds 2
wMetatileStandingY:: ds 1
wMetatileStandingX:: ds 1
wSecondMapHeaderBank:: ds 1
wTileset:: ds 1
wPermission:: ds 1
wSecondMapHeaderAddr:: ds 2

; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
wMapHeader::
wMapBorderBlock:: ds 1
wMapHeight:: ds 1
wMapWidth:: ds 1
wMapBlockDataBank:: ds 1
wMapBlockDataPointer:: ds 2
wMapScriptHeaderBank:: ds 1
wMapScriptHeaderPointer:: ds 2
wMapEventHeaderPointer:: ds 2
wMapConnections:: ds 1 ; bit set

wNorthMapConnection::
wNorthConnectedMapGroup:: ds 1
wNorthConnectedMapNumber:: ds 1
wNorthConnectionStripPointer:: ds 2
wNorthConnectionStripLocation:: ds 2
wNorthConnectionStripLength:: ds 1
wNorthConnectedMapWidth:: ds 1
wNorthConnectionStripYOffset:: ds 1
wNorthConnectionStripXOffset:: ds 1
wNorthConnectionWindow:: ds 2

wSouthMapConnection::
wSouthConnectedMapGroup:: ds 1
wSouthConnectedMapNumber:: ds 1
wSouthConnectionStripPointer:: ds 2
wSouthConnectionStripLocation:: ds 2
wSouthConnectionStripLength:: ds 1
wSouthConnectedMapWidth:: ds 1
wSouthConnectionStripYOffset:: ds 1
wSouthConnectionStripXOffset:: ds 1
wSouthConnectionWindow:: ds 2

wWestMapConnection::
wWestConnectedMapGroup:: ds 1
wWestConnectedMapNumber:: ds 1
wWestConnectionStripPointer:: ds 2
wWestConnectionStripLocation:: ds 2
wWestConnectionStripLength:: ds 1
wWestConnectedMapWidth:: ds 1
wWestConnectionStripYOffset:: ds 1
wWestConnectionStripXOffset:: ds 1
wWestConnectionWindow:: ds 2

wEastMapConnection::
wEastConnectedMapGroup:: ds 1
wEastConnectedMapNumber:: ds 1
wEastConnectionStripPointer:: ds 2
wEastConnectionStripLocation:: ds 2
wEastConnectionStripLength:: ds 1
wEastConnectedMapWidth:: ds 1
wEastConnectionStripYOffset:: ds 1
wEastConnectionStripXOffset:: ds 1
wEastConnectionWindow:: ds 2

wTilesetHeader::
wTilesetBank:: ds 1
wTilesetAddress:: ds 2
wTilesetBlocksBank:: ds 1
wTilesetBlocksAddress:: ds 2
wTilesetCollisionBank:: ds 1
wTilesetCollisionAddress:: ds 2
wTilesetAnim:: ds 2 ; bank 3f
wTilesetPalettes:: ds 2 ; bank 3f

wEvolvableFlags:: flag_array PARTY_LENGTH

wForceEvolution:: ds 1

UNION
; general-purpose buffers
wBuffer1:: ds 1
wBuffer2:: ds 1
wBuffer3:: ds 1
wBuffer4:: ds 1
wBuffer5:: ds 1
wBuffer6:: ds 1

NEXTU
; HP bar animations
wCurHPAnimMaxHP:: ds 2
wCurHPAnimOldHP:: ds 2
wCurHPAnimNewHP:: ds 2
wCurHPAnimPal:: ds 1
wCurHPBarPixels:: ds 1
wNewHPBarPixels:: ds 1
wCurHPAnimDeltaHP:: ds 2
wCurHPAnimLowHP:: ds 1
wCurHPAnimHighHP:: ds 1

NEXTU
; evolution data
wEvolutionOldSpecies:: ds 1
wEvolutionNewSpecies:: ds 1
wEvolutionPicOffset:: ds 1
wEvolutionCanceled:: ds 1

NEXTU
; Magikarp length
wMagikarpLengthMm::
wMagikarpLengthMmHi:: ds 1
wMagikarpLengthMmLo:: ds 1

NEXTU
; link data
	ds 9
wLinkBuffer:: ds 4
wLinkBattleRNs:: ds 10
wLinkBattleEarlyEnd:: ds 2
wLinkBufferEnd::

NEXTU
; battle data
	ds 7
wCurEnemyItem:: ds 1
	ds 15
wTempEnemyMonSpecies:: ds 1
wTempBattleMonSpecies:: ds 1

ENDU

wEnemyMon:: battle_struct wEnemyMon
wEnemyMonBaseStats:: ds 5
wEnemyMonCatchRate:: ds 1
wEnemyMonBaseExp:: ds 1
wEnemyMonEnd::

wBattleMode::
; 0: overworld
; 1: wild battle
; 2: trainer battle
	ds 1

wTempWildMonSpecies:: ds 1

wOtherTrainerClass::
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	ds 1

wBattleType::
; $00 normal
; $01 can lose
; $02 tutorial
; $03 fishing
; $04 headbutt/rock smash
; $05 roaming
; $06 contest
; $07 ghost
; $08 inverse
; $09 shiny
; $0a force Item1
; $0b trap
; $0c legendary
	ds 1

wOtherTrainerID:: ds 1

wForcedSwitch:: ds 1

wTrainerClass:: ds 1

wMonVariant:: ds 1

wMoveSelectionMenuType:: ds 1

wCurBaseData::
wBaseStats::
wBaseHP:: ds 1
wBaseAttack:: ds 1
wBaseDefense:: ds 1
wBaseSpeed:: ds 1
wBaseSpecialAttack:: ds 1
wBaseSpecialDefense:: ds 1
wBaseType::
wBaseType1:: ds 1
wBaseType2:: ds 1
wBaseCatchRate:: ds 1
wBaseExp:: ds 1
wBaseItems:: ds 2
wBaseGender::
wBaseEggSteps:: ds 1
wBasePicSize:: ds 1
wBaseAbility1:: ds 1
wBaseAbility2:: ds 1
wBaseHiddenAbility:: ds 1
wBaseGrowthRate:: ds 1
wBaseEggGroups:: ds 1
wBaseEVYield1:: ds 1
wBaseEVYield2:: ds 1
wBaseTMHM:: flag_array NUM_TMHMS

wCurDamage:: ds 2

wMornEncounterRate:: ds 1
wDayEncounterRate:: ds 1
wNiteEncounterRate:: ds 1
wWaterEncounterRate:: ds 1

wListMoves_MoveIndicesBuffer:: ds NUM_MOVES

wPutativeTMHMMove:: ds 1

	ds 1

wBattleHasJustStarted:: ds 1

wd265:: ; TODO: replace with meaningful labels
wNamedObjectIndexBuffer::
wCurTMHMBuffer::
wTypeMatchup::
wFoundMatchingIDInParty::
	ds 1

wFailedToFlee:: ds 1
wNumFleeAttempts:: ds 1
wMonTriedToEvolve:: ds 1

wTimeOfDay:: ds 1

wOtherTrainerType:: ds 1

wTrainerGroupBank:: ds 1


SECTION "Enemy Party", WRAMX

wPokedexShowPointerAddr:: ds 2
wPokedexShowPointerBank:: ds 1

	ds 5

wOTPlayerName:: ds NAME_LENGTH
wOTPlayerID:: ds 2
wOTPartyCount:: ds 1
wOTPartySpecies:: ds PARTY_LENGTH + 1 ; legacy scripts don't check PartyCount

UNION
; catch tutorial dude bag
wDudeBag::
wDudeNumItems:: ds 1
wDudeItems: ds 2 * 2
wDudeItemsEnd:: ds 1
wDudeNumMedicine:: ds 1
wDudeMedicine:: ds 2 * 2
wDudeMedicineEnd:: ds 1
wDudeNumBalls:: ds 1
wDudeBalls:: ds 2 * 2
wDudeBallsEnd:: ds 1
wDudeBagEnd::

NEXTU
; OT party data
wOTPartyMons::
wOTPartyMon1:: party_struct wOTPartyMon1
wOTPartyMon2:: party_struct wOTPartyMon2
wOTPartyMon3:: party_struct wOTPartyMon3
wOTPartyMon4:: party_struct wOTPartyMon4
wOTPartyMon5:: party_struct wOTPartyMon5
wOTPartyMon6:: party_struct wOTPartyMon6
wOTPartyMonsEnd::
wOTPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH
wOTPartyMonNicknames:: ds PKMN_NAME_LENGTH * PARTY_LENGTH
wOTPartyDataEnd::
ENDU

	ds 4 ; unused

wBattleAction:: ds 1
wLinkBattleSentAction:: ds 1

wMapStatus:: ds 1
wMapEventStatus::
; 0: do map events
; 1: do background events
	ds 1

wScriptFlags::
wScriptFlags1::
; bit 3: priority jump
	ds 1
wScriptFlags2::
	ds 1
wScriptFlags3::
; bit 0: count steps
; bit 1: xy triggers
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	ds 1

wScriptMode:: ds 1
wScriptRunning:: ds 1
wScriptBank:: ds 1
wScriptPos:: ds 2

wScriptStackSize:: ds 1
wScriptStack:: ds 3 * 5
	ds 1
wScriptDelay:: ds 1

wPriorityScriptBank::
wScriptTextBank:: ds 1
wPriorityScriptAddr::
wScriptTextAddr:: ds 2

	ds 1

wWildEncounterCooldown:: ds 1

	ds 5 ; unused

wWildBattlePanic:: ds 1

wBattleScriptFlags:: ds 2
wPlayerSpriteSetupFlags::
; bit 7: if set, cancel PlayerAction
; bit 5: if set, set facing according to bits 0-1
; bits 0-1: direction facing
	ds 1

wMapReentryScriptQueueFlag:: ds 1 ; MemScriptFlag
wMapReentryScriptBank:: ds 1 ; MemScriptBank
wMapReentryScriptAddress:: ds 2 ; MemScriptAddr

	ds 4

wTimeCyclesSinceLastCall:: ds 1
wReceiveCallDelay_MinsRemaining:: ds 1
wReceiveCallDelay_StartTime:: ds 3

	ds 3

wBugContestMinsRemaining:: ds 1
wBugContestSecsRemaining:: ds 1

	ds 2

wMapStatusEnd::

	ds 2


SECTION "Game Data", WRAMX

wGameData::
wPlayerData::
wPlayerID:: ds 2

wPlayerGender::
; bit 0:
;	0 male
;	1 female
	ds 1

wPlayerName:: ds NAME_LENGTH
wRivalName:: ds NAME_LENGTH
wBackupName:: ds NAME_LENGTH

wTrendyPhrase:: ds NAME_LENGTH

wSavedAtLeastOnce:: ds 1

wSpawnAfterChampion:: ds 1

; init time set at newgame
wStartDay:: ds 1
wStartHour:: ds 1
wStartMinute:: ds 1
wStartSecond:: ds 1

wGameSaveTime:: ds 8 ; in-game wall clock time at save
wDST:: ds 1

wGameTimeCap:: ds 1 ; flag for timer hitting 999:59:59.00
wGameTimeHours:: ds 2
wGameTimeMinutes:: ds 1
wGameTimeSeconds:: ds 1
wGameTimeFrames:: ds 1

wCurDay:: ds 1

; do not talk to the RTC hardware in the no-RTC patch
if DEF(NO_RTC)
wNoRTC::
wNoRTCDayHi::   ds 1 ; copied to hRTCDayHi
wNoRTCDayLo::   ds 1 ; copied to hRTCDayLo
wNoRTCHours::   ds 1 ; copied to hRTCHours
wNoRTCMinutes:: ds 1 ; copied to hRTCMinutes
wNoRTCSeconds:: ds 1 ; copied to hRTCSeconds
else
; reserve equal space in RTC versions so that saved games remain compatible
	ds 5
endc

	ds 1

wObjectFollow_Leader:: ds 1
wObjectFollow_Follower:: ds 1
wCenteredObject:: ds 1
wFollowerMovementQueueLength:: ds 1
wFollowMovementQueue:: ds 5

wObjectStructs::
	object_struct wPlayer
	object_struct wObject1
	object_struct wObject2
	object_struct wObject3
	object_struct wObject4
	object_struct wObject5
	object_struct wObject6
	object_struct wObject7
	object_struct wObject8
	object_struct wObject9
	object_struct wObject10
	object_struct wObject11
	object_struct wObject12
wObjectStructsEnd::

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE

wMapObjects::
	map_object wPlayer
	map_object wMap1
	map_object wMap2
	map_object wMap3
	map_object wMap4
	map_object wMap5
	map_object wMap6
	map_object wMap7
	map_object wMap8
	map_object wMap9
	map_object wMap10
	map_object wMap11
	map_object wMap12
	map_object wMap13
	map_object wMap14
	map_object wMap15
	map_object wMap16
	map_object wMap17
wMapObjectsEnd::

wObjectMasks:: ds NUM_OBJECTS

wVariableSprites:: ds $100 - SPRITE_VARS

wEnteredMapFromContinue:: ds 1

	ds 2

wTimeOfDayPal:: ds 1
	ds 4
wTimeOfDayPalFlags:: ds 1
wTimeOfDayPalset:: ds 1
wCurTimeOfDay:: ds 1

wSecretID:: ds 2

wStatusFlags::
	; 0 - pokedex
	; 1 - unown dex
	; 2 - flash
	; 3 - pokerus
	; 4 - rocket signal
	; 5 - wild encounters on/off
	; 6 - hall of fame
	; 7 - bug contest on
	ds 1
wStatusFlags2::
	; 0 - rockets
	; 1 - safari zone?
	; 2 - bug contest timer
	; 3 - seen shamouti island
	; 4 - bike shop call
	; 5 - pokerus
	; 6 - exorcised lav radio tower
	; 7 - rockets in mahogany
	ds 1

wMoney:: ds 3
wMomsMoney:: ds 3
MoneyEnd::
wMomSavingMoney:: ds 1

wCoins:: ds 2

wBadges::
wJohtoBadges:: flag_array NUM_JOHTO_BADGES
wKantoBadges:: flag_array NUM_KANTO_BADGES
wBadgesEnd::

wPokemonJournals:: flag_array NUM_POKEMON_JOURNALS
wPokemonJournalsEnd::

wTMsHMs:: flag_array NUM_TMS + NUM_HMS
wTMsHMsEnd::

wNumItems:: ds 1
wItems:: ds MAX_ITEMS * 2 + 1
wItemsEnd::
wNumMedicine:: ds 1
wMedicine:: ds MAX_MEDICINE * 2 + 1
wMedicineEnd::
wNumBalls:: ds 1
wBalls:: ds MAX_BALLS * 2 + 1
wBallsEnd::
wNumBerries:: ds 1
wBerries:: ds MAX_BERRIES * 2 + 1
wBerriesEnd::
wNumKeyItems:: ds 1
wKeyItems:: ds MAX_KEY_ITEMS + 1
wKeyItemsEnd::

wPCItems:: ds MAX_PC_ITEMS * 2 + 1
wPCItemsEnd::

wPokegearFlags::
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
	ds 1
wRadioTuningKnob:: ds 1
wLastDexMode:: ds 2

wRegisteredItem:: ds 1

wPlayerState:: ds 1

wHallOfFameCount:: ds 2
wTradeFlags:: flag_array PARTY_LENGTH

	ds 1 ; unused

wMooMooBerries:: ds 1
wUndergroundSwitchPositions:: ds 1
wFarfetchdPosition:: ds 1

; map triggers
wPokecenter2FTrigger:: ds 1
wTradeCenterTrigger:: ds 1
wColosseumTrigger:: ds 1
wKrissHouse1FTrigger:: ds 1
wNewBarkTownTrigger:: ds 1
wElmsLabTrigger:: ds 1
wRoute29Trigger:: ds 1
wCherrygroveCityTrigger:: ds 1
wMrPokemonsHouseTrigger:: ds 1
wDarkCaveVioletEntranceTrigger:: ds 1
wVioletGymTrigger:: ds 1
wSproutTower3FTrigger:: ds 1
wRuinsOfAlphOutsideTrigger:: ds 1
wRuinsOfAlphInnerChamberTrigger:: ds 1
wRuinsOfAlphAerodactylChamberTrigger:: ds 1
wRuinsOfAlphHoOhChamberTrigger:: ds 1
wRuinsOfAlphKabutoChamberTrigger:: ds 1
wRuinsOfAlphOmanyteChamberTrigger:: ds 1
wRuinsOfAlphResearchCenterTrigger:: ds 1
wRoute32Trigger:: ds 1
wAzaleaTownTrigger:: ds 1
wRoute34IlexForestGateTrigger:: ds 1
wIlexForestTrigger:: ds 1
wRoute34Trigger:: ds 1
wDayCareTrigger:: ds 1
wGoldenrodCityTrigger:: ds 1
wGoldenrodGymTrigger:: ds 1
wGoldenrodMagnetTrainStationTrigger:: ds 1
wUndergroundPathSwitchRoomEntrancesTrigger:: ds 1
wRadioTower5FTrigger:: ds 1
wRoute35NationalParkGateTrigger:: ds 1
wRoute36NationalParkGateTrigger:: ds 1
wRoute36Trigger:: ds 1
wEcruteakPokecenter1FTrigger:: ds 1
wEcruteakGymTrigger:: ds 1
wEcruteakHouseTrigger:: ds 1
wBurnedTower1FTrigger:: ds 1
wBurnedTowerB1FTrigger:: ds 1
wWiseTriosRoomTrigger:: ds 1
wBellchimeTrailTrigger:: ds 1
wTinTower1FTrigger:: ds 1
wOlivineCityTrigger:: ds 1
wOlivinePortTrigger:: ds 1
wBattleTowerOutsideTrigger:: ds 1
wBattleTower1FTrigger:: ds 1
wBattleTowerElevatorTrigger:: ds 1
wBattleTowerHallwayTrigger:: ds 1
wBattleTowerBattleRoomTrigger:: ds 1
wCianwoodCityTrigger:: ds 1
wRoute47Trigger:: ds 1
wRoute48Trigger:: ds 1
wYellowForestTrigger:: ds 1
wRoute42Trigger:: ds 1
wRoute43GateTrigger:: ds 1
wMahoganyTownTrigger:: ds 1
wMahoganyMart1FTrigger:: ds 1
wTeamRocketBaseB1FTrigger:: ds 1
wTeamRocketBaseB2FTrigger:: ds 1
wTeamRocketBaseB3FTrigger:: ds 1
wDragonsDenB1FTrigger:: ds 1
wDragonShrineTrigger:: ds 1
wRoute27Trigger:: ds 1
wPokemonLeagueGateTrigger:: ds 1
wRoute23Trigger:: ds 1
wVictoryRoad2FTrigger:: ds 1
wIndigoPlateauPokecenter1FTrigger:: ds 1
wWillsRoomTrigger:: ds 1
wKogasRoomTrigger:: ds 1
wBrunosRoomTrigger:: ds 1
wKarensRoomTrigger:: ds 1
wLancesRoomTrigger:: ds 1
wHallOfFameTrigger:: ds 1
wFastShip1FTrigger:: ds 1
wFastShipB1FTrigger:: ds 1
wVermilionCityTrigger:: ds 1
wVermilionPortTrigger:: ds 1
wSaffronTrainStationTrigger:: ds 1
wCeruleanGymTrigger:: ds 1
wRoute24Trigger:: ds 1
wCeruleanCapeTrigger:: ds 1
wRoute10NorthTrigger:: ds 1
wPowerPlantTrigger:: ds 1
wLavenderTownTrigger:: ds 1
wRoute1617GateTrigger:: ds 1
wRoute18GateTrigger:: ds 1
wRoute18WestTrigger:: ds 1
wMountMoon1FTrigger:: ds 1
wMountMoonSquareTrigger:: ds 1
wTrainerHouseB1FTrigger:: ds 1
wSilverCaveRoom3Trigger:: ds 1
wCeruleanCave1FTrigger:: ds 1
wSeagallopFerryNavelGateTrigger:: ds 1
wSeagallopFerryShamoutiGateTrigger:: ds 1
wSeagallopFerryVermilionGateTrigger:: ds 1
wShamoutiHotelRestaurantTrigger:: ds 1
wFarawayIslandTrigger:: ds 1
wMystriStageTrigger:: ds 1
wRoute22PastTrigger:: ds 1
wGiovannisCaveTrigger:: ds 1
wCinnabarLabTrigger:: ds 1

; fight counts
wJackFightCount::    ds 1
wBeverlyFightCount:: ds 1 ; unused
wHueyFightCount::    ds 1
wGavenFightCount::   ds 1
wBethFightCount::    ds 1
wJoseFightCount::    ds 1
wReenaFightCount::   ds 1
wJoeyFightCount::    ds 1
wWadeFightCount::    ds 1
wRalphFightCount::   ds 1
wLizFightCount::     ds 1
wAnthonyFightCount:: ds 1
wToddFightCount::    ds 1
wGinaFightCount::    ds 1
wIrwinFightCount::   ds 1 ; unused
wArnieFightCount::   ds 1
wAlanFightCount::    ds 1
wDanaFightCount::    ds 1
wChadFightCount::    ds 1
wDerekFightCount::   ds 1 ; unused
wTullyFightCount::   ds 1
wBrentFightCount::   ds 1
wTiffanyFightCount:: ds 1
wVanceFightCount::   ds 1
wWiltonFightCount::  ds 1
wKenjiFightCount::   ds 1 ; unused
wParryFightCount::   ds 1
wErinFightCount::    ds 1

wEventFlags:: flag_array NUM_EVENTS

wCurBox:: ds 1
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES
wBoxNamesEnd::

wCelebiEvent:: ds 1

	ds 1 ; unused

wBikeFlags::
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	ds 1

	ds 1 ; unused

wCurrentMapTriggerPointer:: ds 2
wCurrentCaller:: ds 2
wCurrMapWarpCount:: ds 1
wCurrMapWarpHeaderPointer:: ds 2
wCurrentMapXYTriggerCount:: ds 1
wCurrentMapXYTriggerHeaderPointer:: ds 2
wCurrentMapSignpostCount:: ds 1
wCurrentMapSignpostHeaderPointer:: ds 2
wCurrentMapPersonEventCount:: ds 1
wCurrentMapPersonEventHeaderPointer:: ds 2
wCurrMapTriggerCount:: ds 1
wCurrMapTriggerHeaderPointer:: ds 2
wCurrMapCallbackCount:: ds 1
wCurrMapCallbackHeaderPointer:: ds 2

	ds 2 ; unused

; Sprite id of each decoration
wBed:: ds 1
wCarpet:: ds 1
wPlant:: ds 1
wPoster:: ds 1
wConsole:: ds 1
wLeftOrnament:: ds 1
wRightOrnament:: ds 1
wBigDoll:: ds 1

; Items bought from Mom
wWhichMomItem:: ds 1
wWhichMomItemSet:: ds 1
wMomItemTriggerBalance:: ds 3

wDailyResetTimer:: ds 2
wDailyFlags:: ds 1
wDailyFlags2:: ds 1
wDailyFlags3:: ds 1
wDailyFlags4:: ds 1
wWeeklyFlags:: ds 1
wWeeklyFlags2:: ds 1
wSwarmFlags:: ds 1
wTimerStartDay:: ds 1

wFruitTreeFlags:: flag_array NUM_FRUIT_TREES

wNuzlockeLandmarkFlags:: flag_array NUM_LANDMARKS

wHiddenGrottoContents::
; content type, content id
	ds NUM_HIDDEN_GROTTOES * 2

wCurHiddenGrotto:: ds 1

wLuckyNumberDayBuffer:: ds 2
wSpecialPhoneCallID:: ds 1
wBugContestStartTime:: ds 4 ; day, hour, min, sec

wLastPocket:: ds 1

wBuenasPassword:: ds 1
wBlueCardBalance:: ds 1

wBugContestOfficerPrize:: ds 1

wInPokegear:: ds 1
wWalkingOnBridge:: ds 1

wDailyRematchFlags:: ds 4
wDailyPhoneItemFlags:: ds 4
wDailyPhoneTimeOfDayFlags:: ds 4
wKenjiBreakTimer:: ds 2 ; Kenji

wYanmaMapGroup:: ds 1
wYanmaMapNumber:: ds 1

wVermilionGymTrashCan1:: ds 1
wVermilionGymTrashCan2:: ds 1

	ds 2 ; unused

wBattlePoints:: ds 1

wStepCount:: ds 1
wPoisonStepCount:: ds 1

wPhoneList:: ds CONTACT_LIST_SIZE

wHappinessStepCount:: ds 1

wParkBallsRemaining::
wSafariBallsRemaining:: ds 1
wSafariTimeRemaining:: ds 2

wLuckyNumberShowFlag:: ds 2
wLuckyIDNumber:: ds 2

wRepelEffect:: ds 1 ; If a Repel is in use, it contains the nr of steps it's still active
wRepelType:: ds 1

wBikeStep:: ds 2

wKurtApricornQuantity:: ds 1

wPlayerDataEnd::


wMapData::

wVisitedSpawns:: flag_array NUM_SPAWNS

wDigWarp:: ds 1
wDigMapGroup:: ds 1
wDigMapNumber:: ds 1

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
wBackupWarpNumber:: ds 1
wBackupMapGroup:: ds 1
wBackupMapNumber:: ds 1

wLastSpawnMapGroup:: ds 1
wLastSpawnMapNumber:: ds 1

wWarpNumber:: ds 1
wMapGroup:: ds 1 ; map group of current map
wMapNumber:: ds 1 ; map number of current map
wYCoord:: ds 1 ; current y coordinate relative to top-left corner of current map
wXCoord:: ds 1 ; current x coordinate relative to top-left corner of current map
wScreenSave:: ds 6 * 5

wMapDataEnd::


SECTION "Party", WRAMX

wPokemonData::

wPartyCount:: ds 1 ; number of Pokémon in party
wPartySpecies:: ds PARTY_LENGTH + 1 ; legacy scripts don't check PartyCount

wPartyMons::
wPartyMon1:: party_struct wPartyMon1
wPartyMon2:: party_struct wPartyMon2
wPartyMon3:: party_struct wPartyMon3
wPartyMon4:: party_struct wPartyMon4
wPartyMon5:: party_struct wPartyMon5
wPartyMon6:: party_struct wPartyMon6

wPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH

wPartyMonNicknames:: ds PKMN_NAME_LENGTH * PARTY_LENGTH
wPartyMonNicknamesEnd::

	ds 13 ; unused

wPokedexCaught:: flag_array NUM_POKEMON
wEndPokedexCaught::

wPokedexSeen:: flag_array NUM_POKEMON
wEndPokedexSeen::

wUnownDex:: ds NUM_UNOWN
wUnlockedUnowns::

wFirstUnownSeen:: ds 1
wFirstMagikarpSeen:: ds 1

wDaycareMan::
; bit 7: active
; bit 6: monsters are compatible
; bit 5: egg ready
; bit 0: monster 1 in daycare
	ds 1

wBreedMon1::
wBreedMon1Nick::  ds PKMN_NAME_LENGTH
wBreedMon1OT:: ds NAME_LENGTH
wBreedMon1Stats:: box_struct wBreedMon1

wDaycareLady::
; bit 7: active
; bit 0: monster 2 in daycare
	ds 1

wStepsToEgg:: ds 1
wBreedMotherOrNonDitto:: ds 1

wBreedMon2::
wBreedMon2Nick:: ds PKMN_NAME_LENGTH
wBreedMon2OT:: ds NAME_LENGTH
wBreedMon2Stats:: box_struct wBreedMon2

wEggNick:: ds PKMN_NAME_LENGTH
wEggOT:: ds NAME_LENGTH
wEggMon:: box_struct wEggMon

wBugContestSecondPartySpecies:: ds 1
wContestMon:: party_struct wContestMon

wDunsparceMapGroup:: ds 1
wDunsparceMapNumber:: ds 1
wFishingSwarmFlag:: ds 1

wRoamMon1:: roam_struct wRoamMon1
wRoamMon2:: roam_struct wRoamMon2
wRoamMon3:: roam_struct wRoamMon3

wRoamMons_CurrentMapNumber:: ds 1
wRoamMons_CurrentMapGroup:: ds 1
wRoamMons_LastMapNumber:: ds 1
wRoamMons_LastMapGroup:: ds 1

wBestMagikarpLengthMm::
wBestMagikarpLengthMmHi:: ds 1
wBestMagikarpLengthMmLo:: ds 1
wMagikarpRecordHoldersName:: ds NAME_LENGTH

wPokemonDataEnd::
wGameDataEnd::


SECTION "Pic Animations RAM", WRAMX

wTempTileMap:: ds SCREEN_WIDTH * SCREEN_HEIGHT ; 20x18 grid of 8x8 tiles

; PokeAnim Header
wPokeAnimSceneIndex:: ds 1
wPokeAnimPointer:: ds 2
wPokeAnimSpecies:: ds 1
wPokeAnimVariant:: ds 1
wPokeAnimSpeciesOrVariant:: ds 1
wPokeAnimGraphicStartTile:: ds 1
wPokeAnimCoord:: ds 2
wPokeAnimFrontpicHeight:: ds 1
; PokeAnim Data
wPokeAnimExtraFlag:: ds 1
wPokeAnimSpeed:: ds 1
wPokeAnimPointerBank:: ds 1
wPokeAnimPointerAddr:: ds 2
wPokeAnimFramesBank:: ds 1
wPokeAnimFramesAddr:: ds 2
wPokeAnimBitmaskBank:: ds 1
wPokeAnimBitmaskAddr:: ds 2
wPokeAnimFrame:: ds 1
wPokeAnimJumptableIndex:: ds 1
wPokeAnimRepeatTimer:: ds 1
wPokeAnimCurBitmask:: ds 1
wPokeAnimWaitCounter:: ds 1
wPokeAnimCommand:: ds 1
wPokeAnimParameter:: ds 1
	ds 1
wPokeAnimBitmaskCurCol:: ds 1
wPokeAnimBitmaskCurRow:: ds 1
wPokeAnimBitmaskCurBit:: ds 1
wPokeAnimBitmaskBuffer:: ds 1
	ds 8
wPokeAnimStructEnd::


SECTION "Battle Tower", WRAMX

; BattleTower OpponentTrainer-Data (length = 0xe0 = $a + $1 + 3*$3b + $24)
wBT_OTTrainer:: battle_tower_struct wBT_OT

	ds $20

wBT_TrainerTextIndex:: ds 2

wBT_OTTrainer1:: battle_tower_struct wBT_OTTrainer1
wBT_OTTrainer2:: battle_tower_struct wBT_OTTrainer2
wBT_OTTrainer3:: battle_tower_struct wBT_OTTrainer3
wBT_OTTrainer4:: battle_tower_struct wBT_OTTrainer4
wBT_OTTrainer5:: battle_tower_struct wBT_OTTrainer5
wBT_OTTrainer6:: battle_tower_struct wBT_OTTrainer6
wBT_OTTrainer7:: battle_tower_struct wBT_OTTrainer7

wBTChoiceOfLvlGroup:: ds 1


SECTION "Sound Stack", WRAMX

wSoundEngineBackup:: ds wChannelsEnd - wMusic


SECTION "Music Player Notes", WRAMX

wMPNotes:: ds 4 * 256


SECTION "GBC Video", WRAMX

; 8 4-color palettes
wUnknBGPals:: ds 8 palettes
wUnknOBPals:: ds 8 palettes
wBGPals::     ds 8 palettes
wOBPals::     ds 8 palettes

wLYOverrides:: ds SCREEN_HEIGHT_PX
wLYOverridesEnd::

wMagnetTrainDirection:: ds 1
wMagnetTrainInitPosition:: ds 1
wMagnetTrainHoldPosition:: ds 1
wMagnetTrainFinalPosition:: ds 1
wMagnetTrainPlayerSpriteInitX:: ds 1

wColorVaryDVs:: ds 3
wColorVarySpecies:: ds 1
wColorVaryShiny:: ds 1

	ds 102 ; unused

wLYOverridesBackup:: ds SCREEN_HEIGHT_PX
wLYOverridesBackupEnd::


SECTION "Battle Animations RAM", WRAMX

wBattleAnimTileDict:: ds 10

wActiveAnimObjects::
wAnimObject01:: battle_anim_struct wAnimObject01
wAnimObject02:: battle_anim_struct wAnimObject02
wAnimObject03:: battle_anim_struct wAnimObject03
wAnimObject04:: battle_anim_struct wAnimObject04
wAnimObject05:: battle_anim_struct wAnimObject05
wAnimObject06:: battle_anim_struct wAnimObject06
wAnimObject07:: battle_anim_struct wAnimObject07
wAnimObject08:: battle_anim_struct wAnimObject08
wAnimObject09:: battle_anim_struct wAnimObject09
wAnimObject10:: battle_anim_struct wAnimObject10
wActiveAnimObjectsEnd::

wActiveBGEffects::
wBGEffect1:: battle_bg_effect wBGEffect1
wBGEffect2:: battle_bg_effect wBGEffect2
wBGEffect3:: battle_bg_effect wBGEffect3
wBGEffect4:: battle_bg_effect wBGEffect4
wBGEffect5:: battle_bg_effect wBGEffect5
wActiveBGEffectsEnd::

wNumActiveBattleAnims:: ds 1

wBattleAnimFlags:: ds 1
wBattleAnimAddress:: ds 2
wBattleAnimDuration:: ds 1
wBattleAnimParent:: ds 2
wBattleAnimLoops:: ds 1
wBattleAnimVar:: ds 1
wBattleAnimByte:: ds 1
wBattleAnimOAMPointerLo:: ds 1
wBattleAnimTempOAMFlags::
wBattleAnimTemp0:: ds 1
wBattleAnimTemp1:: ds 1
wBattleAnimTempTileID::
wBattleAnimTemp2:: ds 1
wBattleAnimTempXCoord::
wBattleAnimTemp3:: ds 1
wBattleAnimTempYCoord::
wBattleAnimTemp4:: ds 1
wBattleAnimTempXOffset::
wBattleAnimTemp5:: ds 1
wBattleAnimTempYOffset::
wBattleAnimTemp6:: ds 1
wBattleAnimTemp7:: ds 1
wBattleAnimTempPalette::
wBattleAnimTemp8:: ds 1

wSurfWaveBGEffect:: ds $32
wBattleAnimEnd::
	ds $e
wSurfWaveBGEffectEnd::


SECTION "WRAM 6", WRAMX

UNION
wDecompressScratch:: ds $80 tiles
NEXTU
wScratchTileMap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
wScratchAttrMap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
ENDU


SECTION "WRAM 7", WRAMX

wWindowStack:: ds $1000 - 1
wWindowStackBottom:: ds 1


INCLUDE "sram.asm"
