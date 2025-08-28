-- Author		: Potdisc, updated by heyaapl
-- soundboard_data.lua	  Contains all default data on soundfiles for the Soundboard addon
-- Version		: 1.0.0

local dir = "Interface\\AddOns\\Soundboard\\Soundpacks\\Default\\Sounds\\";

if not soundboard_data or type(soundboard_data) ~= "table" then
	soundboard_data = {};
end

--[[ soundboard_data Parameters

-	TableIndex (string | int) - Index to soundboard_data, also the one determining which letter to put it under in the menu and the name for the slashcommand. Must be unique.
-	text (string) -	The text to display in the menu as well as /say if is enabled.
-	emote (string) - The emote to run (without the "/"). Must be a valid WoW emote. Optional
-	msg (string) - The message to be appended to /e (i.e. PlayerName "msg"). Optional
-	category (string) - The category to add to the menu, can be an existing. Also added to "pack menu". Optional
-	subcategory (string) - The subcategory, added after category, can also be an existing. Requires "category". Optional
-	file (string) - The location and name of the sound file. Must be unique.
-	pack (string) - Name of the pack. Gets its own menu point. Preferable unique. Optional
]]

-- THE FOLLOWING COME FROM "CLASSICS"
soundboard_data["finalfantasy"] = {
	["text"] = 		"* Attacked by Green Ogre! *",
	["cmd1"] = "ff",
	["msg"] = "warns you of an approaching enemy!",
	["category"] = "Video Games",
	["file"] = dir.."ff-fightsong-start.mp3",
	["duration"] = 45,
};

soundboard_data["lizard"] = {
	["text"] = 		"* Single Lizard *",
	["cmd1"] = "lizard",
	["msg"] = "is a lizard!",
	["category"] = "Memes",
	["file"] = dir.."lizard-single.mp3",
	["duration"] = 2,
};

soundboard_data["yourfather"] = {
	["text"] = 		"* Luke, I am your father *",
	["cmd1"] = "yourfather",
	["msg"] = "is your father!",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."yourfather.mp3",
	["duration"] = 4,
};

soundboard_data["lizard-long"] = {
	["text"] = 		"* Lizard, but longer *",
	["cmd1"] = "lizard-long",
	["msg"] = "is a lizard!",
	["category"] = "Memes",
	["file"] = dir.."lizard-long.mp3",
	["duration"] = 12,
};

soundboard_data["win"] = {
	["text"] = 		"* YOU ARE A WINNER! *",
	["msg"] = "declares you a winner!",
	["emote"] = "cheer",
	["category"] = "Video Games",
	["file"] = dir.."victory.mp3",
	["duration"] = 3,
};

soundboard_data["rocky"] = {
	["text"] = 		"* Who wants to PVP! *",
	["HordeEnemyText"] = 		"",
	["msg"] = "is ready for some PVP!",
	["emote"] = "flex",
	["category"] = "Movies/TV",
	["file"] = dir.."rocky.mp3",
	["duration"] = 32,
};

soundboard_data["rff"] = {
	["text"] = 		"* FEUER FREI! *",
	["msg"] = "points at the enemy!",
	["emote"] = "openfire",
	["category"] = "Music",
	["file"] = dir.."rff.mp3",
	["duration"] = 22,
};

soundboard_data["hero"] = {
	["text"] = 		"* I NEED A HERO! *",
	["msg"] = "needs a hero!",
	["emote"] = "roar",
	["category"] = "Music",
	["subcategory"] = "Bonnie Tyler",
	["file"] = dir.."hero.mp3",
	["duration"] = 47,
};

soundboard_data["naruto"] = {
	["text"] = 		"* NARUTARD POWA! *",
	["msg"] = "has gone berserk because their seal is broken!",
	["emote"] = "roar",
	["category"] = "Movies/TV",
	["file"] = dir.."hv.mp3",
	["duration"] = 34,
};

soundboard_data["pkmn"] = {
	["text"] = 		"* Gotta catch em all! *",
	["msg"] = "gotta catch em all!",
	["category"] = "Video Games",
	["subcategory"] = "Pokemon",
	["file"] = dir.."pokemon.mp3",
	["duration"] = 65,
};

soundboard_data["pkmn2"] = {
	["text"] = 		"* Wild NUB wants to fight! *",
	["msg"] = "chooses you!",
	["category"] = "Video Games",
	["subcategory"] = "Pokemon",
	["file"] = dir.."pokemon2.mp3",
	["duration"] = 65,
};

soundboard_data["pwrr"] = {
	["text"] = 		"* GO GO POWER RANGERS! *",
	["msg"] = "thinks it's morphin time!",
	["emote"] = "flex",
	["category"] = "Movies/TV",
	["file"] = dir.."pwrrngs.mp3",
	["duration"] = 61,
};

soundboard_data["ateam"] = {
	["text"] = 		"* The A TEAM! *",
	["msg"] = "summons the A TEAM!",
	["emote"] = "roar",
	["category"] = "Movies/TV",
	["file"] = dir.."ateam.mp3",
	["duration"] = 76,
};

soundboard_data["mortal"] = {
	["text"] = 		"* MORTAL KOMBAT! *",
	["msg"] = "scores BRUTALITY!",
	["emote"] = "roar",
	["category"] = "Video Games",
	["file"] = dir.."mortal.mp3",
	["duration"] = 32,
};

soundboard_data["imp"] = {
	["text"] = 		"* DUN DUN DUN! *",
	["msg"] = "marches in lockstep.",
	["emote"] = "salute",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."imperial_march.mp3",
	["duration"] = 48,
};

soundboard_data["tiger"] = {
	["text"] =		"* Eye of the Tiger! *",
	["msg"] = "has the eye.... of the tiger!",
	["emote"] = "ready",
	["category"] = "Music",
	["subcategory"] = "Survivor",
	["file"] = dir.."eyeofthetiger.mp3",
	["duration"] = 14,
};

soundboard_data["benny"] = {
	["text"] = 		"* gives it some Benny Hill! *",
	["msg"] = "gives it some Benny!",
	["cmd1"] = "bh",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."bennyhill.mp3",
	["duration"] = 33,
};

soundboard_data["leeroy"] = {
	["text"] = 		"* invokes the power of Leeroy Jenkins! *",
	["msg"] = "invokes the power of Leeroy Jenkins!",
	["emote"] = "roar",
	["category"] = "World of Warcraft",
	["subcategory"] = "Leeroy Jenkins",
	["file"] = dir.."leeroy.mp3",
	["duration"] = 6,
};

soundboard_data["tcats"] = {
	["text"] = 		"* Thundercats HO *",
	["msg"] = "screams Thundercats HO!",
	["cmd1"] = "thundercats",
	["category"] = "Movies/TV",
	["file"] = dir.."thundercatsho.mp3",
	["duration"] = 8,
};

soundboard_data["power"] = {
	["text"] = 		"* BY THE POWER OF GREYSKULL *",
	["msg"] = "screams BY THE POWER OF GREYSKULL!",
	["category"] = "Movies/TV",
	["file"] = dir.."heman.mp3",
	["duration"] = 12,
};

soundboard_data["venga"] = {
	["text"] = 		"* RIDE THE VENGABUS *",
	["msg"] = "jumps on the Vengabus!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."venga.mp3",
	["duration"] = 16,
};

soundboard_data["goninja"] = {
	["text"] = 		"* GO NINJA GO NINJA GO! *",
	["cmd1"] = "ninja",
	["msg"] = "busts out the ninja moves!",
	["category"] = "Music",
	["file"] = dir.."ninja.mp3",
	["duration"] = 20,
};
	
soundboard_data["matrix"] = {
	["text"] = 		"* THERE IS NO SPOON! *",
	["msg"] = "dodges bullets.",
	["emote"] = "flex",
	["category"] = "Movies/TV",
	["file"] = dir.."matrix.mp3",
	["duration"] = 20,
};

soundboard_data["ymca"] = {
	["text"] = 		"* Y M C A! *",
	["msg"] = "has no need to feel down!",
	["emote"] = "dance",
	["category"] = "Music",
	["subcategory"] = "Village People",
	["file"] = dir.."YMCA2.mp3",
	["duration"] = 50,
};

soundboard_data["ctt"] = {
	["text"] = 		"* Can't touch this! *",
	["msg"] = "is untouchable!",
	["emote"] = "dance",
	["category"] = "Music",
	["subcategory"] = "MC Hammer",
	["file"] = dir.."CTT.mp3",
	["duration"] = 31.0,
};

soundboard_data["dogs"] = {
	["text"] = 		"* Who let the dogs out! *",
	["msg"] = "wants to know who aggroed the dogs!",
	["emote"] = "gasp",
	["category"] = "Music",
	["subcategory"] = "Baha Men",
	["file"] = dir.."dogs.mp3",
	["duration"] = 17,
};

soundboard_data["itn"] = {
	["text"] = 		"* In the Navy! *",
	["msg"] = "wants to sail the seven seas!",
	["emote"] = "dance",
	["category"] = "Music",
	["subcategory"] = "Village People",
	["file"] = dir.."itn.mp3",
	["duration"] = 33,
};

soundboard_data["bj"] = {
	["text"] = 		"* Billie Jean! *",
	["msg"] = "claims the kid is not their son!",
	["emote"] = "dance",
	["category"] = "Music",
	["subcategory"] = "Michael Jackson",
	["file"] = dir.."billiejean.mp3",
	["duration"] = 43,
};

soundboard_data["watchu"] = {
	["text"] = 		"* Wutchu watin for! *",
	["msg"] = "wonders why you wait.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."watchu.mp3",
	["duration"] = 18,
};

soundboard_data["unstoppable"] = {
	["text"] = 		"* UNSTOPPABLE! *",
	["msg"] = "is unstoppable!",
	["category"] = "Video Games",
	["subcategory"] = "Unreal Tournament",
	["file"] = dir.."unstoppable.mp3",
	["duration"] = 4,
};

soundboard_data["humiliation"] = {
	["text"] = 		"* HUMILIATION! *",
	["msg"] = "just totally noob'd his opponent!",
	["emote"] = "cackle",
	["category"] = "Video Games",
	["subcategory"] = "Unreal Tournament",
	["file"] = dir.."humiliation.mp3",
	["duration"] = 3,
};

soundboard_data["rampage"] = {
	["text"] = 		"* RAMPAGE! *",
	["msg"] = "is on a RAMPAGE!",
	["category"] = "Video Games",
	["subcategory"] = "Unreal Tournament",
	["file"] = dir.."rampage.mp3",
	["duration"] = 4,
};

soundboard_data["prepare"] = {
	["text"] = 		"* PREPARE TO FIGHT! *",
	["msg"] = "hits B, 8, 2, B, 4, 2, B, 1, and 4!",
	["category"] = "Video Games",
	["file"] = dir.."prepare.mp3",
	["duration"] = 3,
};

soundboard_data["glike"] = {
	["text"] = 		"* GOD LIKE! *",
	["msg"] = "is a GOD!",
	["category"] = "Video Games",
	["subcategory"] = "Unreal Tournament",
	["file"] = dir.."godlike.mp3",
	["duration"] = 3,
};

soundboard_data["headshot"] = {
	["text"] = 		"* HEADSHOT *",
	["cmd1"] = "shot",
	["msg"] = "crits for HEADSHOT!",
	["category"] = "Video Games",
	["subcategory"] = "Unreal Tournament",
	["file"] = dir.."headshot.mp3",
	["duration"] = 3,
};

soundboard_data["fpsdoug"] = {
	["text"] = 		"* IT'S LIKE BOOM HS!! *",
	["AllianceEnemyText"] = 	"",
	["HordeEnemyText"] = 		"",
	["msg"] = "molds his hands into holding an Arctic Warfare Magnum.",
	["category"] = "Internet",
	["file"] = dir.."BOOMHS.mp3",
	["duration"] = 7,
};

soundboard_data["lls"] = {
	["text"] = 		"* LOVE LOVE SHINE! *",
	["msg"] = "wants to DDR!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."lls.mp3",
	["duration"] = 56,
};

soundboard_data["lind"] = {
	["text"] = 		"* LOVE IS IN DANGER! *",
	["msg"] = "is in danger!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."lind.mp3",
	["duration"] = 39,
};

soundboard_data["nof"] = {
	["text"] = 		"* NIGHT OF FIRE! *",
	["msg"] = "hopes you better say...",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."nof.mp3",
	["duration"] = 28,
};

soundboard_data["gp"] = {
	["text"] = 		"* Grand Prix! *",
	["msg"] = "is gripping his steering wheel.... so tight!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."gp.mp3",
	["duration"] = 38,
};

soundboard_data["hb"] = {
	["text"] = 		"* Heartbeat! *",
	["msg"] = "listens to their heartbeat.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."heart.mp3",
	["duration"] = 38,
};

soundboard_data["yatta"] = {
	["text"] = 		"* YATTA! *",
	["msg"] = "bounces from left to right.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."yatta.mp3",
	["duration"] = 31,
};

soundboard_data["wryy"] = {
	["text"] = 		"* WRYYYYY! *",
	["msg"] = "jumps on someone with a steamroller!",
	["emote"] = "roar",
	["category"] = "Video Games",
	["file"] = dir.."WRYYYYYYYYYYY.mp3",
	["duration"] = 5,
};

soundboard_data["desu"] = {
	["text"] = 		"* Soshite toki ga ugoki desu. *",
	["msg"] = "continues time.",
	["category"] = "Video Games",
	["file"] = dir.."desu.mp3",
	["duration"] = 3,
};

soundboard_data["toki"] = {
	["text"] = 		"* TOKI WO TOMARE! *",
	["msg"] = "prepares to unleash a barrage of knives!",
	["category"] = "Video Games",
	["file"] = dir.."toki.mp3",
	["duration"] = 3,
};

soundboard_data["zaw"] = {
	["text"] = 		"* ZA WARUDO! *",
	["msg"] = "freezes time!",
	["emote"] = "roar",
	["category"] = "Video Games",
	["file"] = dir.."zawarudo.mp3",
	["duration"] = 4,
};

soundboard_data["mudabu"] = {
	["text"] = 		"* MUDABUDABUDA! *",
	["msg"] = "unleashes a flurry of punches!",
	["category"] = "Video Games",
	["file"] = dir.."mudabudabuda.mp3",
	["duration"] = 4,
};

soundboard_data["muda"] = {
	["text"] = 		"* MUDADA! *",
	["msg"] = "does not think so!",
	["category"] = "Video Games",
	["file"] = dir.."mudada.mp3",
	["duration"] = 2,
};

soundboard_data["dots"] = {
	["text"] = 		"* MORE DOTS! *",
	["msg"] = "demands more DoTs!",
	["category"] = "World of Warcraft",
	["subcategory"] = "Onyxia Wipe",
	["file"] = dir.."moredots.mp3",
	["duration"] = 5,
};

soundboard_data["hitit"] = {
	["text"] = 		"* Hit it like ya mean it! *",
	["msg"] = "wants you to put more effort in.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Onyxia Wipe",
	["file"] = dir.."hitit.mp3",
	["duration"] = 3,
};

soundboard_data["dkp"] = {
	["text"] = 		"* 50 DKP MINUS! *",
	["msg"] = "takes away your DKP!",
	["emote"] = "angry",
	["file"] = dir.."dkp.mp3",
	["category"] = "World of Warcraft",
	["subcategory"] = "Onyxia Wipe",
	["nsfw"] = true,
	["duration"] = 9,
};

soundboard_data["dots2"] = {
	["text"] = 		"* Need more DoTs! *",
	["msg"] = "wants more DoTs.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Onyxia Wipe",
	["file"] = dir.."moredots2.mp3",
	["duration"] = 8,
};

soundboard_data["whelps"] = {
	["text"] = 		"* WHELPS! *",
	["msg"] = "aggroed the whelp cave!",
	["category"] = "World of Warcraft",
	["subcategory"] = "Onyxia Wipe",
	["file"] = dir.."whelps.mp3",
	["duration"] = 9,
};

soundboard_data["cloudsong"] = {
	["text"] = 		"* YOU STOLE MY CLOUDSONG! *",
	["msg"] = "says you stole their cloudsong!",
	["emote"] = "threaten",
	["category"] = "Internet",
	["file"] = dir.."cloudsong.mp3",
	["duration"] = 3,
};

soundboard_data["sandlol"] = {
	["text"] =		"* SANDLOL! *",
	["msg"] = "has got a jar of dirt!",
	["category"] = "Misc",
	["file"] = dir.."jarofdirt.mp3",
	["duration"] = 3,
};

soundboard_data["repressed"] = {
	["text"] =		"* HELP HELP I'M BEIN REPRESSED! *",
	["msg"] = "is being REPRESSED!",
	["category"] = "Movies/TV",
	["subcategory"] = "Monty Python",
	["file"] = dir.."repressed.mp3",
	["duration"] = 4,
};

soundboard_data["napoleon"] = {
	["text"] =		"* You know this boogie is for real. *",
	["msg"] = "shows his boogie dance skills! Gosh!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."napoleon.mp3",
	["duration"] = 67,
};

soundboard_data["tunak"] = {
	["text"] =		"* Tunak Tunak Tun... *",
	["msg"] = "mends the tunic!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."tunaktunak.mp3",
	["duration"] = 15,
};

soundboard_data["murloc"] = {
	["text"] = 		"* RLRLRLRLGLRLGLR *",
	["msg"] = "is a murloc!",
	["category"] = "World of Warcraft",
	["subcategory"] = "Creatures",
	["file"] = dir.."murloc.mp3",
	["duration"] = 3,
};

soundboard_data["tehpwnerer"] = {
	["text"] = 		"* So this one time.. *",
	["msg"] = "is teh_pwnerer.",
	["cmd1"] = "tpr",
	["emote"] = "talk",
	["category"] = "World of Warcraft",
	["subcategory"] = "General",
	["file"] = dir.."shamanrogue.mp3",
	["duration"] = 54,
};

soundboard_data["shadowform"] = {
	["text"] = 		"* Is shadowform okay? *",
	["msg"] = "is itchy to melt faces.",
	["cmd1"] = "shf",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."shadowform.mp3",
	["duration"] = 3,
};

soundboard_data["druidtank"] = {
	["text"] = 		"* Why don't we have a druid tank Rag? *",
	["msg"] = "wants a druid to tank Rag.",
	["cmd1"] = "druid",
	["emote"] = "frown",
	["category"] = "World of Warcraft",
	["subcategory"] = "Raids",
	["file"] = dir.."druidtank.mp3",
	["duration"] = 4,
};

soundboard_data["byh"] = {
	["text"] = 		"* I can be your healer baby! *",
	["msg"] = "assures you that they are 40 yards away.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."chealers.mp3",
	["duration"] = 39,
};

soundboard_data["thrall"] = {
	["text"] = 		"* Club Thrall! *",
	["msg"] = "sees lots of colors!",
	["emote"] = "dance",
	["category"] = "World of Warcraft",
	["subcategory"] = "Characters",
	["file"] = dir.."thrall.mp3",
	["duration"] = 113,
};

soundboard_data["thrall2"] = {
	["text"] = 		"* Thralls Ball! *",
	["msg"] = "goes into a trance.",
	["emote"] = "dance",
	["category"] = "World of Warcraft",
	["subcategory"] = "Characters",
	["file"] = dir.."thrallsball.mp3",
	["duration"] = 60,
};

soundboard_data["mreh"] = {
	["text"] = 		"* MREH *",
	["msg"] = "mrehs",
	["category"] = "Misc",
	["file"] = dir.."mreh.mp3",
	["duration"] = 2,
};

soundboard_data["whine"] = {
	["text"] = 		"* STOP WHINING! *",
	["msg"] = "says stop whining!",
	["category"] = "Movies/TV",
	["subcategory"] = "Arnold Swarchenegger",
	["file"] = dir.."whine.mp3",
	["duration"] = 3,
};
	
soundboard_data["rush"] = {
	["text"] = 		"* Charge! *",
	["msg"] = "orders everyone to charge!",
	["emote"] = "charge",
	["category"] = "Misc",
	["file"] = dir.."CHARGE.mp3",
	["duration"] = 7,
};
	
soundboard_data["gover"] = {
	["text"] = 		"* Game Over Man! *",
	["msg"] = "calls a wipe!",
	["emote"] = "cry",
	["category"] = "Movies/TV",
	["file"] = dir.."gameover.mp3",
	["duration"] = 5,
};
	
soundboard_data["kame"] = {
	["text"] = 		"* KAMEHAMEHA!!! *",
	["msg"] = "charges energy into his palms!",
	["category"] = "Movies/TV",
	["subcategory"] = "Dragon Ball Z",
	["file"] = dir.."kame.mp3",
	["duration"] = 9,
};

soundboard_data["hax"] = {
	["text"] = 		"* WTF UBER HAX!!1 *",
	["emote"] = "gasp",
	["msg"] = "thinks they got new hax!",
	["category"] = "Music",
	["file"] = dir.."hax.mp3",
	["duration"] = 26,
};

soundboard_data["cuppycake"] = {
	["text"] = 		"* You're my cuppycake gumdrop.. *",
	["emote"] = "giggle",
	["msg"] = "thinks you're the apple of their eye.",
	["category"] = "Music",
	["file"] = dir.."cuppycake.mp3",
	["duration"] = 18,
};

soundboard_data["wonderful"] = {
	["text"] = 		"* Having a wonderful time! *",
	["emote"] = "drool",
	["msg"] = "is having a wonderful time!",
	["category"] = "Music",
	["file"] = dir.."wonderful time.mp3",
	["duration"] = 21,
};

soundboard_data["spinnaz"] = {
	["text"] = 		"* I ride spinnaz... they don't stop... *",
	["msg"] = "rides spinnaz, also loots!",
	["category"] = "Misc",
	["file"] = dir.."ride spinnaz.mp3",
	["duration"] = 24,
};

soundboard_data["ytmnd"] = {
	["text"] = 		"* YOU'RE THE MAN NOW, DOG! *",
	["emote"] = "cheer",
	["msg"] = "thinks you've made a breakthrough!",
	["category"] = "Internet",
	["file"] = dir.."ytmnd.mp3",
	["duration"] = 3,
};

soundboard_data["pi"] = {
	["text"] = 		"* 3.141592653589793238.. *",
	["msg"] = "3.14159265358979323846264338327950288419716939937510",
	["category"] = "Music",
	["file"] = dir.."pi.mp3",
	["duration"] = 66,
};

soundboard_data["ohsnap"] = {
	["text"] = 		"* OH SNAP! *",
	["emote"] = "gasp",
	["msg"] = "is surprised.",
	["category"] = "Misc",
	["file"] = dir.."ohsnap.mp3",
	["duration"] = 3,
};

soundboard_data["wookies"] = {
	["text"] = 		"* SALSA WOOKIES! *",
	["msg"] = "saw some wookies.",
	["category"] = "Music",
	["file"] = dir.."o fortuna.mp3",
	["duration"] = 13,
};

soundboard_data["youlose"] = {
	["text"] = 		"* You LOSE! Good day sir! *",
	["msg"] = "kicks you out of his factory!",
	["category"] = "Movies/TV",
	["file"] = dir.."you lose.mp3",
	["duration"] = 5,
};

soundboard_data["pirate"] = {
	["text"] = 		"* Do what you want 'cuz a pirate is free... *",
	["msg"] = "is a pirate!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."pirate.mp3",
	["duration"] = 14,
};

soundboard_data["fail"] = {
	["text"] = 		"* YOU HAVE FAILED! *",
	["msg"] = "says you fail!",
	["category"] = "Misc",
	["file"] = dir.."failed.mp3",
	["duration"] = 6,
};

soundboard_data["topgun"] = {
	["text"] = 		"* HIGHWAY TO THE DANGER ZONE!! *",
	["msg"] = "RIDES INTO THE DANGER ZONE!",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["file"] = dir.."topgun.mp3",
	["duration"] = 18,
};

soundboard_data["tralala"] = {
	["text"] = 		"* Ooh, you touch my tralala...! *",
	["msg"] = "thinks you touched their tralala!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."tralala.mp3",
	["duration"] = 22,
};

soundboard_data["hassan"] = {
	["text"] = 		"* AYAYLELEAYALELEALA! *",
	["emote"] = "roar",
	["category"] = "Misc",
	["file"] = dir.."hassan.mp3",
	["duration"] = 10,
};

soundboard_data["barrel"] = {
	["text"] = 		"* DO A BARREL ROLL! *",
	["msg"] = "does a barrel roll!",
	["category"] = "Video Games",
	["file"] = dir.."barrelroll.mp3",
	["duration"] = 3,
};

soundboard_data["katamari"] = {
	["text"] = 		"* NAA NANANANANA KATAMARI DAMACY! *",
	["msg"] = "rolls a Katamari!",
	["emote"] = "dance",
	["category"] = "Video Games",
	["file"] = dir.."katamari.mp3",
	["duration"] = 27,
};

soundboard_data["noo"] = {
	["text"] = 		"* NOOOOOOOOO! *",
	["emote"] = "kneel",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."noooo.mp3",
	["duration"] = 7,
};

soundboard_data["stole"] = {
	["text"] = 		"* STOLE MY FLAG! *",
	["msg"] = "chases after their flag thief.",
	["category"] = "Misc",
	["file"] = dir.."stolemybike.mp3",
	["duration"] = 2,
};

soundboard_data["whatislove"] = {
	["text"] = 		"* WHAT IS LOVE? *",
	["msg"] = "swings head back and forth in rhythm.",
	["emote"] = "dance",
	["category"] = "Music",
	["subcategory"] = "Haddaway",
	["file"] = dir.."whatislove.mp3",
	["duration"] = 48,
};

soundboard_data["moskau"] = {
	["text"] = 		"* MOSKAU! MOSKAU! *",
	["msg"] = "does the Russian Moskau dance.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."moskau.mp3",
	["duration"] = 16,
};

soundboard_data["rit9"] = {
	["text"] = 		"* Running in the 90's! *",
	["msg"] = "wants to run in the 90s!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."rit9.mp3",
	["duration"] = 38,
};

soundboard_data["wrists"] = {
	["text"] = 		"* CRAWLING IN MY SKIN! *",
	["msg"] = "slits their wrists.",
	["emote"] = "cry",
	["category"] = "Music",
	["file"] = dir.."crawl.mp3",
	["duration"] = 29,
};

soundboard_data["gog"] = {
	["text"] = 		"* The goggles! They do nothing! *",
	["msg"] = "finds that their goggles do nothing!",
	["category"] = "Movies/TV",
	["subcategory"] = "Simpsons",
	["file"] = dir.."thegoggles.mp3",
	["duration"] = 5,
};

soundboard_data["cotc"] = {
	["text"] = 		"* CORN ON THE COB! *",
	["msg"] = "is hungry.",
	["category"] = "Music",
	["file"] = dir.."cotc.mp3",
	["duration"] = 17,
};

soundboard_data["leek"] = {
	["text"] = 		"* Yaa tsi tsup ari.. *",
	["msg"] = "spins a leek.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."leek.mp3",
	["duration"] = 38,
};

soundboard_data["milks"] = {
	["text"] = 		"* Milkshake! *",
	["msg"] = "claims their milkshake is better.",
	["category"] = "Music",
	["file"] = dir.."milkshake.mp3",
	["duration"] = 10,
};

soundboard_data["pill"] = {
	["text"] = 		"* CRAZY PILLS! *",
	["msg"] = "is going crazy!",
	["emote"] = "roar",
	["category"] = "Movies/TV",
	["file"] = dir.."crazy.mp3",
	["duration"] = 4,
};

soundboard_data["bde"] = {
	["text"] = 		"* Best day ever! *",
	["msg"] = "is having the time of their life!",
	["emote"] = "cheer",
	["category"] = "Movies/TV",
	["file"] = dir.."bde.mp3",
	["duration"] = 9,
};

soundboard_data["ual"] = {
	["text"] = 		"* Chacaron, but unintelligible! *",
	["msg"] = "adsjhfawshfgiuadhsjnads!",
	["emote"] = "drool",
	["category"] = "Internet",
	["file"] = dir.."ualuealue.mp3",
	["duration"] = 10,
};

soundboard_data["epic"] = {
	["text"] =		"* EPIC WoW Maneuver! *",
	["msg"] = "pulls an epic maneuver!",
	["category"] = "World of Warcraft",
	["subcategory"] = "General",
	["file"] = dir.."ghost love score.mp3",
	["duration"] = 24,
};

soundboard_data["nedm"] = {
	["text"] =		"* N E D M *",
	["msg"] = "thinks not even Doom music would make this better.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."nedm.mp3",
	["duration"] = 63,
};
	
soundboard_data["nint64"] = {
	["text"] =		"* OMG NINTENDO SIXTYFOUR!!! *",
	["msg"] = "tears furiously into the loots!",
	["emote"] = "gasp",
	["category"] = "Internet",
	["file"] = dir.."nintendo64.mp3",
	["duration"] = 14,
};

soundboard_data["demon"] = {
	["text"] =		"* ..is a demon slayer *",
	["msg"] = "strikes down his enemies with holy light!",
	["category"] = "Music",
	["file"] = dir.."the mystery song.mp3",
	["duration"] = 32,
};

soundboard_data["wrong"] = {
	["text"] =		"* WRONG!!! *",
	["msg"] = "proves you wrong.",
	["category"] = "Movies/TV",
	["file"] = dir.."wrong.mp3",
	["duration"] = 3,
};

soundboard_data["Correct"] = {
	["text"] = 		"* what are the odds? *",
	["msg"] = "sets the odds at 68.71% chance of being correct.",
	["category"] = "Movies/TV",
	["file"] = dir.."6871.mp3",
	["duration"] = 6,
};

soundboard_data["annoying"] = {
	["text"] = 		"* wanna hear the most annoying noise in the world? *",
	["msg"] = "makes the most annoying noise in the world.",
	["emote"] = "roar",
	["category"] = "Movies/TV",
	["file"] = dir.."ahhhh.mp3",
	["duration"] = 7,
};

soundboard_data["alrighty"] = {
	["text"] = 		"* ALRIGHTY THEN! *",
	["msg"] = "thinks you're an idiot.",
	["category"] = "Movies/TV",
	["file"] = dir.."alrighthen.mp3",
	["duration"] = 3,
};

soundboard_data["offer"] = {
	["text"] = 		"* I\\'m gonna make you an offer you can\\'t refuse. *",
	["msg"] = "makes you an offer you can\\'t refuse.",
	["emote"] = "threaten",
	["category"] = "Movies/TV",
	["file"] = dir.."anoffer.mp3",
	["duration"] = 4,
};

soundboard_data["rsry"] = {
	["text"] = 		"* I'm really really sorry! *",
	["msg"] = "apologises profusely.",
	["category"] = "Misc",
	["file"] = dir.."apology2.mp3",
	["duration"] = 5,
};

soundboard_data["ibb"] = {
	["text"] = 		"* I'll be back! *",
	["msg"] = "vow's his return.",
	["emote"] = "threaten",
	["category"] = "Movies/TV",
	["subcategory"] = "Arnold Swarchenegger",
	["file"] = dir.."arnie.mp3",
	["duration"] = 3,
};

soundboard_data["king"] = {
	["text"] = 		"* I am the king! *",
	["msg"] = "declares his superiority!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."belikeyou.mp3",
	["duration"] = 14,
};

soundboard_data["bing"] = {
	["text"] = 		"* Bing! *",
	["msg"] = "goes bing!",
	["category"] = "Misc",
	["file"] = dir.."bing.mp3",
	["duration"] = 5,
};

soundboard_data["bond"] = {
	["text"] = 		"* The name's Bond, James Bond! *",
	["msg"] = "pretends to be a spy.",
	["category"] = "Movies/TV",
	["file"] = dir.."bond.mp3",
	["duration"] = 5,
};

soundboard_data["buddy"] = {
	["text"] = 		"* Look Buddy! *",
	["msg"] = "gives it some lip.",
	["category"] = "Movies/TV",
	["subcategory"] = "Simpsons",
	["file"] = dir.."buddy.mp3",
	["duration"] = 9,
};

soundboard_data["butthead"] = {
	["text"] = 		"* What you looking at! *",
	["msg"] = "calls you a butthead.",
	["category"] = "Movies/TV",
	["file"] = dir.."butthead.mp3",
	["duration"] = 3,
};

soundboard_data["cbye"] = {
	["text"] = 		"* Kiss my butt goodbye! *",
	["msg"] = "makes his farewells.",
	["category"] = "Movies/TV",
	["subcategory"] = "Simpsons",
	["file"] = dir.."byebye.mp3",
	["duration"] = 5,
};

soundboard_data["leeroychicken"] = {
	["text"] = 		"* At least I have chicken! *",
	["msg"] = "has some chicken.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Leeroy Jenkins",
	["file"] = dir.."leeroychicken.mp3",
	["duration"] = 3,
};

soundboard_data["comply"] = {
	["text"] = 		"* YOU HAVE 20 SECONDS TO COMPLY! *",
	["msg"] = "presses you for action.",
	["category"] = "Movies/TV",
	["file"] = dir.."comply.mp3",
	["duration"] = 4,
};

soundboard_data["devoted"] = {
	["text"] = 		"* I'm hopelessly devoted to you! <vomit> *",
	["msg"] = "is sickeningly ingratiating.",
	["category"] = "Misc",
	["file"] = dir.."devoted.mp3",
	["duration"] = 8,
};

soundboard_data["hulk"] = {
	["text"] = 		"* DONT MAKE ME ANGRY! *",
	["msg"] = "starts to turn green.",
	["category"] = "Movies/TV",
	["file"] = dir.."dontmake.mp3",
	["duration"] = 8,
};

soundboard_data["eeww"] = {
	["text"] = 		"* EEEEEEEeeeewwwwwww! *",
	["msg"] = "is disgusted.",
	["category"] = "Misc",
	["file"] = dir.."eewww.mp3",
	["duration"] = 3,
};

soundboard_data["eheh"] = {
	["text"] = 		"* Eh Eh Eeeeeh! *",
	["msg"] = "prods you with a finger.",
	["category"] = "Misc",
	["file"] = dir.."eheheeh.mp3",
	["duration"] = 3,
};

soundboard_data["elol"] = {
	["text"] = 		"* Mwahahaha! *",
	["msg"] = "laughs with an evil glint in his eye.",
	["category"] = "Misc",
	["file"] = dir.."evillaugh.mp3",
	["duration"] = 4,
};

soundboard_data["comfail"] = {
	["text"] = 		"* We have a failure to communicate! *",
	["msg"] = "is dissapointed at our attempts to interact succesfully.",
	["category"] = "Movies/TV",
	["file"] = dir.."failuretocomm.mp3",
	["duration"] = 7,
};

soundboard_data["feelgood"] = {
	["text"] = 		"* I FEEL GOOD! *",
	["msg"] = "is feeling great.",
	["emote"] = "dance",
	["category"] = "Music",
	["subcategory"] = "James Brown",
	["file"] = dir.."feelgood.mp3",
	["duration"] = 16,
};

soundboard_data["feellucky"] = {
	["text"] = 		"* You gotta ask yourself, do you feel lucky? *",
	["msg"] = "taunts you.",
	["emote"] = "threaten",
	["category"] = "Movies/TV",
	["file"] = dir.."feellucky.mp3",
	["duration"] = 10,
};

soundboard_data["finest"] = {
	["text"] = 		"* This will be our finest hour! *",
	["msg"] = "is filled with confidence.",
	["category"] = "Movies/TV",
	["file"] = dir.."finesthour.mp3",
	["duration"] = 5,
};

soundboard_data["friendship"] = {
	["text"] = 		"* This is the beginnning of a beautiful friendship! *",
	["msg"] = "likes you.",
	["category"] = "Movies/TV",
	["file"] = dir.."friendship.mp3",
	["duration"] = 4,
};

soundboard_data["gdamn"] = {
	["text"] = 		"* G'damnit leeroy! *",
	["msg"] = "accuses you of acting like Leeroy Jenkins.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Leeroy Jenkins",
	["file"] = dir.."gdleeroy.mp3",
	["duration"] = 3,
};

soundboard_data["genius"] = {
	["text"] = 		"* You are a god damn genius!! *",
	["msg"] = "thinks you're pretty smart.",
	["emote"] = "gasp",
	["category"] = "Movies/TV",
	["file"] = dir.."gifted.mp3",
	["duration"] = 8,
};

soundboard_data["chatup"] = {
	["text"] = 		"* Of all the gin joints, in all the world... *",
	["msg"] = "feeds you a sleazy line.",
	["category"] = "Movies/TV",
	["file"] = dir.."ginjoint.mp3",
	["duration"] = 10,
};

soundboard_data["hamster"] = {
	["text"] = 		"* You mother was a hamster! *",
	["msg"] = "laughs at you.",
	["category"] = "Movies/TV",
	["subcategory"] = "Monty Python",
	["file"] = dir.."hamster.mp3",
	["duration"] = 7,
};

soundboard_data["truth"] = {
	["text"] = 		"* YOU CANT HANDLE THE TRUTH! *",
	["msg"] = "laughs at you.",
	["category"] = "Movies/TV",
	["file"] = dir.."handletruth.mp3",
	["duration"] = 4,
};

soundboard_data["hasta"] = {
	["text"] = 		"* Hasta la vista, baby! *",
	["msg"] = "looks menacing.",
	["category"] = "Movies/TV",
	["subcategory"] = "Arnold Swarchenegger",
	["file"] = dir.."hastababy.mp3",
	["duration"] = 4,
};

soundboard_data["hotpussy"] = {
	["text"] = 		"* Here kitty kitty!! *",
	["msg"] = "sings a song.",
	["category"] = "Misc",
	["file"] = dir.."hotpussy.mp3",
	["duration"] = 9,
};

soundboard_data["houston"] = {
	["text"] = 		"* Houston we have a problem! *",
	["msg"] = "shows signs of concern.",
	["category"] = "Movies/TV",
	["file"] = dir.."houstonproblem.mp3",
	["duration"] = 3,
};

soundboard_data["lady"] = {
	["text"] = 		"* I am a lady! *",
	["msg"] = "expresses his femininity.",
	["category"] = "Misc",
	["file"] = dir.."iamlady.mp3",
	["duration"] = 5,
};

soundboard_data["nofault"] = {
	["text"] = 		"* It's not my fault *",
	["msg"] = "pleades innocence.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Leeroy Jenkins",
	["file"] = dir.."innocent.mp3",
	["duration"] = 3,
};

soundboard_data["lookin"] = {
	["text"] = 		"* Here's lookin at you kid! *",
	["msg"] = "gives you a wink.",
	["category"] = "Movies/TV",
	["file"] = dir.."lookin2.mp3",
	["duration"] = 5,
};

soundboard_data["loser"] = {
	["text"] = 		"* LOL YOU LOSER! *",
	["msg"] = "laughs at your moronic actions.",
	["category"] = "Movies/TV",
	["file"] = dir.."loser5.mp3",
	["duration"] = 6,
};

soundboard_data["mission"] = {
	["text"] = 		"* We're on a mission from God! *",
	["msg"] = "looks up at the sky...",
	["category"] = "Movies/TV",
	["file"] = dir.."mission.mp3",
	["duration"] = 5,
};

soundboard_data["mmd"] = {
	["text"] = 		"* Go ahaed! Make my day! *",
	["msg"] = "looks at you menacingly.",
	["category"] = "Movies/TV",
	["file"] = dir.."makemyday.mp3",
	["duration"] = 5,
};

soundboard_data["boyfriend"] = {
	["text"] = 		"* Can't I just have a normal boyfriend? *",
	["msg"] = "screams!",
	["category"] = "Misc",
	["file"] = dir.."normalboyfriend.mp3",
	["duration"] = 9,
};

soundboard_data["ohyeah"] = {
	["text"] = 		"* OH YEAH! *",
	["msg"] = "is the pimp daddy!",
	["emote"] = "dance",
	["category"] = "Misc",
	["file"] = dir.."ohyeah.mp3",
	["duration"] = 3,
};

soundboard_data["onemore"] = {
	["text"] = 		"* You ask me another question... *",
	["msg"] = "looks menacing.",
	["emote"] = "threaten",
	["category"] = "Misc",
	["file"] = dir.."onemorequestion.mp3",
	["duration"] = 4,
};

soundboard_data["panther"] = {
	["text"] = 		"* Smooth baby! *",
	["msg"] = "feels a little pink!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."ppanther.mp3",
	["duration"] = 45,
};

soundboard_data["shag"] = {
	["text"] = 		"* You're shagadelic baby! *",
	["msg"] = "is looking at you groovy!",
	["emote"] = "sexy",
	["category"] = "Movies/TV",
	["subcategory"] = "Austin Powers",
	["file"] = dir.."shagpwr.mp3",
	["duration"] = 6,
};

soundboard_data["shrimp"] = {
	["text"] = 		"* Let's throw another shrimp on the barbie! *",
	["msg"] = "is getting excited!",
	["category"] = "Misc",
	["file"] = dir.."shrimpbarbie.mp3",
	["duration"] = 7,
};

soundboard_data["smokin"] = {
	["text"] = 		"* SMOKIN! *",
	["msg"] = "is smokin!",
	["category"] = "Misc",
	["file"] = dir.."smokin.mp3",
	["duration"] = 3,
};

soundboard_data["survival"] = {
	["text"] = 		"* I'm getting a 32.33 percent chance of survival *",
	["msg"] = "is calculating the odds of success.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Leeroy Jenkins",
	["file"] = dir.."survival.mp3",
	["duration"] = 8,
};

soundboard_data["thinking"] = {
	["text"] = 		"* I'm trying to think, but nothing happens! *",
	["msg"] = "is trying to think.",
	["category"] = "Misc",
	["file"] = dir.."thinking.mp3",
	["duration"] = 3,
};

soundboard_data["tiggers"] = {
	["text"] = 		"* I'm the only one! *",
	["msg"] = "dances like a tigger.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."tiggers.mp3",
	["duration"] = 16,
};

soundboard_data["tree"] = {
	["text"] = 		"* Make like a tree...and get outta here! *",
	["msg"] = "is a bit stupid.",
	["category"] = "Movies/TV",
	["file"] = dir.."tree.mp3",
	["duration"] = 6,
};

soundboard_data["insult1"] = {
	["text"] = 		"* Your head is as empty as a eunoch's underpants! *",
	["msg"] = "insults you.",
	["category"] = "Misc",
	["file"] = dir.."undrpnts.mp3",
	["duration"] = 5,
};

soundboard_data["weakestlink"] = {
	["text"] = 		"* You are the weakest link! *",
	["msg"] = "insults you.",
	["category"] = "Movies/TV",
	["file"] = dir.."weakestlink.mp3",
	["duration"] = 4,
};

soundboard_data["girls"] = {
	["text"] = 		"* Where the white women at? *",
	["msg"] = "is lookin for the laydeez!",
	["category"] = "Movies/TV",
	["file"] = dir.."whitewomen.mp3",
	["duration"] = 3,
};

soundboard_data["favour"] = {
	["text"] = 		"* Why don't you do the world a favour! *",
	["msg"] = "insults you!",
	["category"] = "Misc",
	["file"] = dir.."worldfavor.mp3",
	["duration"] = 6,
};

soundboard_data["yesmom"] = {
	["text"] = 		"* Yes Mommy! *",
	["msg"] = "agrees.",
	["category"] = "Misc",
	["file"] = dir.."yesmom.mp3",
	["duration"] = 3,
};

soundboard_data["theforce"] = {
	["text"] = 		"* The force is with you young skywalker! *",
	["msg"] = "feels your presence.",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."yngskwlk.mp3",
	["duration"] = 9,
};

soundboard_data["father"] = {
	["text"] = 		"* I AM YOUR FATHER! *",
	["msg"] = "is your father.",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."yourfather.mp3",
	["duration"] = 4,
};

soundboard_data["boogie"] = {
	["text"] = 		"* Get down, get down! *",
	["msg"] = "boogies on down.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."Boogie.mp3",
	["duration"] = 48,
};

soundboard_data["gtfo"] = {
	["text"] = 		"* Get the out ma house B! *",
	["msg"] = "politely asks you to leave.",
	["emote"] = "threaten",
	["category"] = "Misc",
	["file"] = dir.."GTFO.mp3",
	["duration"] = 6,
};

soundboard_data["lollipop"] = {
	["text"] = 		"* Sunshine and lollipops!!! *",
	["msg"] = "is elated.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."Lollipops.mp3",
	["duration"] = 99,
};

soundboard_data["makelove"] = {
	["text"] = 		"* I'm gonna make love to you woman!! *",
	["msg"] = "propositions you.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."makelove.mp3",
	["duration"] = 31.0,
};

soundboard_data["iamtheone"] = {
	["text"] = 		"* I AM THE ONE AND ONLY! *",
	["msg"] = "is Chesney Hawks.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."OneOnly.mp3",
	["duration"] = 18,
};

soundboard_data["bikini"] = {
	["text"] = 		"* Check my bikini! *",
	["msg"] = "shows of their new bikini.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."itsybitsy.mp3",
	["duration"] = 41,
};

soundboard_data["startrek"] = {
	["text"] = 		"* Star Trekking accross the universe! *",
	["msg"] = "is a tekky!",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."StarTrek.mp3",
	["duration"] = 60,
};

soundboard_data["stayalive"] = {
	["text"] = 		"* Ah, ah ah ah stayin alive!! *",
	["msg"] = "looks like John Trovolta.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."StayAlive.mp3",
	["duration"] = 60,
};

soundboard_data["wurzel"] = {
	["text"] = 		"* I got a brand new combine harvester! *",
	["msg"] = "is a tube. Oh dear!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."Wurzel.mp3",
	["duration"] = 46,
};

--BLERIC'S

soundboard_data["jeopardy"] = {
	["text"] = 		"* doo doo DOOOO doo *",
	["msg"] = "plays the jeopardy song.",
	["category"] = "Movies/TV",
	["file"] = dir.."jeopardy.mp3",
	["duration"] = 33,
};

soundboard_data["peewee"] = {
	["text"] = 		"* Pee wee speaking! *",
	["msg"] = "is silly",
	["category"] = "Movies/TV",
	["subcategory"] = "Pee wee",
	["file"] = dir.."peewee.mp3",
	["duration"] = 4,
};

soundboard_data["peeweelol"] = {
	["text"] = 		"* ha ha ha! AAHH!! ha ha! *",
	["msg"] = "laughs",
	["category"] = "Movies/TV",
	["subcategory"] = "Pee wee",
	["file"] = dir.."pwlaugh.mp3",
	["duration"] = 8,
};

soundboard_data["peeweela"] = {
	["text"] = 		"* LAALAALAALAALAALAALAAA! *",
	["msg"] = "acts silly",
	["category"] = "Movies/TV",
	["subcategory"] = "Pee wee",
	["file"] = dir.."peeweela.mp3",
	["duration"] = 5,
};

soundboard_data["billnye"] = {
	["text"] = 		"* Inertia is a property of matter *",
	["msg"] = "thinks science is cool",
	["category"] = "Movies/TV",
	["file"] = dir.."billnye.mp3",
	["duration"] = 31,
};

soundboard_data["goofed"] = {
	["text"] = 		"* I'm sorry Will Robinson... *",
	["emote"] = "sorry",
	["category"] = "Movies/TV",
	["file"] = dir.."goofed.mp3",
	["duration"] = 5,
};

soundboard_data["melted"] = {
	["text"] = 		"* My intelligence circuits have melted *",
	["msg"] = "wants to take a break",
	["category"] = "Movies/TV",
	["file"] = dir.."melted.mp3",
	["duration"] = 6,
};

soundboard_data["hibaby"] = {
	["text"] = 		"* HELLOOOO BABY! *",
	["msg"] = "is feeling lucky",
	["category"] = "Misc",
	["file"] = dir.."hibaby.mp3",
	["duration"] = 4,
};

soundboard_data["cbsmail"] = {
	["text"] = 		"* Lets open... *",
	["msg"] = "wonders what's in the mail",
	["category"] = "Misc",
	["file"] = dir.."cbsmail.mp3",
	["duration"] = 5,
};

soundboard_data["gomer"] = {
	["text"] = 		"* Gomer Pile! *",
	["msg"] = "sings the Gomer Pile theme song",
	["category"] = "Music",
	["file"] = dir.."gomer.mp3",
	["duration"] = 28,
};

soundboard_data["hatedit"] = {
	["text"] = 		"* HATED IT *",
	["emote"] = "no",
	["category"] = "Misc",
	["file"] = dir.."hatedit.mp3",
	["duration"] = 2,
};

soundboard_data["yourewrong"] = {
	["text"] = 		"* What you have done... *",
	["emote"] = "no",
	["category"] = "Misc",
	["file"] = dir.."lis-wrng.mp3",
	["duration"] = 4,
};

soundboard_data["cop"] = {
	["text"] = 		"* I'm a COP, you idiot *",
	["msg"] = "is angry",
	["category"] = "Movies/TV",
	["subcategory"] = "Arnold Swarchenegger",
	["file"] = dir.."cop.mp3",
	["duration"] = 3,
};

soundboard_data["stopit"] = {
	["text"] = 		"* STOP IT *",
	["emote"] = "angry",
	["msg"] = "wants you to stop.",
	["category"] = "Movies/TV",
	["subcategory"] = "Arnold Swarchenegger",
	["file"] = dir.."stopit.mp3",
	["duration"] = 3,
};

soundboard_data["kma"] = {
	["text"] = 		"* Kiss my ass. *",
	["msg"] = "wants you to kiss his ass.",
	["category"] = "Misc",
	["file"] = dir.."puckerup.mp3",
	["duration"] = 4,
};

soundboard_data["luvya"] = {
	["text"] = 		"* I love ya man *",
	["emote"] = "love",
	["category"] = "Misc",
	["file"] = dir.."luvyaman.mp3",
	["duration"] = 3,
};

soundboard_data["twilight"] = {
	["text"] = 		"* You're traveling to another dimension *",
	["msg"] = "enters the twilight zone",
	["category"] = "Movies/TV",
	["file"] = dir.."twilight.mp3",
	["duration"] = 18,
};

soundboard_data["flipper"] = {
	["text"] = 		"* EE EEEE EE E *",
	["msg"] = "squeeks",
	["category"] = "Movies/TV",
	["file"] = dir.."flipper.mp3",
	["duration"] = 4,
};

soundboard_data["appl"] = {
	["text"] = 		"* Bravo! *",
	["emote"] = "applaud",
	["category"] = "Misc",
	["file"] = dir.."applause.mp3",
	["duration"] = 9,
};

soundboard_data["violent"] = {
	["text"] = 		"* Parental discretion is advised *",
	["msg"] = "warns everyone around him.",
	["category"] = "Misc",
	["file"] = dir.."violent.mp3",
	["duration"] = 5,
};

soundboard_data["saber1"] = {
	["text"] = 		"* KSSHHH wooOOooo*",
	["msg"] = "pulls out his lightsaber",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."saber1.mp3",
	["duration"] = 4,
};

soundboard_data["saber2"] = {
	["text"] = 		"* WHOOM KSHH WHOM KSHH KSHH*",
	["msg"] = "is a jedi",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."saber2.mp3",
	["duration"] = 4,
};

soundboard_data["chocolate"] = {
	["text"] = "* Some stay dry and others feel the pain *",
	["msg"] = "sings",
	["emote"] = "dance", 
	["category"] = "Music",
	["file"] = dir.."Chocolate_Rain.mp3",
	["duration"] = 32,
};

--FIREWALL

soundboard_data["excellent"] = {
	["text"] = 		"* Excellent. Yeeessss! *",
	["msg"] = "is unbeatable! ",
	["category"] = "Misc",
	["file"] = dir.."megatron.mp3",
	["duration"] = 4,
};

soundboard_data["llap"] = {
	["text"] = 		"* Live long and prosper. *",
	["msg"] = "gives you the Vulcan hand sign. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."llap.mp3",
	["duration"] = 3,
};

soundboard_data["rollout"] = {
	["text"] = 		"* Autobots, transform and roll out. *",
	["msg"] = "tells everyone to rollout. ",
	["category"] = "Movies/TV",
	["file"] = dir.."rollout.mp3",
	["duration"] = 11,
};

soundboard_data["darkside"] = {
	["text"] = 		"* You don't know the power of the dark side. *",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["msg"] = "tempts you with the dark side. ",
	["file"] = dir.."darkside.mp3",
	["duration"] = 6,
};

soundboard_data["bigboned"] = {
	["text"] = 		"* I\\'m not fat. I\\'m big boned. *",
	["msg"] = "is just big boned. ",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."bigboned.mp3",
	["duration"] = 4,
};

soundboard_data["thepulse"] = {
	["text"] = 		"* Here\\'s the pulse. Here\\'s your finger.  *",
	["msg"] = "tells you to get your finger out of there. ", 
	["category"] = "Misc",
	["file"] = dir.."thepulse.mp3",
	["duration"] = 8,
};

soundboard_data["chewy"] = {
	["text"] = 		"* Raaaaaawwwwwww. *",
	["msg"] = "makes a wookie sound. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."chewy.mp3",
	["duration"] = 2,
};

soundboard_data["donthug"] = {
	["text"] = 		"* Do not hug me. *",
	["msg"] = "tells you not to hug him. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."donthug.mp3",
	["duration"] = 2,
};

soundboard_data["redalert"] = {
	["text"] = 		"* Red Alert. Battle stations. *",
	["msg"] = "commands you to go to your battle station. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."redalert.mp3",
	["duration"] = 6,
};

soundboard_data["jasb1"] = {
	["text"] = 		"* Jay and Silent Bob are in the house! *",
	["msg"] = "is stoned. ",
	["category"] = "Movies/TV",
	["file"] = dir.."jasb1.mp3",
	["duration"] = 10,
};

soundboard_data["trynot"] = {
	["text"] = 		"* Do, or do not. There is no try. *",
	["msg"] = "becomes possessed by Yoda. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."trynot.mp3",
	["duration"] = 4,
};

soundboard_data["prime"] = {
	["text"] = 		"* Well, that's just Prime. *",
	["msg"] = "looks annoyed. ",
	["category"] = "Misc",
	["file"] = dir.."prime.mp3",
	["duration"] = 4,
};

soundboard_data["info"] = {
	["text"] = 		"* I'm the boss..... Need the info.... *",
	["msg"] = "wants to know what's going on. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Austin Powers",
	["file"] = dir.."info.mp3",
	["duration"] = 7,
};

soundboard_data["poc"] = {
	["text"] = 		"* THE POWER OF CHRIST COMPELS YOU! *",
	["msg"] = "tries to get the demons out of you. ",
	["category"] = "Misc",
	["file"] = dir.."powerofchrist.mp3",
	["duration"] = 8,
};

soundboard_data["father"] = {
	["text"] = 		"* I am your father. *",
	["msg"] = "tells you who your dad is. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["file"] = dir.."vaderfather.mp3",
	["duration"] = 4,
};

soundboard_data["scumbag"] = {
	["text"] = 		"* Were you born a scumbag? *",
	["msg"] = "thinks you're a scumbag.",
	["category"] = "Movies/TV",
	["file"] = dir.."bornscumbag.mp3",
	["duration"] = 7,
};

soundboard_data["vagin"] = {
	["text"] = 		"* I want entry to your vagin. *",
	["msg"] = "asks you how much you want. ",
	["category"] = "Movies/TV",
	["file"] = dir.."entrytovagin.mp3",
	["duration"] = 9,
};

soundboard_data["gotohell"] = {
	["text"] = 		"* If I were human... *",
	["msg"] = "tells you to go to hell. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."gotohell.mp3",
	["duration"] = 8,
};

soundboard_data["balls"] = {
	["text"] = 		"* I think you need your balls reattached. *",
	["category"] = "Misc",
	["file"] = dir.."reattached.mp3",
	["duration"] = 3,
};

soundboard_data["ssfart"] = {
	["text"] = 		"* Surround sound fart! *",
	["msg"] = "farts all around you. ",
	["emote"] = "fart",
	["category"] = "Misc",
	["file"] = dir.."fart.mp3",
	["duration"] = 12,
};

soundboard_data["suck"] = {
	["text"] = 		"* You Suck! *",
	["category"] = "Video Games",
	["subcategory"] = "Duke Nukem",
	["file"] = dir.."yousuck.mp3",
	["duration"] = 3,
};

soundboard_data["gum"] = {
	["text"] = 		"* I'm here to kick ass and chew bubblegum. *",
	["category"] = "Video Games",
	["subcategory"] = "Duke Nukem",
	["file"] = dir.."gum.mp3",
	["duration"] = 6,
};

soundboard_data["cgs"] = {
	["text"] = 		"* Come get some! *",
	["category"] = "Video Games",
	["subcategory"] = "Duke Nukem",
	["file"] = dir.."cgs.mp3",
	["duration"] = 3,
};

soundboard_data["httk"] = {
	["text"] = 		"* Hail to the king, baby. *",
	["category"] = "Video Games",
	["subcategory"] = "Duke Nukem",
	["file"] = dir.."httk.mp3",
	["duration"] = 3,
};

soundboard_data["gas"] = {
	["text"] = 		"* GASEOUS SUBSTANCE DETECTED *",
	["msg"] = "sniffs at you. ",
	["category"] = "Misc",
	["file"] = dir.."gas.mp3",
	["duration"] = 3,
};

--NITROS

soundboard_data["db"] = {
	["text"] = 		"* Dont you have some poor defenseless animal to Disembowl! *",
	["category"] = "Movies/TV",
	["msg"] = "disembowels you! ",
	["file"] = dir.."db.mp3",
	["duration"] = 6,
};

soundboard_data["troops"] = {
	["text"] = 		"* Alert the troops, We attack at dawn. *",
	["msg"] = "Orders you to prepare for an attack. ",
	["category"] = "Movies/TV",
	["file"] = dir.."troops.mp3",
	["duration"] = 5,
};

soundboard_data["victory"] = {
	["text"] = 		"* Victory is mine. *",
	["msg"] = "thinks that you just got pwned. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."victory.mp3",
	["duration"] = 3,
};

soundboard_data["xfile"] = {
	["text"] = 		"* X FILES *",
	["msg"] = "wonders why allys would do this. ",
	["category"] = "Movies/TV",
	["file"] = dir.."xfile.mp3",
	["duration"] = 12,
};

soundboard_data["brain"] = {
	["text"] = 		"* Alright brain, you don\\'t like me and I don\\'t like you... *",
	["msg"] = "continues drinking. ",
	["emote"] = "drink",
	["category"] = "Movies/TV",
	["subcategory"] = "Simpsons",
	["file"] = dir.."brain.mp3",


	["duration"] = 10,
};

soundboard_data["rosham"] = {
	["text"] = 		"* Wants to roshambo you for it. *",
	["msg"] = "challenges you to a rhoshambo contest. ",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."rosham.mp3",
	["duration"] = 29,
};

soundboard_data["blade"] = {
	["text"] = 		"* Enters the Thrall Techno Club. *",
	["emote"] = "dance",
	["category"] = "World of Warcraft",
	["subcategory"] = "Characters",
	["file"] = dir.."blade.mp3",
	["duration"] = 44,
};

soundboard_data["despicable"] = {
	["text"] = 		"* Youre Despicable. *",
	["msg"] = "frowns upon you. ",
	["category"] = "Movies/TV",
	["file"] = dir.."despicable.mp3",
	["duration"] = 4,
};

soundboard_data["damned"] = {
	["text"] = 		"* Your damned if your do, your damned if you dont. *",
	["msg"] = "gives up. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Simpsons",
	["file"] = dir.."damned.mp3",
	["duration"] = 4,
};

soundboard_data["ious"] = {
	["text"] = 		"* Its official you Suck! *",
	["msg"] = "laughs at how bad you suck. ",
	["category"] = "Video Games",
	["file"] = dir.."IOUS.mp3",
	["duration"] = 5,
};

soundboard_data["donotgo"] = {
	["text"] = 		"* Do not go in there. *",
	["msg"] = "pulls up pants after taking a huge dump. ",
	["category"] = "Misc",
	["file"] = dir.."donotgo.mp3",
	["duration"] = 5,
};

soundboard_data["numnuts"] = {
	["text"] = 		"* What is your major malfunction Numnuts*",
	["msg"] = "slaps you silly and tells you to drop and give him 20. ",
	["category"] = "Movies/TV",
	["file"] = dir.."numnuts.mp3",
	["duration"] = 5,
};

soundboard_data["to"] = {
	["text"] = 		"* WE'RE TRYING TO TAKE OVER THE WORLD*",
	["category"] = "Movies/TV",
	["file"] = dir.."to.mp3",
	["duration"] = 6,
};

soundboard_data["beback"] = {
	["text"] = 		"* I'll be back. *",
	["msg"] = "threatens you with the wrath of thrall. ",
	["category"] = "Movies/TV",
	["subcategory"] = "Arnold Swarchenegger",
	["file"] = dir.."beback.mp3",
	["duration"] = 3,
};

soundboard_data["hasta"] = {
	["text"] = 		"* Hasta La Vista Baby. *",
	["emote"] = "wave",
	["category"] = "Movies/TV",
	["file"] = dir.."hasta.mp3",
	["duration"] = 4,
};

soundboard_data["mkedit"] = {
	["text"] = 		"* Test your might. *",
	["emote"] = "flex",
	["category"] = "Music",
	["file"] = dir.."mkedit.mp3",
	["duration"] = 54,
};

soundboard_data["pg"] = {
	["text"] = 		"* Pussy gnomes. *",
	["msg"] = "kicks the gnome, OH going, going gone. TOUCHDOWN. ",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."pg.mp3",
	["duration"] = 5,
};

soundboard_data["chefsong"] = {
	["text"] = 		"* They're big and salty and brown *",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."chefsong.mp3",
	["duration"] = 17,
};

soundboard_data["smellslikeass"] = {
	["text"] = 		"* Oh man it smells like ass *",
	["emote"] = "smell",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."smellslikeass.mp3",
	["duration"] = 6,
};

soundboard_data["pussy"] = {
	["text"] = 		"* Is that all you got pussy. *",
	["emote"] = "beckon",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."pussy.mp3",
	["duration"] = 9,
};

soundboard_data["bologna"] = {
	["text"] = 		"* Taking a ride on the bologna pony! *",
	["emote"] = "cheer",
	["category"] = "Movies/TV",
	["file"] = dir.."bologna.mp3",
	["duration"] = 7,
};

soundboard_data["witchtit"] = {
	["text"] = 		"* It\\'s colder than a witch\\'s titty... *",
	["emote"] = "shivers",
	["category"] = "Movies/TV",
	["file"] = dir.."witchtit.mp3",
	["duration"] = 5,
};

soundboard_data["salami"] = {
	["text"] = 		"* Slipping her the old salami. *",
	["emote"] = "cheer",
	["category"] = "Movies/TV",
	["file"] = dir.."salami.mp3",
	["duration"] = 9,
};

soundboard_data["tunatown"] = {
	["text"] = 		"* Taking the skin boat to tuna town! *",
	["emote"] = "cheer",
	["category"] = "Movies/TV",
	["file"] = dir.."tunatown.mp3",
	["duration"] = 7,
};

soundboard_data["rabies"] = {
	["text"] = 		"* It bit me. *",
	["category"] = "Misc",
	["file"] = dir.."rabies.mp3",
	["duration"] = 5,
};

soundboard_data["sayhello"] = {
	["text"] = 		"* Say hello to my little friend. *",
	["category"] = "Movies/TV",
	["emote"] = "roar",
	["file"] = dir.."sayhello.mp3",
	["duration"] = 6,
};

soundboard_data["belly"] = {
	["text"] = 		"* Get In my belly. *",
	["category"] = "Movies/TV",
	["subcategory"] = "Austin Powers",
	["emote"] = "roar",
	["file"] = dir.."belly.mp3",
	["duration"] = 4,
};

soundboard_data["bleep"] = {
	["text"] = 		"* CENSORED *",
	["category"] = "Misc",
	["emote"] = "gasp",
	["file"] = dir.."bleep.mp3",
	["duration"] = 12,
};

soundboard_data["darkpower"] = {
	["text"] = 		"* If you only knew the power of the darkside*",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Wars",
	["emote"] = "",
	["file"] = dir.."darkpower.mp3",
	["duration"] = 6,
};

soundboard_data["shutup"] = {
	["text"] = 		"* Hahahaha SHUT UP*",
	["category"] = "Movies/TV",
	["emote"] = "",
	["file"] = dir.."haha.mp3",
	["duration"] = 5,
};

soundboard_data["missionimp"] = {
	["text"] = 		"* Goes into stealth mode*",
	["category"] = "Movies/TV",
	["emote"] = "",
	["file"] = dir.."missionimp.mp3",
	["duration"] = 32,
};

soundboard_data["mining"] = {
	["text"] = 		"* Day is never finished. Masters got me working. *",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["emote"] = "",
	["file"] = dir.."mining.mp3",
	["duration"] = 9,
};

--More sounds gathered by Bleric:

soundboard_data["cookie"] = {
	["text"] = 		"* Om nom nom nom nom! *",
	["emote"] = "eat",
	["category"] = "Misc",
	["file"] = dir.."meeatcookie.mp3",
	["duration"] = 10,
};

soundboard_data["powerlevel"] = {
	["text"] = 		"* What's his power level? *",
	["emote"] = "ponder",
	["category"] = "Movies/TV",
	["subcategory"] = "Dragon Ball Z",
	["file"] = dir.."vegeta.mp3",
	["duration"] = 5,
};

soundboard_data["over9000"] = {
	["text"] = 		"* IT'S OVER 9000!! *",
	["emote"] = "gasp",
	["category"] = "Movies/TV",
	["subcategory"] = "Dragon Ball Z",
	["file"] = dir.."over9000.mp3",
	["duration"] = 4,
};

soundboard_data["flame"] = {
	["text"] = 		"* DO NOT MOVE! *",
	["msg"] = "will not move when flame wreath is cast.",
	["emote"] = "kneel",
	["category"] = "World of Warcraft",
	["subcategory"] = "Raids",
	["file"] = dir.."flamewreathshort.mp3",
	["duration"] = 17,
};

soundboard_data["flamelong"] = {
	["text"] = 		"* I will not move when flame wreath is cast *",
	["msg"] = "will not move when flame wreath is cast.",
	["emote"] = "kneel",
	["category"] = "World of Warcraft",
	["subcategory"] = "Raids",
	["file"] = dir.."flame.mp3",
	["duration"] = 100,
};

soundboard_data["oc"] = {
	["text"] = "* Mmmm, watchya saayay *",
	["msg"] = "shoots a friend.",
	["emote"] = "cry",
	["category"] = "Music",
	["file"] = dir.."hideandseek.mp3",
	["duration"] = 33,
};

soundboard_data["cake"] = {
	["text"] = "* It's a piece of cake! *",
	["emote"] = "eat",
	["msg"] = "loves cake!",
	["category"] = "Music",
	["file"] = dir.."cake.mp3",
	["duration"] = 30,
};

soundboard_data["take"] = {
	["text"] = "* GIVE THEM NOTHING *",
	["emote"] = "roar",
	["msg"] = "is ready to TAKE FROM THEM EVERYTHING",
	["category"] = "Movies/TV",
	["subcategory"] = "300",
	["file"] = dir.."givethemnothing.mp3",
	["duration"] = 7,
};

soundboard_data["party1"] = {
	["text"] = "* When it's time to party *",
	["emote"] = "dance",
	["msg"] = "is ready to PARTY",
	["category"] = "Music",
	["file"] = dir.."party1.mp3",
	["duration"] = 29,
};

soundboard_data["party2"] = {
	["text"] = "* We do what we like! *",
	["emote"] = "dance",
	["msg"] = "likes what he does!",
	["category"] = "Music",
	["file"] = dir.."party2.mp3",
	["duration"] = 37,
};

soundboard_data["party3"] = {
	["text"] = "* Let's get a party going! *",
	["emote"] = "dance",
	["msg"] = "will always party hard!",
	["category"] = "Music",
	["file"] = dir.."party3.mp3",
	["duration"] = 14,
};

soundboard_data["picard"] = {
	["text"] = "* Captain Jean Luc Picard. *",
	["emote"] = "dance",
	["msg"] = "of the USS. Enterprise",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."picard.mp3",
	["duration"] = 9,
};

soundboard_data["picardlong"] = {
	["text"] = "* Captain.  Jean Luc Picard. *",
	["emote"] = "dance",
	["msg"] = "of the USS. Enterprise",
	["category"] = "Movies/TV",
	["subcategory"] = "Star Trek",
	["file"] = dir.."picardlong.mp3",
	["duration"] = 65,
};

soundboard_data["rickroll"] = {
	["text"] = "* RICKROLLED! *",
	["emote"] = "dance",
	["msg"] = "rickrolls you!",
	["category"] = "Music",
	["file"] = dir.."rickroll.mp3",
	["duration"] = 31.0,
};

soundboard_data["portal"] = {
	["text"] = "* for the people who are still alive *",
	["emote"] = "dance",
	["category"] = "Video Games",
	["file"] = dir.."portal.mp3",
	["duration"] = 23,
};

soundboard_data["dine"] = {
	["text"] = "* SPARTANS *",
	["emote"] = "eat",
	["msg"] = "is ready to DINE IN HELL",
	["category"] = "Movies/TV",
	["subcategory"] = "300",
	["file"] = dir.."spartans.mp3",
	["duration"] = 8,
};

soundboard_data["trap"] = {
	["text"] = "* It's a trap! *",
	["emote"] = "gasp",
	["msg"] = "has walked into a trap!",
	["category"] = "Internet",
	["file"] = dir.."trap.mp3",
	["duration"] = 2,
};

soundboard_data["bright"] = {
	["text"] = "* Always look on the bright side of life! *",
	["emote"] = "dance",
	["msg"] = "is feeling optimistic!",
	["category"] = "Movies/TV",
	["subcategory"] = "Monty Python",
	["file"] = dir.."brightside.mp3",
	["duration"] = 39,
};

soundboard_data["chickendance"] = {
	["text"] = "* So kiss my butt! *",
	["emote"] = "chicken",
	["msg"] = "doesn't want to be a chicken!",
	["category"] = "Music",
	["file"] = dir.."chickendance.mp3",
	["duration"] = 21,
};

soundboard_data["getup"] = {
	["text"] = "* But I get up again! *",
	["emote"] = "dance",
	["msg"] = "gets knocked down!",
	["category"] = "Music",
	["file"] = dir.."chumbawamba.mp3",
	["duration"] = 21,
};

soundboard_data["dontstop"] = {
	["text"] = "* Don't stop me now! *",
	["emote"] = "dance",
	["msg"] = "is having such a good time!",
	["category"] = "Music",
	["subcategory"] = "Queen",
	["file"] = dir.."dontstop.mp3",
	["duration"] = 24,
};

soundboard_data["dontstop2"] = {
	["text"] = "* I'm a rocket ship, on my way to mars! *",
	["emote"] = "dance",
	["msg"] = "is a sex machine, ready to reload!",
	["category"] = "Music",
	["subcategory"] = "Queen",
	["file"] = dir.."dontstop2.mp3",
	["duration"] = 32,
};
soundboard_data["footloose"] = {
	["text"] = "* Kick off your Sunday shoes! *",
	["emote"] = "dance",
	["msg"] = "has to cut loose!",
	["category"] = "Music",
	["file"] = dir.."footloose.mp3",
	["duration"] = 27,
};
soundboard_data["getdown"] = {
	["text"] = "* Get down tonight! *",
	["emote"] = "dance",
	["msg"] = "does a little dance.",
	["category"] = "Music",
	["subcategory"] = "KC and the Sunshine Band",
	["file"] = dir.."getdown.mp3",
	["duration"] = 36,
};

soundboard_data["getdown2"] = {
	["text"] = "* Get down tonight baby! *",
	["emote"] = "dance",
	["msg"] = "gets down.",
	["category"] = "Music",
	["subcategory"] = "KC and the Sunshine Band",
	["file"] = dir.."getdown2.mp3",
	["duration"] = 27,
};
soundboard_data["hooked"] = {
	["text"] = "* Iiiii'm hooked on a feeling! *",
	["emote"] = "dance",
	["msg"] = "is in love.",
	["category"] = "Music",
	["file"] = dir.."hookedonafeeling.mp3",
	["duration"] = 37,
};

soundboard_data["ketchup"] = {
	["text"] = "* KETCHUP SONG *",
	["emote"] = "dance",
	["msg"] = "asereje ja de je de jebe tu de jebere seibiunouva, majavi an de bugui an de buididipi!",
	["category"] = "Music",
	["file"] = dir.."ketchup.mp3",
	["duration"] = 30,
};

soundboard_data["kitty"] = {
	["text"] = "* And I dance dance dance! *",
	["emote"] = "dance",
	["msg"] = "is a kitty cat.",
	["category"] = "Internet",
	["file"] = dir.."kittycat.mp3",
	["duration"] = 8,
};

soundboard_data["macarena"] = {
	["text"] = "* MACARENA *",
	["emote"] = "dance",
	["msg"] = "does the macarena.",
	["category"] = "Music",
	["file"] = dir.."macarena.mp3",
	["duration"] = 20,
};

soundboard_data["magic"] = {
	["text"] = "* Oh, ho, ho, it's magic! *",
	["emote"] = "dance",
	["msg"] = "does a little magic.",
	["category"] = "Music",
	["file"] = dir.."magic.mp3",
	["duration"] = 24,
};

soundboard_data["mambo"] = {
	["text"] = "* One, two, three four five! *",
	["emote"] = "dance",
	["msg"] = "is a pimp.",
	["category"] = "Music",
	["file"] = dir.."mambo.mp3",
	["duration"] = 30,
};

soundboard_data["mtrain"] = {
	["text"] = "* My baby takes the morning train! *",
	["emote"] = "train",
	["msg"] = "is in love.",
	["category"] = "Music",
	["file"] = dir.."morningtrain.mp3",
	["duration"] = 17,
};

soundboard_data["ooga"] = {
	["text"] = "* OOGACHAKA *",
	["msg"] = "grunts.",
	["category"] = "Misc",
	["file"] = dir.."ooga.mp3",
	["duration"] = 10,
};

soundboard_data["l2p"] = {
	["text"] = "* LEARN 2 PLAY *",
	["emote"] = "dance",
	["msg"] = "demands that you play wow every day.",
	["category"] = "World of Warcraft",
	["subcategory"] = "General",
	["file"] = dir.."playwow.mp3",
	["duration"] = 18,
};

soundboard_data["tequila"] = {
	["text"] = "* Tequila! *",
	["emote"] = "drink",
	["category"] = "Music",
	["file"] = dir.."tequila.mp3",
	["duration"] = 23,
};

soundboard_data["touch"] = {
	["text"] = "* When I think about you *",
	["msg"] = "loves you.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."touchmyself.mp3",
	["duration"] = 10,
};

soundboard_data["sunshine"] = {
	["text"] = "* I'm walking on sunshine! *",
	["msg"] = "is elated!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."walkingonsunshine.mp3",
	["duration"] = 24,
};

soundboard_data["iamagod"] = {
	["text"] = "* Yes! I am a GOD! *",
	["msg"] = "is a god!",
	["emote"] = "roar",
	["category"] = "World of Warcraft",
	["subcategory"] = "NPCs",
	["file"] = "Sound\\Creature\\SelimFireheart\\SELIMEMPOWERED.mp3",
	["duration"] = 4.0,
};

soundboard_data["badger"] = {
	["text"] = "* Badger, badger, badger, badger... *",
	["msg"] = "is afraid of snakes",
	["emote"] = "dance",
	["category"] = "Internet",
	["file"] = dir.."badgerbadgerbadger.mp3",
	["duration"] = 38,
};

soundboard_data["caramell"] = {
	["text"] = "* Oo! Oo! Oo ah oo ah! *",
	["msg"] = "is elated!",
	["emote"] = "dance",
	["category"] = "Internet",
	["file"] = dir.."caramelldansen.mp3",
	["duration"] = 26,
};

soundboard_data["carryon"] = {
	["text"] = "* Carry on my wayward son! *",
	["msg"] = "doesn't want you to cry anymore.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."carryon.mp3",
	["duration"] = 47,
};

soundboard_data["donttazeme"] = {
	["text"] = "* Don't taze me bro! *",
	["msg"] = "doesn't like being tazed.",
	["emote"] = "laydown",
	["category"] = "Internet",
	["file"] = dir.."donttazemebro.mp3",
	["duration"] = 3,
};

soundboard_data["dota"] = {
	["text"] = "* Vi sitter har i venten och spelar lite DotA *",
	["msg"] = "is ready to play some DotA.",
	["emote"] = "dance",
	["category"] = "Video Games",
	["file"] = dir.."dota.mp3",
	["duration"] = 37,
};

soundboard_data["hard"] = {
	["text"] = "* Grind, baby, grind, baby *",
	["emote"] = "dance",
	["category"] = "World of Warcraft",
	["subcategory"] = "General",
	["file"] = dir.."hardlikeheroic.mp3",
	["duration"] = 11.0,
};

soundboard_data["hard2"] = {
	["text"] = "* Hard like heroic, more than you can handle *",
	["msg"] = "wants do do it like a druid in the general channel",
	["emote"] = "dance",
	["category"] = "World of Warcraft",
	["subcategory"] = "General",
	["file"] = dir.."hardlikeheroic2.mp3",
	["duration"] = 11.0,
};

soundboard_data["hard4"] = {
	["text"] = "* I think your wii's the one for me! *",
	["msg"] = "just wants the trial.",
	["emote"] = "dance",
	["category"] = "Internet",
	["file"] = dir.."hardlikeheroic4.mp3",
	["duration"] = 11.0,
};

soundboard_data["hereitgoes"] = {
	["text"] = "* Here it goes! Here it goes again! *",
	["msg"] = "dances on some treadmills.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."hereitgoesagain.mp3",
	["duration"] = 42,
};

soundboard_data["hollaback"] = {
	["text"] = "* I ain't no holla back girl *",
	["msg"] = "has been around that track.",
	["emote"] = "no",
	["category"] = "Music",
	["file"] = dir.."HollaBack.mp3",
	["duration"] = 21,
};

soundboard_data["bananas"] = {
	["text"] = "* B A N A N A S *",
	["msg"] = "thinks this is BANANAS",
	["emote"] = "confused",
	["category"] = "Music",
	["file"] = dir.."HollaBackBananas.mp3",
	["duration"] = 10,
};

soundboard_data["emo"] = {
	["text"] = "* IT DOESN'T EVEN MAATTEERRR *",
	["msg"] = "watches a Dragon Ball Z video on youtube.",
	["emote"] = "cry",
	["category"] = "Music",
	["file"] = dir.."intheend.mp3",
	["duration"] = 21,
};

soundboard_data["itsmylife"] = {
	["text"] = "* It's my life! *",
	["msg"] = "won't live forever!",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."itsmylife.mp3",
	["duration"] = 63,
};

soundboard_data["livetowin"] = {
	["text"] = "* Live! To! Win! 'Till you die! *",
	["msg"] = "is ready to grind on some boars!",
	["emote"] = "flex",
	["category"] = "Music",
	["file"] = dir.."livetowin.mp3",
	["duration"] = 40,
};

soundboard_data["numa"] = {
	["text"] = "* Numa numa yay! *",
	["msg"] = "is an internet phenomenon!",
	["emote"] = "dance",
	["category"] = "Internet",
	["file"] = dir.."numanuma.mp3",
	["duration"] = 16,
};

soundboard_data["numalong"] = {
	["text"] = "* Mai ya heee! Mai ya hooo! *",
	["msg"] = "is an internet phenomenon!",
	["emote"] = "dance",
	["category"] = "Internet",
	["file"] = dir.."numanumalong.mp3",
	["duration"] = 99,
};

soundboard_data["pbj"] = {
	["text"] = "* It's peanut butter jelly time! *",
	["msg"] = "wants to know where you at.",
	["emote"] = "dance",
	["category"] = "Internet",
	["file"] = dir.."pbj.mp3",
	["duration"] = 25,
};

soundboard_data["tarzan"] = {
	["text"] = "* Oh oh ooaoaoo aah! Oh oh ah! *",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."tarzanboy.mp3",
	["duration"] = 19,
};

soundboard_data["thebest"] = {
	["text"] = "* You're the best! Around! *",
	["emote"] = "dance",
	["msg"] = "is in the middle of an 80s montage.",
	["category"] = "Music",
	["file"] = dir.."yourethebest.mp3",
	["duration"] = 19,
};

soundboard_data["surprise"] = {
	["text"] = "* SURPRISE *",
	["emote"] = "pounce",
	["msg"] = "is one angry person.",
	["category"] = "Movies/TV",
	["file"] = dir.."surprisemothafucka.mp3",
	["duration"] = 3,
};

soundboard_data["bankai"] = {
	["text"] = "* Bankai... Tensa Zangetsu! *",
	["category"] = "Movies/TV",
	["subcategory"] = "Bleach",
	["file"] = dir.."kurrosaki.mp3",
	["duration"] = 19,
};

soundboard_data["bankai2"] = {
	["text"] = "* Scatter... Senbonzakura Kageyoshi *",
	["category"] = "Movies/TV",
	["subcategory"] = "Bleach",
	["file"] = dir.."byakuya.mp3",
	["duration"] = 20,
};

soundboard_data["cod"] = {
	["text"] = "* Come on down! *",
	["category"] = "Movies/TV",
	["emote"] = "gasp",
	["file"] = dir.."comeondown.mp3",
	["duration"] = 6,
};

soundboard_data["beaman"] = {
	["text"] = "* Be a man! *",
	["emote"] = "roar",
	["msg"] = "must be swift as the coursing river!",
	["category"] = "Movies/TV",
	["file"] = dir.."illmakeamanoutofyou.mp3",
	["duration"] = 23,
};

soundboard_data["iwantcandy"] = {
	["text"] = "* I want candy *",
	["emote"] = "hungry",
	["category"] = "Music",
	["file"] = dir.."iwantcandy.mp3",
	["duration"] = 33,
};

soundboard_data["koolaid"] = {
	["text"] = "* Hey! Koolaid! *",
	["emote"] = "thirsty",
	["category"] = "Movies/TV",
	["file"] = dir.."koolaid.mp3",
	["duration"] = 5,
};

soundboard_data["lfl"] = {
	["text"] = "* Lets fighting love! *",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."letsfightinglove.mp3",
	["duration"] = 60,
};

soundboard_data["mmmbop"] = {
	["text"] = "* Mmm bop! *",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."mmmbop.mp3",
	["duration"] = 21,
};

soundboard_data["peterlol"] = {
	["text"] = "* eheheh heh heh *",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."peterlol.mp3",
	["duration"] = 3,
};

soundboard_data["peterlol2"] = {
	["text"] = "* heheh heheh *",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."peterlol2.mp3",
	["duration"] = 5,
};

soundboard_data["peterlol3"] = {
	["text"] = "* eheheheh *",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."peterlol3.mp3",
	["duration"] = 4,
};

soundboard_data["rainingmen"] = {
	["text"] = "* It's raining men! *",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."rainingmen.mp3",
	["duration"] = 37,
};

soundboard_data["rockandroll"] = {
	["text"] = "* I want to rock and roll all night! *",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."rockandrollallnite.mp3",
	["duration"] = 19,
};

soundboard_data["shun"] = {
	["text"] = "* Shuuuuunnn! *",
	["emote"] = "glare",
	["category"] = "Internet",
	["file"] = dir.."shun.mp3",
	["duration"] = 9,
};

soundboard_data["suf"] = {
	["text"] = "* Shut up, fool! *",
	["category"] = "Internet",
	["file"] = dir.."shutupfool.mp3",
	["duration"] = 3,
};

soundboard_data["finalcountdown"] = {
	["text"] = "* Dana na! na! *",
	["emote"] = "roar",
	["category"] = "Music",
	["subcategory"] = "Europe",
	["file"] = dir.."thefinalcountdown.mp3",
	["duration"] = 29,
};

soundboard_data["uhohhotdog"] = {
	["text"] = "* Uh oh! Hot dog! *",
	["emote"] = "gasp",
	["category"] = "Movies/TV",
	["file"] = dir.."uhohhotdog.mp3",
	["duration"] = 3,
};

soundboard_data["wwbbd"] = {
	["text"] = "* What would brian boitano do? *",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["subcategory"] = "South Park",
	["file"] = dir.."whatwouldbrianboitanodo.mp3",
	["duration"] = 29,
};

soundboard_data["mrt"] = {
	["text"] = "* I\\'m Mr. T, and I\\'m a night elf mohawk. *",
	["category"] = "World of Warcraft",
	["subcategory"] = "Celebrity Commercials",
	["file"] = dir.."wow_mr_t.mp3",
	["duration"] = 4,
};

soundboard_data["shatner"] = {
	["text"] = "* Hello, I'm William Shatner. *",
	["category"] = "World of Warcraft",
	["subcategory"] = "Celebrity Commercials",
	["file"] = dir.."wow_shatner.mp3",
	["duration"] = 5,
};

soundboard_data["vandamme"] = {
	["text"] = "* Mon nom c'est Jean Claude Van Damme, et je suis un mage. *",
	["category"] = "World of Warcraft",
	["subcategory"] = "Celebrity Commercials",
	["file"] = dir.."wow_van_damme.mp3",
	["duration"] = 6,
};

soundboard_data["verne"] = {
	["text"] = "* Hello, I'm Verne Troyer. *",
	["category"] = "World of Warcraft",
	["subcategory"] = "Celebrity Commercials",
	["file"] = dir.."wow_verne.mp3",
	["duration"] = 6,
};

soundboard_data["toledo"] = {
	["text"] = "* Hola, mi nomre es Willy Toledo. Y soy un paladin. *",
	["category"] = "World of Warcraft",
	["subcategory"] = "Celebrity Commercials",
	["file"] = dir.."wow_willy_toledo.mp3",
	["duration"] = 6,
};

soundboard_data["vilewoman"] = {
	["text"] = "* Damn you, vile woman! *",
	["emote"] = "doom",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."damnyou.mp3",
	["duration"] = 6,
};

soundboard_data["hummer"] = {
	["text"] = "* Dude, this car KICKS ASS. *",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."familyguyhummer.mp3",
	["duration"] = 25,
};

soundboard_data["petersoap"] = {
	["text"] = "* All the rumors about dropping the soap are true *",
	["msg"] = "dropped the soap.",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."petersoap.mp3",
	["duration"] = 16,
};

soundboard_data["chocolates"] = {
	["text"] = "* You know mother, life is like a box of chocolates. *",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."stewiechocolates.mp3",
	["duration"] = 11,
};

soundboard_data["banana1"] = {
	["text"] = 		"* Put a banana in your ear! *",
	["emote"] = "dance",
	["cmd1"] = "banana1",
	["msg"] = "puts a banana in their ear.",
	["category"] = "Internet",
	["file"] = dir.."banana1.mp3",
	["duration"] = 47,
};

soundboard_data["banana2"] = {
	["text"] = 		"* Put another banana in your ear! *",
	["emote"] = "dance",
	["cmd1"] = "banana2",
	["msg"] = "puts a second banana in their ear.",
	["category"] = "Internet",
	["file"] = dir.."banana2.mp3",
	["duration"] = 32,
};

soundboard_data["boomdiada"] = {
	["text"] = 		"* Boomdiada! *",
	["emote"] = "dance",
	["cmd1"] = "boom",
	["msg"] = "jumps off a cliff.",
	["category"] = "Movies/TV",
	["file"] = dir.."Boomdiada.mp3",
	["duration"] = 51,
};

soundboard_data["candy"] = {
	["text"] = 		"* Candy Mountain Charlie! *",
	["emote"] = "dance",
	["cmd1"] = "candy",
	["msg"] = "steps into the candy mountain candy cave.",
	["category"] = "Internet",
	["file"] = dir.."candy.mp3",
	["duration"] = 42,
};

soundboard_data["famguy"] = {
	["text"] = 		"* Lucky there's a family guy! *",
	["emote"] = "dance",
	["cmd1"] = "famguy",
	["msg"] = "falls down the stairs",
	["category"] = "Movies/TV",
	["file"] = dir.."famguy.mp3",
	["duration"] = 32,
};

soundboard_data["hardware"] = {
	["text"] = 		"* I can't wait! *",
	["emote"] = "dance",
	["cmd1"] = "hardware",
	["msg"] = "is going yes they're going too the...",
	["category"] = "Internet",
	["file"] = dir.."hardware.mp3",
	["duration"] = 18,
};

soundboard_data["lionsleeps"] = {
	["text"] = 		"* In the jungle the mighty jungle! *",
	["emote"] = "dance",
	["cmd1"] = "lionsleeps",
	["msg"] = "goes into cat form.",
	["category"] = "Movies/TV",
	["file"] = dir.."lionsleeps.mp3",
	["duration"] = 25,
};

soundboard_data["ml"] = {
	["text"] = 		"* It's a MAGICAL Leopleurodon! *",
	["cmd1"] = "ff",
	["msg"] = "stands in disbelief.",
	["category"] = "Internet",
	["file"] = dir.."ml.mp3",
	["duration"] = 7,
};

soundboard_data["numa2"] = {
	["text"] = 		"* When you leave my colors fade to grey! *",
	["emote"] = "dance",
	["cmd1"] = "numa2",
	["msg"] = "is an english internet phenomenon.",
	["category"] = "Internet",
	["file"] = dir.."numa2.mp3",
	["duration"] = 31,
};

soundboard_data["numalong2"] = {
	["text"] = 		"* Mai ya hee! Mai ya hoo! *",
	["emote"] = "dance",
	["cmd1"] = "numalong2",
	["msg"] = "is an english internet phenomenon.",
	["category"] = "Internet",
	["file"] = dir.."numalong2.mp3",
	["duration"] = 92,
};

soundboard_data["z"] = {
	["text"] = 		"* ZZZZZZ! *",
	["emote"] = "talk",
	["cmd1"] = "z",
	["msg"] = "speaks spanish.",
	["category"] = "Internet",
	["file"] = dir.."zzz.mp3",
	["duration"] = 10,
};

soundboard_data["youplay"] = {
	["text"] = 		"* That's the World of Warcraft that you play! *",
	["emote"] = "dance",
	["cmd1"] = "youplay",
	["msg"] = "plays World of Warcraft.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Oxhorn",
	["file"] = dir.."youplay.mp3",
	["duration"] = 43,
};

soundboard_data["waffles"] = {
	["text"] = 		"* Waffa waffa waffa wa waffles! *",
	["emote"] = "eat",
	["cmd1"] = "waffles",
	["msg"] = "opens up a Mrs.Buttersworth.",
	["category"] = "Internet",
	["file"] = dir.."waffles.mp3",
	["duration"] = 35,
};

soundboard_data["tffm2"] = {
	["text"] = 		"* We don't want her! *",
	["emote"] = "pick",
	["cmd1"] = "tffm2",
	["msg"] = "doesn't want her.",
	["category"] = "Internet",
	["file"] = dir.."tffm2.mp3",
	["duration"] = 36,
};

soundboard_data["tffm"] = {
	["text"] = 		"* I don't want her! *",
	["emote"] = "pick",
	["cmd1"] = "tffm",
	["msg"] = "doesn't want her.",
	["category"] = "Internet",
	["file"] = dir.."tffm.mp3",
	["duration"] = 62,
};

soundboard_data["snickers"] = {
	["text"] = 		"* Happy Peanut song... *",
	["emote"] = "eat",
	["cmd1"] = "snickers",
	["msg"] = "walks up to you and sings.",
	["category"] = "Movies/TV",
	["file"] = dir.."snickers.mp3",
	["duration"] = 21,
};

soundboard_data["roflmao"] = {
	["text"] = 		"* ROFLMAO! *",
	["emote"] = "lol",
	["cmd1"] = "roflmao",
	["msg"] = "is a muppet!.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Oxhorn",
	["file"] = dir.."roflmao.mp3",
	["duration"] = 50,
};

soundboard_data["oompa"] = {
	["text"] = 		"* Oompa Loompa Doopity Doo *",
	["emote"] = "dance",
	["cmd1"] = "oompa",
	["msg"] = "shrinks in size.",
	["category"] = "Movies/TV",
	["file"] = dir.."oompa.mp3",
	["duration"] = 49,
};

soundboard_data["moonlight"] = {
	["text"] = 		"* Dancin' in the Moonlight, everybody! *",
	["emote"] = "talk",
	["cmd1"] = "moonlight",
	["category"] = "Music",
	["file"] = dir.."moonlight.mp3",
	["duration"] = 23,
};

soundboard_data["lolguild"] = {
	["text"] = 		"* Weee represent... *",
	["emote"] = "dance",
	["cmd1"] = "lolguild",
	["category"] = "Movies/TV",
	["file"] = dir.."lolguild.mp3",
	["duration"] = 17,
};

soundboard_data["halloween"] = {
	["text"] = 		"* This is halloween *",
	["emote"] = "cower",
	["cmd1"] = "halloween",
	["msg"] = "wishes it were halloween.",
	["category"] = "Movies/TV",
	["file"] = dir.."halloween.mp3",
	["duration"] = 26,
};

soundboard_data["gg"] = {
	["text"] = 		"* World of Warcraft is the greatest game *",
	["cmd1"] = "gg",
	["msg"] = "sings.",
	["category"] = "World of Warcraft",
	["subcategory"] = "Oxhorn",
	["file"] = dir.."gg.mp3",
	["duration"] = 34,
};

soundboard_data["business"] = {
	["text"] = 		"* Let's get down to business! *",
	["emote"] = "dance",
	["cmd1"] = "business",
	["msg"] = "fails at war.",
	["category"] = "Movies/TV",
	["file"] = dir.."business.mp3",
	["duration"] = 33,
};

soundboard_data["bigbutts"] = {
	["text"] = 		"* Her butt is sooo big! *",
	["emote"] = "dance",
	["cmd1"] = "bigbutts",
	["msg"] = "likes big butts.",
	["category"] = "Music",
	["file"] = dir.."bigbutts.mp3",
	["duration"] = 25,
};

soundboard_data["belly"] = {
	["text"] = 		"* GET IN MY BELLY!!! *",
	["emote"] = "roar",
	["cmd1"] = "belly",
	["msg"] = "is hungry.",
	["category"] = "Movies/TV",
	["file"] = dir.."belly.mp3",
	["duration"] = 4,
};

soundboard_data["bbd"] = {
	["text"] = 		"* A man of my stature should have to wear a dress? *",
	["emote"] = "dance",
	["cmd1"] = "bbd",
	["msg"] = "casts slow fall.",
	["category"] = "Internet",
	["file"] = dir.."bbd.mp3",
	["duration"] = 50,
};

soundboard_data["hustle"] = {
	["text"] = 		"* Do the Hustle! *",
	["emote"] = "dance",
	["cmd1"] = "hustle",
	["msg"] = "does the hustle.",
	["category"] = "Music",
	["file"] = dir.."hustle.mp3",
	["duration"] = 53,
};

soundboard_data["mario"] = {
	["text"] = 		"* Do the Mario! *",
	["emote"] = "dance",
	["cmd1"] = "mario",
	["msg"] = "swings their arms from side to side.",
	["category"] = "Movies/TV",
	["file"] = dir.."mario.mp3",
	["duration"] = 41,
};

soundboard_data["mt1"] = {
	["text"] = 		"* Magical Trevor 1! *",
	["emote"] = "dance",
	["cmd1"] = "mt1",
	["category"] = "Internet",
	["file"] = dir.."mt1.mp3",
	["duration"] = 53,
};

soundboard_data["mt2"] = {
	["text"] = 		"* Magical Trevor 2! *",
	["emote"] = "dance",
	["cmd1"] = "mt2",
	["category"] = "Internet",
	["file"] = dir.."mt2.mp3",
	["duration"] = 38,
};

soundboard_data["mt3"] = {
	["text"] = 		"* Magical Trevor 3! *",
	["emote"] = "dance",
	["cmd1"] = "mt3",
	["category"] = "Internet",
	["file"] = dir.."mt3.mp3",
	["duration"] = 62,
};

soundboard_data["wacky"] = {
	["text"] = 		"* Wacky Waving Inflatable Arm Flailing Tube Man! *",
	["emote"] = "cheer",
	["cmd1"] = "wacky",
	["msg"] = "spazzes and falls to the ground.",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."wacky.mp3",
	["duration"] = 8,
};

soundboard_data["survive"] = {
	["text"] = 		"* I was afraid, I was petrified! *",
	["emote"] = "dance",
	["cmd1"] = "survive",
	["msg"] = "will survive.",
	["category"] = "Music",
	["subcategory"] = "Gloria Gaynor",
	["file"] = dir.."willsurvive.mp3",
	["duration"] = 55,
};

soundboard_data["survive2"] = {
	["text"] = 		"* I will survive, I will survive! *",
	["emote"] = "dance",
	["cmd1"] = "survive2",
	["msg"] = "will survive.",
	["category"] = "Music",
	["subcategory"] = "Gloria Gaynor",
	["file"] = dir.."willsurvive2.mp3",
	["duration"] = 33,
};

soundboard_data["bkb"] = {
	["text"] = 		"* The Blitzkrieg Bop! *",
	["emote"] = "dance",
	["cmd1"] = "bkb",
	["msg"] = "plays his air guitar.",
	["category"] = "Music",
	["file"] = dir.."bkb.mp3",
	["duration"] = 44,
};

soundboard_data["zombienation"] = {
	["text"] = 		"* Zombie, Zombie, Zombie Nation! *",
	["emote"] = "cheer",
	["cmd1"] = "zombienation",
	["msg"] = "feels like he's at a soccer game.",
	["category"] = "Music",
	["file"] = dir.."zombienation.mp3",
	["duration"] = 28,
};

soundboard_data["blue"] = {
	["text"] = 		"* I'm Blue, Dabba De Dabba Dai! *",
	["emote"] = "dance",
	["cmd1"] = "blue",
	["msg"] = "is turning blue.",
	["category"] = "Music",
	["file"] = dir.."blue.mp3",
	["duration"] = 32,
};

soundboard_data["afterlife"] = {
	["text"] = 		"* I don't belong here, we gotta move on dear! *",
	["emote"] = "dance",
	["cmd1"] = "afterlife",
	["msg"] = "plays his guitar.",
	["category"] = "Music",
	["file"] = dir.."afterlife.mp3",
	["duration"] = 38,
};

soundboard_data["jeopardy1"] = {
	["text"] = 		"* Doooo Doo Doooo Doo *",
	["emote"] = "tap",
	["cmd1"] = "jeopardy1",
	["msg"] = "is waiting impatiently.",
	["category"] = "Movies/TV",
	["file"] = dir.."jeopardy1.mp3",
	["duration"] = 23,
};

soundboard_data["jeopardy2"] = {
	["text"] = 		"* Doooooo doo DOOO doo *",
	["emote"] = "tap",
	["cmd1"] = "jeopardy2",
	["msg"] = "is waiting very impatiently.",
	["category"] = "Movies/TV",
	["file"] = dir.."jeopardy2.mp3",
	["duration"] = 31,
};

soundboard_data["jeopardy3"] = {
	["text"] = 		"* Doo DOO doo doooo *",
	["emote"] = "tap",
	["cmd1"] = "jeopardy3",
	["msg"] = "is waiting extremely impatiently.",
	["category"] = "Movies/TV",
	["file"] = dir.."jeopardy3.mp3",
	["duration"] = 18,
};

soundboard_data["jeopardy4"] = {
	["text"] = 		"* Doooo doo DOO doo *",
	["emote"] = "tap",
	["cmd1"] = "jeopardy4",
	["msg"] = "is waiting like an impatient fool.",
	["category"] = "Movies/TV",
	["file"] = dir.."jeopardy4.mp3",
	["duration"] = 32,
};

soundboard_data["safetydance"] = {
	["text"] = 		"* We can dance if we want to, we can leave your friends behind! *",
	["emote"] = "dance",
	["cmd1"] = "safetydance",
	["msg"] = "wants to dance.",
	["category"] = "Music",
	["file"] = dir.."safetydance.mp3",
	["duration"] = 39,
};

soundboard_data["safetydance2"] = {
	["text"] = 		"* We can go where we want to, a place where they will never find! *",
	["emote"] = "dance",
	["cmd1"] = "safetydance2",
	["msg"] = "really wants to dance.",
	["category"] = "Music",
	["file"] = dir.."safetydance2.mp3",
	["duration"] = 45,
};

soundboard_data["bf"] = {
	["text"] = 		"* Hello baby can I see you smile? *",
	["emote"] = "dance",
	["cmd1"] = "bf",
	["msg"] = "is your bestfriend.",
	["category"] = "Music",
	["subcategory"] = "Toybox",
	["file"] = dir.."bf.mp3",
	["duration"] = 29,
};

soundboard_data["bf2"] = {
	["text"] = 		"* He's my best friend, best of all best friends! *",
	["emote"] = "dance",
	["cmd1"] = "bf2",
	["msg"] = "is his best friend.",
	["category"] = "Music",
	["subcategory"] = "Toybox",
	["file"] = dir.."bf2.mp3",
	["duration"] = 31,
};

soundboard_data["canonrock"] = {
	["text"] = 		"* Canon Rock! *",
	["emote"] = "dance",
	["cmd1"] = "canonrock",
	["msg"] = "plays his guitar.",
	["category"] = "Music",
	["file"] = dir.."canonrock.mp3",
	["duration"] = 46,
};

soundboard_data["canonrock2"] = {
	["text"] = 		"* Canon Rock 2! *",
	["emote"] = "dance",
	["cmd1"] = "canonrock2",
	["msg"] = "plays his guitar.",
	["category"] = "Music",
	["file"] = dir.."canonrock2.mp3",
	["duration"] = 59,
};

soundboard_data["canonrock3"] = {
	["text"] = 		"* Canon Rock 3! *",
	["emote"] = "dance",
	["cmd1"] = "canonrock3",
	["msg"] = "plays his guitar.",
	["category"] = "Music",
	["file"] = dir.."canonrock3.mp3",
	["duration"] = 23,
};

soundboard_data["horoscope"] = {
	["text"] = 		"* That's your horoscope for today! *",
	["emote"] = "dance",
	["cmd1"] = "horoscope",
	["msg"] = "believes the stars are telling him something!",
	["category"] = "Music",
	["file"] = dir.."horoscope.mp3",
	["duration"] = 42,
};

soundboard_data["landdownunder"] = {
	["text"] = 		"* Livin' in a land down under! *",
	["emote"] = "dance",
	["cmd1"] = "landdownunder",
	["msg"] = "is moving to Australia.",
	["category"] = "Music",
	["file"] = dir.."landdownunder.mp3",
	["duration"] = 28,
};

soundboard_data["nannerpuss"] = {
	["text"] = 		"* You can call me nannerpuss! *",
	["emote"] = "eat",
	["cmd1"] = "nannerpuss",
	["msg"] = "wants a Denny's Grand Slam.",
	["category"] = "Movies/TV",
	["file"] = dir.."nannerpuss.mp3",
	["duration"] = 7,
};

soundboard_data["ocanada"] = {
	["text"] = 		"* Ooooo Caaaanadaaaa! *",
	["emote"] = "cheer",
	["cmd1"] = "ocanada",
	["msg"] = "loves Canada.",
	["category"] = "Music",
	["file"] = dir.."ocanada.mp3",
	["duration"] = 21,
};

soundboard_data["sailor"] = {
	["text"] = 		"* Sailing, Sailing, til the ship is sinking! *",
	["emote"] = "dance",
	["cmd1"] = "sailor",
	["msg"] = "jumps on the Titanic.",
	["category"] = "Music",
	["file"] = dir.."sailor.mp3",
	["duration"] = 43,
};

soundboard_data["tarzanandjane"] = {
	["text"] = 		"* Long Hair! *",
	["emote"] = "dance",
	["cmd1"] = "tarzanandjane",
	["msg"] = "swings through the jungle.",
	["category"] = "Music",
	["subcategory"] = "Toybox",
	["file"] = dir.."tarzanandjane.mp3",
	["duration"] = 29,
};

soundboard_data["wantme"] = {
	["text"] = 		"* Dont you want me baby *",
	["emote"] = "love",
	["cmd1"] = "wantme",
	["msg"] = "needs some love.",
	["category"] = "Music",
	["file"] = dir.."wantme.mp3",
	["duration"] = 42,
};

soundboard_data["fgfart"] = {
	["text"] = 		"* Like that time I beat Michael Moore in a farting contest... *",
	["emote"] = "fart",
	["cmd1"] = "fgfart",
	["msg"] = "sits down in a stall next to Michael Moore.",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."fgfart.mp3",
	["duration"] = 40,
};

soundboard_data["rockboat"] = {
	["text"] = 		"* Rock the boat, Don't rock the boat baby! *",
	["emote"] = "dance",
	["cmd1"] = "rockboat",
	["msg"] = "fails at life.",
	["category"] = "Music",
	["file"] = dir.."rockboat.mp3",
	["duration"] = 33,
};

soundboard_data["hard3"] = {
	["text"] = 		"* Hard like Heroic! *",
	["emote"] = "dance",
	["cmd1"] = "hard3",
	["msg"] = "wants to do it like a druid.",
	["category"] = "World of Warcraft",
	["subcategory"] = "General",
	["file"] = dir.."hard3.mp3",
	["duration"] = 16,
};

soundboard_data["tuba"] = {
	["text"] = 		"* ...And I got a job following fat people around with a tuba! *",
	["cmd1"] = "tuba",
	["msg"] = "plays their tuba.",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."tuba.mp3",
	["duration"] = 16,
};

soundboard_data["beautiful"] = {
	["text"] = 		"* B E A UTIFUL! *",
	["msg"] = "can spell beautiful.",
	["emote"] = "cheer",
	["category"] = "Movies/TV",
	["file"] = dir.."beautiful.mp3",
	["duration"] = 4,
};

soundboard_data["boat"] = {
	["text"] = 		"* I'm on a boat! *",
	["msg"] = "won a boat ride for three.",
	["emote"] = "sing",
	["category"] = "Music",
	["file"] = dir.."boat.mp3",
	["duration"] = 27,
};

soundboard_data["champions"] = {
	["text"] = 		"* We are the champions my friends! *",
	["msg"] = "wins.",
	["emote"] = "happy",
	["category"] = "Music",
	["subcategory"] = "Queen",
	["file"] = dir.."champions.mp3",
	["duration"] = 40,
};

soundboard_data["cheeseburger"] = {
	["text"] = 		"* Cheeseburger in Paradise! *",
	["msg"] = "loves cheeseburgers.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."cheeseburger.mp3",
	["duration"] = 47,
};

soundboard_data["ctm"] = {
	["text"] = 		"* Can't Touch Me! *",
	["msg"] = "has diplomatic immunity.",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."ctm.mp3",
	["duration"] = 26,
};

soundboard_data["diabetus"] = {
	["text"] = 		"* I work for Liberty Medical... *",
	["msg"] = "has diabetes.",
	["emote"] = "cry",
	["category"] = "Movies/TV",
	["file"] = dir.."diabetus.mp3",
	["duration"] = 29,
};

soundboard_data["druid"] = {
	["text"] = 		"* There'll be travel in your future... *",
	["msg"] = "is a druid.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."druid.mp3",
	["duration"] = 12,
};

soundboard_data["ellinia"] = {
	["text"] = 		"* Ellinia! *",
	["msg"] = "plays Maplestory.",
	["emote"] = "cheer",
	["category"] = "Video Games",
	["file"] = dir.."ellinia.mp3",
	["duration"] = 34,
};

soundboard_data["escape"] = {
	["text"] = 		"* Escape! *",
	["msg"] = "runs away from the Spartans.",
	["emote"] = "flee",
	["category"] = "Music",
	["file"] = dir.."escape.mp3",
	["duration"] = 24,
};

soundboard_data["escape2"] = {
	["text"] = 		"* Escape 2! *",
	["msg"] = "runs away from the Spartans.",
	["emote"] = "flee",
	["category"] = "Music",
	["file"] = dir.."escape2.mp3",
	["duration"] = 40,
};

soundboard_data["fish"] = {
	["text"] = 		"* Give me back that filet o' fish! *",
	["msg"] = "works at McDonalds.",
	["emote"] = "hungry",
	["category"] = "Movies/TV",
	["file"] = dir.."fish.mp3",
	["duration"] = 20,
};

soundboard_data["fries"] = {
	["text"] = 		"* Ding fries are done! *",
	["msg"] = "works for Burger King.",
	["emote"] = "cheer",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."fries.mp3",
	["duration"] = 18,
};

soundboard_data["hunter"] = {
	["text"] = 		"* You Will want every single weapon... *",
	["msg"] = "is a hunter.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."hunter.mp3",
	["duration"] = 12,
};

soundboard_data["jumponit"] = {
	["text"] = 		"* Apache, Jump on it! *",
	["msg"] = "is in Drumline.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."jumponit.mp3",
	["duration"] = 51,
};

soundboard_data["lean"] = {
	["text"] = 		"* Lean on me! *",
	["msg"] = "needs to be leaned on.",
	["emote"] = "kneel",
	["category"] = "Music",
	["file"] = dir.."lean.mp3",
	["duration"] = 47,
};

soundboard_data["lean2"] = {
	["text"] = 		"* We all need somebody to lean on! *",
	["msg"] = "wants to lean on you.",
	["emote"] = "kneel",
	["category"] = "Music",
	["file"] = dir.."lean2.mp3",
	["duration"] = 46,
};

soundboard_data["mage"] = {
	["text"] = 		"* You think you're almighty with your epic staff... *",
	["msg"] = "is a mage.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."mage.mp3",
	["duration"] = 12,
};

soundboard_data["monster"] = {
	["text"] = 		"* Monster \\'Battle\\'! *",
	["msg"] = "plays techno while Spartans fight.",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["subcategory"] = "300",
	["file"] = dir.."monster.mp3",
	["duration"] = 26,
};

soundboard_data["narnia"] = {
	["text"] = 		"* Prepare to battle! *",
	["msg"] = "fights in Narnia.",
	["emote"] = "ready",
	["category"] = "Movies/TV",
	["file"] = dir.."narnia.mp3",
	["duration"] = 40,
};

soundboard_data["needajew"] = {
	["text"] = 		"* Nothing else has worked so far! *",
	["msg"] = "needs a Jew.",
	["emote"] = "kneel",
	["category"] = "Movies/TV",
	["subcategory"] = "Family Guy",
	["file"] = dir.."needajew.mp3",
	["duration"] = 24,
};

soundboard_data["paladin"] = {
	["text"] = 		"* You strike fear into the hearts of the Horde! *",
	["msg"] = "is a paladin.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."paladin.mp3",
	["duration"] = 12,
};

soundboard_data["priest"] = {
	["text"] = 		"* You think you are a shadow priest but... *",
	["msg"] = "is a priest.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."priest.mp3",
	["duration"] = 12,
};

soundboard_data["prince"] = {
	["text"] = 		"* Fresh Prince of Bel Air! *",
	["msg"] = "is banished from Philly.",
	["emote"] = "dance",
	["category"] = "Movies/TV",
	["file"] = dir.."prince.mp3",
	["duration"] = 30,
};

soundboard_data["rockyou"] = {
	["text"] = 		"* We will, We will Rock you! *",
	["msg"] = "stomps his feet.",
	["emote"] = "threaten",
	["category"] = "Music",
	["subcategory"] = "Queen",
	["file"] = dir.."rockyou.mp3",
	["duration"] = 49,
};

soundboard_data["rogue"] = {
	["text"] = 		"* Fifty Percent of your sever will be composed of... *",
	["msg"] = "is a rogue.",
	["emote"] = "flex",
	["category"] = "Internet",
	["file"] = dir.."rogue.mp3",
	["duration"] = 12,
};

soundboard_data["rumble"] = {
	["text"] = 		"* Let's get ready to rumble!!! *",
	["msg"] = "is ready for some action.",
	["emote"] = "roar",
	["category"] = "Movies/TV",
	["file"] = dir.."rumble.mp3",
	["duration"] = 11,
};

soundboard_data["shaman"] = {
	["text"] = 		"* You are the most overpowered class... *",
	["msg"] = "is a shaman.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."shaman.mp3",
	["duration"] = 12,
};

soundboard_data["shoes"] = {
	["text"] = 		"* Shoes... Oh My God Shoes *",
	["msg"] = "get what they want.",
	["emote"] = "flex",
	["category"] = "Internet",
	["file"] = dir.."shoes.mp3",
	["duration"] = 26,
};

soundboard_data["standbyme"] = {
	["text"] = 		"* Darlin, Darlin Stand, By Me *",
	["msg"] = "needs someone to stand next to.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."standbyme.mp3",
	["duration"] = 50,
};

soundboard_data["toml"] = {
	["text"] = 		"* I had the time of my liiife *",
	["msg"] = "is happy.",
	["emote"] = "cheer",
	["category"] = "Music",
	["file"] = dir.."toml.mp3",
	["duration"] = 22,
};

soundboard_data["warlock"] = {
	["text"] = 		"* You should be able to be kill someone with a... *",
	["msg"] = "is a warlock.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."warlock.mp3",
	["duration"] = 13,
};

soundboard_data["warrior"] = {
	["text"] = 		"* You might have incredible strength... *",
	["msg"] = "is a warrior.",
	["emote"] = "flex",
	["category"] = "World of Warcraft",
	["subcategory"] = "Classes",
	["file"] = dir.."warrior.mp3",
	["duration"] = 12,
};

soundboard_data["wish"] = {
	["text"] = 		"* When you wish upon a star... *",
	["msg"] = "is a Jiminy Cricket.",
	["emote"] = "kneel",
	["category"] = "Movies/TV",
	["file"] = dir.."wish.mp3",
	["duration"] = 42,
};

soundboard_data["yourebeautiful"] = {
	["text"] = 		"* You\\'re Beautiful, It\\'s true! *",
	["msg"] = "is beautiful.",
	["emote"] = "happy",
	["category"] = "Music",
	["file"] = dir.."yourebeautiful.mp3",
	["duration"] = 54,
};

soundboard_data["army"] = {
	["text"] = 		"* Army Strong! *",
	["msg"] = "is strong.",
	["emote"] = "flex",
	["category"] = "Movies/TV",
	["file"] = dir.."army.mp3",
	["duration"] = 31,
};

soundboard_data["bailamos"] = {
	["text"] = 		"* Bailamoooos! *",
	["msg"] = "lets the rhythm take him over.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."bailamos.mp3",
	["duration"] = 53,
};

soundboard_data["caramell2"] = {
	["text"] = 		"* We're Caramelldansen! *",
	["msg"] = "plays caramelldansen on a guitar.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."caramell2.mp3",
	["duration"] = 37,
};

soundboard_data["change"] = {
	["text"] = 		"* We keep on waiting... *",
	["msg"] = "is waiting on the world to change.",
	["emote"] = "sing",
	["category"] = "Music",
	["file"] = dir.."change.mp3",
	["duration"] = 24,
};

soundboard_data["hotncold"] = {
	["text"] = 		"* You\\'re Hot N\\' You\\'re Cold! *",
	["msg"] = "changes their mind like a girl changes clothes.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."hotncold.mp3",
	["duration"] = 31,
};

soundboard_data["justdance"] = {
	["text"] = 		"* It'll be okay! *",
	["msg"] = "just wants to dance.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."justdance.mp3",
	["duration"] = 20,
};

soundboard_data["life"] = {
	["text"] = 		"* Live your Life! *",
	["msg"] = "has no life.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."life.mp3",
	["duration"] = 55,
};

soundboard_data["loca"] = {
	["text"] = 		"* Livin' La Vida Loca! *",
	["msg"] = "is going crazy.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."loca.mp3",
	["duration"] = 36,
};

soundboard_data["macho"] = {
	["text"] = 		"* Macho Macho Man! *",
	["msg"] = "is strong.",
	["emote"] = "flex",
	["category"] = "Music",
	["file"] = dir.."macho.mp3",
	["duration"] = 26,
};

soundboard_data["portal2"] = {
	["text"] = 		"* Now there points of data make a beautiful line... *",
	["msg"] = "is still alive.",
	["emote"] = "dance",
	["category"] = "Video Games",
	["file"] = dir.."portal2.mp3",
	["duration"] = 28,
};

soundboard_data["remember"] = {
	["text"] = 		"* Remember The Name! *",
	["msg"] = "remembers the name.",
	["category"] = "Music",
	["file"] = dir.."remember.mp3",
	["duration"] = 25,
};

soundboard_data["runaway"] = {
	["text"] = 		"* Run Away to save your life! *",
	["msg"] = "starts to run.",
	["emote"] = "flee",
	["category"] = "Movies/TV",
	["file"] = dir.."runaway.mp3",
	["duration"] = 38,
};

soundboard_data["sandman"] = {
	["text"] = 		"* Enter Sandman! *",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."sandman.mp3",
	["duration"] = 45,
};

soundboard_data["willtell"] = {
	["text"] = 		"* William Tell Overture! *",
	["emote"] = "ready",
	["category"] = "Music",
	["file"] = dir.."willtell.mp3",
	["duration"] = 51,
};

soundboard_data["world"] = {
	["text"] = 		"* What a wonderful world! *",
	["msg"] = "sees trees of green.",
	["emote"] = "sing",
	["category"] = "Music",
	["file"] = dir.."world.mp3",
	["duration"] = 34,
};

soundboard_data["margarita"] = {
	["text"] = 		"* Wastin' Away again in Margaritaville! *",
	["msg"] = "has been drinking.",
	["emote"] = "dance",
	["category"] = "Music",
	["file"] = dir.."margarita.mp3",
	["duration"] = 78,
};

-- Added by Potdisc
soundboard_data["madness"] = {
	["text"] = 		"* THIS IS MADNESS! *",
	["cmd1"] = "mn",
	["msg"] = "yells at you",
	["category"] = "Movies/TV",
	["subcategory"] = "300",
	["file"] = dir.."ThisisMadness.mp3",
	["emote"] = "angry",
	["duration"] = 5,
};

soundboard_data["shuffeling"] = {
	["text"] = 		"* Everyday I'm shuffeling! *",
	["cmd1"] = "Sl",
	["msg"] = "shows people, how to move!",
	["category"] = "Music",
	["file"] = dir.."Shuffeling.mp3",
	["emote"] = "Dance",
	["duration"] = 19,
};

soundboard_data["pi1"] = {
	["text"] = 		"* 3.141592653589793238.. *",
	["cmd1"] = "P1",
	["msg"] = "is being the smarter one",
	["category"] = "Music",
	["file"] = dir.."PiSong.mp3",
	["emote"] = "Dance",
	["duration"] = 38,
};

soundboard_data["sparta"] = {
	["text"] = 		"* THIS IS SPARTA! *",
	["cmd1"] = "St",
	["msg"] = "/me sets you straight",
	["category"] = "Movies/TV",
	["subcategory"] = "300",
	["file"] = dir.."ThisisSparta.mp3",
	["emote"] = "roar",
	["duration"] = 4,
};

soundboard_data["blade1"] = {
	["text"] = 		"* Enters the Thrall Techno Club *",
	["cmd1"] = "b1",
	["msg"] = "turns on the Radio at max Volume",
	["category"] = "World of Warcraft",
	["subcategory"] = "Characters",
	["file"] = dir.."BladeRemix.mp3",
	["duration"] = 89,
};

soundboard_data["ttlo"] = {
	["text"] = 		"* Come on baby turn the lights off! *",
	["cmd1"] = "ttlo",
	["msg"] = "wants you to turn off the lights",
	["category"] = "Music",
	["file"] = dir.."ttlo.mp3",
	["emote"] = "point",
	["duration"] = 34,
};

soundboard_data["h3f"] = {
	["text"] = 		"* HAPPY TREE FRIENDS FTW! *",
	["cmd1"] = "h3f",
	["msg"] = "finds everything, perfect.. Just Perfect!",
	["category"] = "Music",
	["file"] = dir.."h3f.mp3",
	["emote"] = "smile",
	["duration"] = 27,
};

soundboard_data["mo"] = {
 ["text"] = 		"* Okay, moving on... *",
 ["cmd1"] = "mo",
 ["msg"] = "is moving on",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."mo.mp3",
["emote"] = "",
	["duration"] = 3,
};

soundboard_data["nl"] = {
 ["text"] = 		"* When I'm not looking, are you going to kill me? *",
 ["cmd1"] = "mo",
 ["msg"] = "looks away...",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."nl.mp3",
["emote"] = "",
	["duration"] = 15,
};

soundboard_data["silence"] = {
 ["text"] = 		"* SILENCE! *",
 ["cmd1"] = "silence",
 ["msg"] = "tells you all, to shut up!",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."silence.mp3",
["emote"] = "",
	["duration"] = 2,
};

soundboard_data["stm"] = {
 ["text"] = 		"* STOP TOUCHING ME! *",
 ["cmd1"] = "stm",
 ["msg"] = "dosen't want you, to touch him!",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."stm.mp3",
["emote"] = "",
	["duration"] = 3,
};

soundboard_data["pissing"] = {
 ["text"] = 		"* I'm I pissing you off? *",
 ["cmd1"] = "pissing",
 ["msg"] = "thinks that he is pissing you off",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."pissing.mp3",
["emote"] = "laugh",
	["duration"] = 4,
};

soundboard_data["quick"] = {
 ["text"] = 		"* HOLY CRAP YOU'RE QUICK! *",
 ["cmd1"] = "quick",
 ["msg"] = "looks suspicious at you",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."quick.mp3",
["emote"] = "",
	["duration"] = 4,
};

soundboard_data["santa"] = {
 ["text"] = 		"* How do Santa get to the kids in apartments? *",
 ["cmd1"] = "santa",
 ["msg"] = "buzzes your door",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Jeff Dunham",
 ["file"] = dir.."santa.mp3",
["emote"] = "",
	["duration"] = 17,
};

soundboard_data["pokemon"] = {
	["text"] = 		"* Gotta catch em all! *",
	["msg"] = "skal fange dem!",
	["category"] = "Video Games",
	["subcategory"] = "Pokemon",
	["file"] = dir.."pokemondk.mp3",
	["duration"] = 65,
};

soundboard_data["twinkle"] = {
 ["text"] = 		"* Twinkle Twinkle Little Star *",
 ["cmd1"] = "twinkle",
 ["msg"] = "is dreaming about peace between Horde & Alliance",
 ["category"] = "Music",
 ["file"] = dir.."twinkle.mp3",
["emote"] = "sleep",
	["duration"] = 35,
};

soundboard_data["caught"] = {
 ["text"] = 		"*.. as the day you almost caught Cap't Jack Sparrow! *",
 ["cmd1"] = "caught",
 ["msg"] = "escapes, & knows, that you won't forget this day",
 ["category"] = "Movies/TV",
 ["subcategory"] = "Pirates of the Caribbean",
 ["file"] = dir.."caught.mp3",
["emote"] = "wave",
	["duration"] = 10,
};

soundboard_data["cheat"] = {
	["text"] = 		"* You cheated! *",
	["cmd1"] = "cheat",
	["msg"] = "is making the 'PIRATE-MOVE'",
	["category"] = "Movies/TV",
	["subcategory"] = "Pirates of the Caribbean",
	["file"] = dir.."cheat.mp3",
	["emote"] = "laugh",
	["duration"] = 4,
};

soundboard_data["dirt"] = {
	["text"] = 		"* This is a jar of dirt! *",
	["cmd1"] = "dirt",
	["msg"] = "won't give up the dirt, he believes in it.",
	["category"] = "Movies/TV",
	["subcategory"] = "Pirates of the Caribbean",
	["file"] = dir.."dirt.mp3",
	["emote"] = "laugh",
	["duration"] = 19,
};

soundboard_data["piratelong"] = {
	["text"] = 		"* I\\'m a pirat! *",
	["cmd1"] = "piratelong",
	["msg"] = "sails through the Caribbean",
	["category"] = "Movies/TV",
	["subcategory"] = "Pirates of the Caribbean",
	["file"] = dir.."piratelong.mp3",
	["emote"] = "dance",
	["duration"] = 76,
};

soundboard_data["pirateshort"] = {
	["text"] = 		"* I\\'m a pirat! *",
	["cmd1"] = "pirateshort",
	["msg"] = "sails through the caribbean",
	["category"] = "Movies/TV",
	["subcategory"] = "Pirates of the Caribbean",
	["file"] = dir.."pirateshort.mp3",
	["emote"] = "dance",
	["duration"] = 46,
};

soundboard_data["singapore"] = {
	["text"] = 		"* Singapore *",
	["cmd1"] = "singapore",
	["msg"] = "says 'clearly you haven\\'t been to Singapore'",
	["category"] = "Movies/TV",
	["subcategory"] = "Pirates of the Caribbean",
	["file"] = dir.."singapore.mp3",
	["emote"] = "point",
	["duration"] = 3,
};

soundboard_data["Gladiator"] = {
	["text"] = " *Are you not entertained!? *",
	["cmd1"] = "Gladiator",
	["msg"] = "says are you not entertained?",
	["category"] = "Movies/TV",
	["subcategory"] = "Gladiator",
	["file"] = dir.."AreYouNotEntertained.mp3",
	["emote"] = "Roar",
	["duration"] = 12,
};

soundboard_data["ponpon"] = {
	["text"] = "* PonPon *",
	["cmd1"] = "ponpon",
	["msg"] = "sings the PonPon song!",
	["category"] = "Music",
	["file"] = dir.."ponpon.mp3",
	["duration"] = 47,
};

soundboard_data["ponponLong"] = {
	["text"] = "* PonPon *",
	["cmd1"] = "ponponlong",
	["msg"] = "sings the PonPon song!",
	["category"] = "Music",
	["file"] = dir.."ponponlong.mp3",
	["duration"] = 243,
};

soundboard_data["allDay"] = {
	["text"] = " *I can do this ALL DAY! *",
	["cmd1"] = "allday",
	["msg"] = "does this ALL DAY!",
	["category"] = "Movies/TV",
	["subcategory"] = "New Girl",
	["file"] = dir.."Icandothisallday.mp3",
	["emote"] = "Flex",
	["duration"] = 21,
};
