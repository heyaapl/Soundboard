-- Dynamic Events Data: Dungeon, Raid, Boss, and Ability tables organized by expansion.
-- Each ability has a pre-assigned cleuEvent for automatic COMBAT_LOG_EVENT_UNFILTERED matching.
-- cleuEvent guide:
--   SPELL_CAST_START   = cast-bar abilities (advance warning)
--   SPELL_CAST_SUCCESS = instant casts, phase triggers, summons
--   SPELL_AURA_APPLIED = debuffs on players, boss self-buffs (enrage/shields)

SoundboardDynamicData = {
    expansionOrder = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 },
    expansions = {

------------------------------------------------------------------------
-- EXPANSION 0: Classic (Vanilla)
------------------------------------------------------------------------
[0] = {
    name = "Classic",
    dungeons = {
        {
            name = "Ragefire Chasm",
            bosses = {
                { name = "Oggleflint", abilities = {
                    { spellId = 12057, name = "Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 6713,  name = "Disarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Taragaman the Hungerer", abilities = {
                    { spellId = 11970, name = "Fire Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12739, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Jergosh the Invoker", abilities = {
                    { spellId = 11990, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 11980, name = "Curse of Weakness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12741, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Bazzalan", abilities = {
                    { spellId = 14873, name = "Sinister Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8646,  name = "Snap Kick", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Wailing Caverns",
            bosses = {
                { name = "Lady Anacondra", abilities = {
                    { spellId = 700,   name = "Sleep", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 8040,  name = "Druid's Slumber", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 9532,  name = "Lightning Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Lord Cobrahn", abilities = {
                    { spellId = 7965,  name = "Cobrahn Serpent Form", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8040,  name = "Druid's Slumber", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 744,   name = "Poison", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Lord Pythas", abilities = {
                    { spellId = 8040,  name = "Druid's Slumber", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 9532,  name = "Lightning Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 8150,  name = "Thunderclap", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lord Serpentis", abilities = {
                    { spellId = 8040,  name = "Druid's Slumber", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 9532,  name = "Lightning Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Verdan the Everliving", abilities = {
                    { spellId = 8142,  name = "Grasping Vines", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mutanus the Devourer", abilities = {
                    { spellId = 7399,  name = "Terrify", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 7967,  name = "Naralex's Nightmare", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 8150,  name = "Thunderclap", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Deadmines",
            bosses = {
                { name = "Rhahk'Zor", abilities = {
                    { spellId = 6304, name = "Rhahk'Zor Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sneed's Shredder", abilities = {
                    { spellId = 7399, name = "Terrify", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 6466, name = "Eject Sneed", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gilnid", abilities = {
                    { spellId = 5213, name = "Molten Metal", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Mr. Smite", abilities = {
                    { spellId = 6432, name = "Smite Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 6435, name = "Smite Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Edwin VanCleef", abilities = {
                    { spellId = 5217, name = "Thrash", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 7964, name = "Smoke Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 3391, name = "Thrash", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Cookie", abilities = {
                    { spellId = 5174, name = "Cookie's Cooking", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Shadowfang Keep",
            bosses = {
                { name = "Baron Silverlaine", abilities = {
                    { spellId = 7068, name = "Veil of Shadow", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Commander Springvale", abilities = {
                    { spellId = 1026, name = "Holy Light", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 6588, name = "Hammer of Justice", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Arugal", abilities = {
                    { spellId = 7588, name = "Void Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 7621, name = "Arugal's Curse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 7803, name = "Thundershock", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Stockade",
            bosses = {
                { name = "Bazil Thredd", abilities = {
                    { spellId = 15657, name = "Sinister Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 7159,  name = "Backstab", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dextren Ward", abilities = {
                    { spellId = 3019,  name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 12170, name = "Intimidating Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Gnomeregan",
            bosses = {
                { name = "Grubbis", abilities = {
                    { spellId = 13445, name = "Radiation Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Viscous Fallout", abilities = {
                    { spellId = 11634, name = "Toxic Volley", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Electrocutioner 6000", abilities = {
                    { spellId = 11085, name = "Chain Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 11084, name = "Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mekgineer Thermaplugg", abilities = {
                    { spellId = 11120, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 10101, name = "Activate Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Scarlet Monastery - Graveyard",
            bosses = {
                { name = "Bloodmage Thalnos", abilities = {
                    { spellId = 12470, name = "Fire Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12739, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 12746, name = "Flame Spike", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Scarlet Monastery - Library",
            bosses = {
                { name = "Houndmaster Loksey", abilities = {
                    { spellId = 6742, name = "Bloodlust", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Arcanist Doan", abilities = {
                    { spellId = 9433, name = "Arcane Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8988, name = "Silence", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 9438, name = "Arcane Bubble", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 9435, name = "Detonation", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Scarlet Monastery - Armory",
            bosses = {
                { name = "Herod", abilities = {
                    { spellId = 8989,  name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19134, name = "Frightening Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 8260,  name = "Rushing Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Scarlet Monastery - Cathedral",
            bosses = {
                { name = "High Inquisitor Fairbanks", abilities = {
                    { spellId = 8282,  name = "Curse of Blood", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12040, name = "Shadow Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Scarlet Commander Mograine", abilities = {
                    { spellId = 14518, name = "Crusader Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 9257,  name = "Lay on Hands", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 15588, name = "Hammer of Justice", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "High Inquisitor Whitemane", abilities = {
                    { spellId = 12039, name = "Heal", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 9256,  name = "Deep Sleep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12039, name = "Resurrection", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Razorfen Kraul",
            bosses = {
                { name = "Agathelos the Raging", abilities = {
                    { spellId = 8285,  name = "Rampage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 8260,  name = "Rushing Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Charlga Razorflank", abilities = {
                    { spellId = 8292,  name = "Chain Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 8361,  name = "Purity", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Razorfen Downs",
            bosses = {
                { name = "Tuten'kash", abilities = {
                    { spellId = 12252, name = "Web Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12024, name = "Net", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Amnennar the Coldbringer", abilities = {
                    { spellId = 12642, name = "Frost Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 12548, name = "Frost Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12876, name = "Amnennar's Wrath", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Uldaman",
            bosses = {
                { name = "Ironaya", abilities = {
                    { spellId = 10078, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8374,  name = "Arcing Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Archaedas", abilities = {
                    { spellId = 6524,  name = "Ground Tremor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 10093, name = "Awaken Earthen Guardians", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 10258, name = "Awaken Vault Warders", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Zul'Farrak",
            bosses = {
                { name = "Witch Doctor Zum'rah", abilities = {
                    { spellId = 12491, name = "Healing Wave", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 15245, name = "Shadow Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Chief Ukorz Sandscalp", abilities = {
                    { spellId = 15496, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Gahz'rilla", abilities = {
                    { spellId = 11836, name = "Freeze Solid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 11131, name = "Icicle", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Maraudon",
            bosses = {
                { name = "Celebras the Cursed", abilities = {
                    { spellId = 12747, name = "Entangling Roots", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 21793, name = "Twisted Tranquility", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Princess Theradras", abilities = {
                    { spellId = 21869, name = "Repulsive Gaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 21909, name = "Dust Field", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 21832, name = "Boulder", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Temple of Atal'Hakkar",
            bosses = {
                { name = "Shade of Eranikus", abilities = {
                    { spellId = 12890, name = "Deep Slumber", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 12884, name = "Acid Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 15667, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Avatar of Hakkar", abilities = {
                    { spellId = 12888, name = "Cause Insanity", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Blackrock Depths",
            bosses = {
                { name = "High Interrogator Gerstahn", abilities = {
                    { spellId = 13704, name = "Psychic Scream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 14032, name = "Shadow Word: Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 13860, name = "Mind Blast", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Lord Roccor", abilities = {
                    { spellId = 15249, name = "Flame Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15636, name = "Ground Tremor", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Bael'Gar", abilities = {
                    { spellId = 13895, name = "Summon Spawn of Bael'Gar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ambassador Flamelash", abilities = {
                    { spellId = 15636, name = "Fireblast", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Emperor Dagran Thaurissan", abilities = {
                    { spellId = 15588, name = "Hand of Thaurissan", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15636, name = "Avatar of Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Princess Moira Bronzebeard", abilities = {
                    { spellId = 15587, name = "Mind Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 12039, name = "Heal", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 15654, name = "Shadow Word: Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22884, name = "Renew", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Lower Blackrock Spire",
            bosses = {
                { name = "Highlord Omokk", abilities = {
                    { spellId = 15580, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 16727, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shadow Hunter Vosh'gajin", abilities = {
                    { spellId = 16708, name = "Hex", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 14030, name = "Curse of Blood", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Overlord Wyrmthalak", abilities = {
                    { spellId = 16727, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15580, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16509, name = "Sweeping Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Upper Blackrock Spire",
            bosses = {
                { name = "Pyroguard Emberseer", abilities = {
                    { spellId = 15636, name = "Fire Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16036, name = "Flame Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Warchief Rend Blackhand", abilities = {
                    { spellId = 16856, name = "Mortal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15496, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "General Drakkisath", abilities = {
                    { spellId = 16805, name = "Conflagration", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15284, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15708, name = "Mortal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Dire Maul - East",
            bosses = {
                { name = "Zevrim Thornhoof", abilities = {
                    { spellId = 22478, name = "Sacrifice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22709, name = "Intense Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Alzzin the Wildshaper", abilities = {
                    { spellId = 22691, name = "Disarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22689, name = "Wither", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22651, name = "Sacrifice", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Dire Maul - West",
            bosses = {
                { name = "Tendris Warpwood", abilities = {
                    { spellId = 22924, name = "Grasping Vines", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22994, name = "Trample", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Prince Tortheldrin", abilities = {
                    { spellId = 22920, name = "Arcane Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 13736, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15589, name = "Counterspell", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Dire Maul - North",
            bosses = {
                { name = "Guard Mol'dar", abilities = {
                    { spellId = 15580, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 15572, name = "Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "King Gordok", abilities = {
                    { spellId = 16727, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22886, name = "Berserker Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16856, name = "Mortal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Stratholme",
            bosses = {
                { name = "Timmy the Cruel", abilities = {
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 17467, name = "Ravenous Claw", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Balnazzar", abilities = {
                    { spellId = 17690, name = "Domination", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 17683, name = "Psychic Scream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 17631, name = "Shadow Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 17285, name = "Sleep", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Baron Rivendare", abilities = {
                    { spellId = 17393, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 17473, name = "Raise Dead", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 17467, name = "Unholy Aura", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Scholomance",
            bosses = {
                { name = "Rattlegore", abilities = {
                    { spellId = 16727, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16145, name = "Sunder Armor", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ras Frostwhisper", abilities = {
                    { spellId = 18099, name = "Frost Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 18100, name = "Frost Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 18101, name = "Chill Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Darkmaster Gandling", abilities = {
                    { spellId = 17950, name = "Shadow Portal", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 18702, name = "Shadow Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 12040, name = "Shadow Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Molten Core",
            difficulties = { "40-Player" },
            bosses = {
                { name = "Lucifron", abilities = {
                    { spellId = 19702, name = "Impending Doom", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19703, name = "Lucifron's Curse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 20604, name = "Dominate Mind", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Magmadar", abilities = {
                    { spellId = 19408, name = "Panic", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19451, name = "Lava Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 19428, name = "Magma Spit", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19451, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Gehennas", abilities = {
                    { spellId = 19728, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 19717, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 19716, name = "Gehennas' Curse", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Garr", abilities = {
                    { spellId = 19492, name = "Antimagic Pulse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19496, name = "Magma Shackles", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shazzrah", abilities = {
                    { spellId = 19714, name = "Deaden Magic", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 19715, name = "Counterspell", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19712, name = "Arcane Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23138, name = "Gate of Shazzrah", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Baron Geddon", abilities = {
                    { spellId = 19695, name = "Inferno", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 20475, name = "Living Bomb", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 19659, name = "Ignite Mana", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sulfuron Harbinger", abilities = {
                    { spellId = 19778, name = "Inspire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19780, name = "Hand of Ragnaros", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19776, name = "Demoralizing Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Golemagg the Incinerator", abilities = {
                    { spellId = 19820, name = "Magma Splash", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 20228, name = "Pyroblast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 13880, name = "Golemagg's Trust", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Majordomo Executus", abilities = {
                    { spellId = 20229, name = "Blast Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 21076, name = "Damage Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 20534, name = "Teleport", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ragnaros", abilities = {
                    { spellId = 19774, name = "Summon Sons of Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 20566, name = "Wrath of Ragnaros", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 20564, name = "Magma Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19773, name = "Lava Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 20563, name = "Melt Weapon", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Onyxia's Lair",
            difficulties = { "40-Player" },
            bosses = {
                { name = "Onyxia", abilities = {
                    { spellId = 18435, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 17086, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 18431, name = "Bellowing Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 18392, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 18564, name = "Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 18500, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 18431, name = "Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Blackwing Lair",
            difficulties = { "40-Player" },
            bosses = {
                { name = "Razorgore the Untamed", abilities = {
                    { spellId = 19872, name = "Calm Dragonkin", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22424, name = "Fireball Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 23023, name = "Conflagration", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19873, name = "Destroy Egg", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vaelastrasz the Corrupt", abilities = {
                    { spellId = 18173, name = "Burning Adrenaline", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 23461, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 23462, name = "Fire Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 20677, name = "Essence of the Red", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Broodlord Lashlayer", abilities = {
                    { spellId = 18670, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23331, name = "Blast Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16856, name = "Mortal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Firemaw", abilities = {
                    { spellId = 23462, name = "Flame Buffet", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 22539, name = "Shadow Flame", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 18500, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ebonroc", abilities = {
                    { spellId = 23340, name = "Shadow of Ebonroc", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 22539, name = "Shadow Flame", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 18500, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Flamegor", abilities = {
                    { spellId = 22539, name = "Shadow Flame", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 23342, name = "Fire Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23341, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 18500, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Chromaggus", abilities = {
                    { spellId = 23310, name = "Time Lapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23312, name = "Corrosive Acid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23315, name = "Frost Burn", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23316, name = "Ignite Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23308, name = "Incinerate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23174, name = "Chromatic Mutation", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 23128, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 23189, name = "Brood Power: Bronze", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Nefarian", abilities = {
                    { spellId = 22539, name = "Shadow Flame", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 22686, name = "Bellowing Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22687, name = "Veil of Shadow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23364, name = "Tail Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22667, name = "Shadow Command", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 23397, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Ruins of Ahn'Qiraj",
            difficulties = { "20-Player" },
            bosses = {
                { name = "Kurinnaxx", abilities = {
                    { spellId = 25814, name = "Mortal Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 26527, name = "Sand Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25815, name = "Thrash", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "General Rajaxx", abilities = {
                    { spellId = 25599, name = "Thundercrash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 19134, name = "Frightening Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ossirian the Unscarred", abilities = {
                    { spellId = 25176, name = "Wyvern Sting", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25195, name = "Curse of Tongues", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25189, name = "Enveloping Winds", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25188, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Temple of Ahn'Qiraj",
            difficulties = { "40-Player" },
            bosses = {
                { name = "The Prophet Skeram", abilities = {
                    { spellId = 785,   name = "True Fulfillment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26006, name = "Arcane Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25970, name = "Earth Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Bug Trio (Lord Kri)", abilities = {
                    { spellId = 25812, name = "Toxic Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 25813, name = "Thrash", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Battleguard Sartura", abilities = {
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 26083, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26042, name = "Sundering Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fankriss the Unyielding", abilities = {
                    { spellId = 15580, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26561, name = "Entangle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16856, name = "Mortal Wound", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Princess Huhuran", abilities = {
                    { spellId = 26180, name = "Wyvern Sting", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26053, name = "Noxious Poison", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26068, name = "Acid Spit", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26051, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Twin Emperors", abilities = {
                    { spellId = 26607, name = "Teleport", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26613, name = "Unbalancing Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26006, name = "Arcane Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 800,   name = "Twin Teleport", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ouro", abilities = {
                    { spellId = 26102, name = "Sand Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26103, name = "Sweep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26058, name = "Ground Rupture", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26615, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "C'Thun", abilities = {
                    { spellId = 26134, name = "Eye Beam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26029, name = "Dark Glare", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26476, name = "Digestive Acid", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 26446, name = "Mouth Tentacle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 26152, name = "Ground Rupture", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Naxxramas",
            difficulties = { "40-Player" },
            bosses = {
                { name = "Anub'Rekhan", abilities = {
                    { spellId = 28785, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28786, name = "Locust Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grand Widow Faerlina", abilities = {
                    { spellId = 28796, name = "Poison Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28794, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28798, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Maexxna", abilities = {
                    { spellId = 28622, name = "Web Wrap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28741, name = "Poison Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29484, name = "Web Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28776, name = "Necrotic Poison", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28747, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Noth the Plaguebringer", abilities = {
                    { spellId = 29213, name = "Curse of the Plaguebringer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29212, name = "Cripple", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29209, name = "Blink", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Heigan the Unclean", abilities = {
                    { spellId = 29998, name = "Decrepit Fever", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31261, name = "Spell Disruption", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 29371, name = "Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Loatheb", abilities = {
                    { spellId = 29865, name = "Deathbloom", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 55593, name = "Necrotic Aura", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 29234, name = "Inevitable Doom", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Instructor Razuvious", abilities = {
                    { spellId = 55543, name = "Unbalancing Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29107, name = "Jagged Knife", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gothik the Harvester", abilities = {
                    { spellId = 29576, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28679, name = "Harvest Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Four Horsemen", abilities = {
                    { spellId = 28884, name = "Meteor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28832, name = "Mark of Korth'azz", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28835, name = "Mark of Blaumeux", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28834, name = "Mark of Rivendare", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28833, name = "Mark of Zeliek", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Patchwerk", abilities = {
                    { spellId = 28308, name = "Hateful Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28131, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 19134, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Grobbulus", abilities = {
                    { spellId = 28157, name = "Mutating Injection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28240, name = "Poison Cloud", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28169, name = "Slime Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gluth", abilities = {
                    { spellId = 28371, name = "Mortal Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28375, name = "Decimate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28374, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Thaddius", abilities = {
                    { spellId = 28089, name = "Polarity Shift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28167, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28134, name = "Power Surge", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Sapphiron", abilities = {
                    { spellId = 28524, name = "Frost Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28542, name = "Life Drain", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28522, name = "Icebolt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28526, name = "Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29318, name = "Frost Aura", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Kel'Thuzad", abilities = {
                    { spellId = 27808, name = "Frost Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 27810, name = "Frost Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 27819, name = "Detonate Mana", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 27814, name = "Frost Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 27831, name = "Shadow Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28410, name = "Chains of Kel'Thuzad", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 1: The Burning Crusade
------------------------------------------------------------------------
[1] = {
    name = "The Burning Crusade",
    dungeons = {
        {
            name = "Hellfire Ramparts",
            bosses = {
                { name = "Watchkeeper Gargolmar", abilities = {
                    { spellId = 30471, name = "Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16856, name = "Mortal Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 30475, name = "Overpower", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Omor the Unscarred", abilities = {
                    { spellId = 30741, name = "Treacherous Aura", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 30740, name = "Shadow Whip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30695, name = "Summon Fiendish Hound", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31901, name = "Orbital Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vazruden the Herald", abilities = {
                    { spellId = 30926, name = "Revenge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nazan", abilities = {
                    { spellId = 30926, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 34653, name = "Cone of Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Blood Furnace",
            bosses = {
                { name = "The Maker", abilities = {
                    { spellId = 30923, name = "Domination", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30925, name = "Acid Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Broggok", abilities = {
                    { spellId = 30916, name = "Slime Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30914, name = "Poison Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Keli'dan the Breaker", abilities = {
                    { spellId = 30940, name = "Burning Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 30935, name = "Shadow Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 30939, name = "Fire Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Slave Pens",
            bosses = {
                { name = "Mennu the Betrayer", abilities = {
                    { spellId = 35745, name = "Corrupted Nova Totem", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31991, name = "Healing Ward", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35011, name = "Lightning Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Rokmar the Crackler", abilities = {
                    { spellId = 31956, name = "Grievous Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 35008, name = "Water Spit", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 8269,  name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Quagmirran", abilities = {
                    { spellId = 38153, name = "Poison Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 34780, name = "Acid Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34780, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Underbog",
            bosses = {
                { name = "Hungarfen", abilities = {
                    { spellId = 31673, name = "Foul Spores", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34971, name = "Mushroom", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ghaz'an", abilities = {
                    { spellId = 34268, name = "Acid Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 34267, name = "Tail Sweep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34290, name = "Acid Spit", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Black Stalker", abilities = {
                    { spellId = 31704, name = "Levitate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31715, name = "Static Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 31717, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Mana-Tombs",
            bosses = {
                { name = "Pandemonius", abilities = {
                    { spellId = 32358, name = "Void Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 32351, name = "Dark Shell", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Tavarok", abilities = {
                    { spellId = 32361, name = "Crystal Prison", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32363, name = "Earthquake", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nexus-Prince Shaffar", abilities = {
                    { spellId = 32690, name = "Frost Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32693, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 32691, name = "Frostbolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 33844, name = "Blink", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Auchenai Crypts",
            bosses = {
                { name = "Shirrak the Dead Watcher", abilities = {
                    { spellId = 32264, name = "Inhibit Magic", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 32265, name = "Attract Magic", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32337, name = "Focus Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Exarch Maladaar", abilities = {
                    { spellId = 32421, name = "Soul Scream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32346, name = "Stolen Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32424, name = "Ribbon of Souls", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Sethekk Halls",
            bosses = {
                { name = "Darkweaver Syth", abilities = {
                    { spellId = 33535, name = "Frost Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33534, name = "Flame Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33537, name = "Arcane Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33538, name = "Shadow Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33539, name = "Summon Elementals", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Talon King Ikiss", abilities = {
                    { spellId = 38197, name = "Arcane Explosion", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 35581, name = "Polymorph", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 32370, name = "Arcane Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38163, name = "Blink", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Shadow Labyrinth",
            bosses = {
                { name = "Ambassador Hellmaw", abilities = {
                    { spellId = 33547, name = "Corrosive Acid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33551, name = "Fear", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Blackheart the Inciter", abilities = {
                    { spellId = 33676, name = "Incite Chaos", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33834, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33830, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grandmaster Vorpil", abilities = {
                    { spellId = 33563, name = "Draw Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33617, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 33587, name = "Shadow Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Murmur", abilities = {
                    { spellId = 33923, name = "Sonic Boom", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 33711, name = "Murmur's Touch", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 33919, name = "Thundering Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38794, name = "Murmur's Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Mechanar",
            bosses = {
                { name = "Mechano-Lord Capacitus", abilities = {
                    { spellId = 35107, name = "Head Crack", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36044, name = "Polarity Shift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35077, name = "Nether Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nethermancer Sepethrea", abilities = {
                    { spellId = 35250, name = "Arcane Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 35314, name = "Dragon's Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35250, name = "Frost Attack", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Pathaleon the Calculator", abilities = {
                    { spellId = 35272, name = "Arcane Missiles", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38495, name = "Mind Control", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38280, name = "Disgruntled", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 36092, name = "Arcane Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Botanica",
            bosses = {
                { name = "Commander Sarannis", abilities = {
                    { spellId = 35096, name = "Summon Reinforcements", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34790, name = "Arcane Resonance", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "High Botanist Freywinn", abilities = {
                    { spellId = 34551, name = "Summon Frayer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34550, name = "Tranquility", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 34759, name = "Tree Form", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Thorngrin the Tender", abilities = {
                    { spellId = 34659, name = "Sacrifice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34661, name = "Hellfire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34670, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Warp Splinter", abilities = {
                    { spellId = 34716, name = "Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36383, name = "Summon Treants", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36703, name = "Arcane Volley", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "The Arcatraz",
            bosses = {
                { name = "Zereketh the Unbound", abilities = {
                    { spellId = 36119, name = "Shadow Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 36127, name = "Seed of Corruption", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 39005, name = "Void Zone", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dalliah the Doomsayer", abilities = {
                    { spellId = 36173, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36144, name = "Gift of the Doomsayer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36142, name = "Heal", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Wrath-Scryer Soccothrates", abilities = {
                    { spellId = 36512, name = "Immolation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36051, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35759, name = "Felfire Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36040, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Harbinger Skyriss", abilities = {
                    { spellId = 36924, name = "Mind Rend", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 36929, name = "Domination", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36931, name = "Fear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36948, name = "66% Split", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36949, name = "33% Split", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Shattered Halls",
            bosses = {
                { name = "Grand Warlock Nethekurse", abilities = {
                    { spellId = 35139, name = "Death Coil", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30500, name = "Dark Spin", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30496, name = "Shadow Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Warbringer O'mrogg", abilities = {
                    { spellId = 30474, name = "Burning Maul", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 30471, name = "Fear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30475, name = "Beatdown", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Warchief Kargath Bladefist", abilities = {
                    { spellId = 30989, name = "Blade Dance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30991, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Steamvault",
            bosses = {
                { name = "Hydromancer Thespia", abilities = {
                    { spellId = 31481, name = "Lung Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25033, name = "Lightning Cloud", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mekgineer Steamrigger", abilities = {
                    { spellId = 31534, name = "Electrified Net", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31535, name = "Saw Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31536, name = "Shrink Ray", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Warlord Kalithresh", abilities = {
                    { spellId = 31551, name = "Warlord's Rage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 37076, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35057, name = "Head Crack", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31543, name = "Spell Reflection", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Old Hillsbrad Foothills",
            bosses = {
                { name = "Lieutenant Drake", abilities = {
                    { spellId = 17153, name = "Frightening Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31914, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16856, name = "Mortal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Captain Skarloc", abilities = {
                    { spellId = 29572, name = "Consecration", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 13005, name = "Hammer of Justice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29573, name = "Holy Light", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 32588, name = "Holy Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Epoch Hunter", abilities = {
                    { spellId = 31914, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31916, name = "Sand Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38592, name = "Impending Death", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "The Black Morass",
            bosses = {
                { name = "Chrono Lord Deja", abilities = {
                    { spellId = 31467, name = "Arcane Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38538, name = "Arcane Discharge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31422, name = "Time Lapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31296, name = "Attraction", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Temporus", abilities = {
                    { spellId = 31458, name = "Hasten", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 31464, name = "Mortal Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 31473, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38592, name = "Spell Reflection", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Aeonus", abilities = {
                    { spellId = 31475, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37853, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 34645, name = "Sand Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 31467, name = "Time Stop", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Magisters' Terrace",
            bosses = {
                { name = "Selin Fireheart", abilities = {
                    { spellId = 44320, name = "Mana Rage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 46165, name = "Drain Life", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 44331, name = "Fel Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vexallus", abilities = {
                    { spellId = 44361, name = "Pure Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 44335, name = "Energy Feedback", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 44353, name = "Overload", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Priestess Delrissa", abilities = {
                    { spellId = 44291, name = "Power Word: Shield", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 44294, name = "Flash Heal", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 44296, name = "Heal", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 44141, name = "Dispel Magic", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kael'thas Sunstrider", abilities = {
                    { spellId = 44194, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 36819, name = "Pyroblast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 44141, name = "Phoenix", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 44224, name = "Gravity Lapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 44161, name = "Flame Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46164, name = "Shock Barrier", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Karazhan",
            difficulties = { "10-Player" },
            bosses = {
                { name = "Attumen the Huntsman", abilities = {
                    { spellId = 29833, name = "Intangible Presence", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29847, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29711, name = "Shadowcleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Moroes", abilities = {
                    { spellId = 29425, name = "Gouge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29572, name = "Blind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37066, name = "Garrote", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 34694, name = "Vanish", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Maiden of Virtue", abilities = {
                    { spellId = 29522, name = "Holy Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 29511, name = "Repentance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29512, name = "Holy Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29215, name = "Holy Ground", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Curator", abilities = {
                    { spellId = 30254, name = "Hateful Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 30235, name = "Astral Flare", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30403, name = "Evocation", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shade of Aran", abilities = {
                    { spellId = 29954, name = "Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29928, name = "Flame Wreath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29973, name = "Arcane Missiles", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 29963, name = "Frostbolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 29965, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 29972, name = "Counterspell", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30004, name = "Dragon's Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29991, name = "Arcane Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Terestian Illhoof", abilities = {
                    { spellId = 30115, name = "Sacrifice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30066, name = "Summon Imp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30053, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 30195, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Netherspite", abilities = {
                    { spellId = 30522, name = "Void Zone", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30466, name = "Nether Burn", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30467, name = "Nether Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38639, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Prince Malchezaar", abilities = {
                    { spellId = 30843, name = "Enfeeble", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30854, name = "Shadow Word: Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30898, name = "Shadow Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 30852, name = "Sunder Armor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 39095, name = "Thrash", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 30225, name = "Infernal", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nightbane", abilities = {
                    { spellId = 30210, name = "Charred Earth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37098, name = "Rain of Bones", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30129, name = "Smoking Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36922, name = "Bellowing Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30131, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30127, name = "Tail Sweep", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Gruul's Lair",
            difficulties = { "25-Player" },
            bosses = {
                { name = "High King Maulgar", abilities = {
                    { spellId = 33054, name = "Arcing Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33238, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 16508, name = "Intimidating Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gruul the Dragonkiller", abilities = {
                    { spellId = 33525, name = "Ground Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36297, name = "Reverberation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33654, name = "Shatter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36300, name = "Cave In", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33813, name = "Hurtful Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36200, name = "Growth", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Magtheridon's Lair",
            difficulties = { "25-Player" },
            bosses = {
                { name = "Magtheridon", abilities = {
                    { spellId = 30616, name = "Quake", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30571, name = "Blast Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 30410, name = "Shadow Grasp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30572, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 30205, name = "Shadow Cage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Serpentshrine Cavern",
            difficulties = { "25-Player" },
            bosses = {
                { name = "Hydross the Unstable", abilities = {
                    { spellId = 38235, name = "Water Tomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38246, name = "Vile Sludge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37961, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 38215, name = "Mark of Hydross", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 38219, name = "Mark of Corruption", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Lurker Below", abilities = {
                    { spellId = 37433, name = "Spout", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37478, name = "Water Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 37749, name = "Whirl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37363, name = "Geyser", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37550, name = "Submerge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Leotheras the Blind", abilities = {
                    { spellId = 37640, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37641, name = "Inner Demon", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37675, name = "Chaos Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 37749, name = "Insidious Whisper", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fathom-Lord Karathress", abilities = {
                    { spellId = 38441, name = "Cataclysmic Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 29436, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 38445, name = "Tidal Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Morogrim Tidewalker", abilities = {
                    { spellId = 37730, name = "Tidal Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38023, name = "Watery Grave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 37764, name = "Earthquake", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lady Vashj", abilities = {
                    { spellId = 38316, name = "Multi-Shot", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38309, name = "Shock Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 38280, name = "Static Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 38295, name = "Spore Bat", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38258, name = "Entangle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 38264, name = "Forked Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Tempest Keep: The Eye",
            difficulties = { "25-Player" },
            bosses = {
                { name = "Al'ar", abilities = {
                    { spellId = 35383, name = "Flame Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35369, name = "Flame Quills", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 34747, name = "Meteor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35049, name = "Melt Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Void Reaver", abilities = {
                    { spellId = 34172, name = "Arcane Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 25778, name = "Knock Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36976, name = "Pounding", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "High Astromancer Solarian", abilities = {
                    { spellId = 33023, name = "Arcane Missiles", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 37135, name = "Wrath of the Astromancer", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 34322, name = "Psychic Scream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33045, name = "Mark of Solarian", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 33390, name = "Void Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Kael'thas Sunstrider", abilities = {
                    { spellId = 36834, name = "Arcane Disruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36819, name = "Pyroblast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 36797, name = "Mind Control", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36730, name = "Flame Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36185, name = "Shock Barrier", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 36723, name = "Phoenix", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 36092, name = "Gravity Lapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 35941, name = "Nether Beam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Hyjal Summit",
            difficulties = { "25-Player" },
            bosses = {
                { name = "Rage Winterchill", abilities = {
                    { spellId = 31249, name = "Icebolt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31250, name = "Death and Decay", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31258, name = "Frost Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28524, name = "Frost Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Anetheron", abilities = {
                    { spellId = 31306, name = "Carrion Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31298, name = "Sleep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31302, name = "Inferno", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31299, name = "Vampiric Aura", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Kaz'rogal", abilities = {
                    { spellId = 31480, name = "War Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31447, name = "Mark of Kaz'rogal", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31477, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Azgalor", abilities = {
                    { spellId = 31344, name = "Howl of Azgalor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31340, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 31347, name = "Doom", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 31345, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Archimonde", abilities = {
                    { spellId = 31970, name = "Fear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32014, name = "Air Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31972, name = "Grip of the Legion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 32053, name = "Soul Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 31944, name = "Doomfire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 32111, name = "Finger of Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45006, name = "Hand of Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Black Temple",
            difficulties = { "25-Player" },
            bosses = {
                { name = "High Warlord Naj'entus", abilities = {
                    { spellId = 39837, name = "Impaling Spine", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 39878, name = "Tidal Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 39872, name = "Tidal Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Supremus", abilities = {
                    { spellId = 40276, name = "Molten Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41951, name = "Hateful Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 33802, name = "Molten Punch", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shade of Akama", abilities = {
                    { spellId = 41357, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Teron Gorefiend", abilities = {
                    { spellId = 40239, name = "Incinerate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 40251, name = "Shadow of Death", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 40243, name = "Crushing Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gurtogg Bloodboil", abilities = {
                    { spellId = 42005, name = "Bloodboil", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 40491, name = "Fel Acid Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 40604, name = "Fel Rage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 40481, name = "Acidic Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Reliquary of Souls", abilities = {
                    { spellId = 41376, name = "Spirit Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41303, name = "Soul Drain", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 41410, name = "Deaden", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41431, name = "Seethe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41545, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Mother Shahraz", abilities = {
                    { spellId = 40860, name = "Sinister Beam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 40823, name = "Fatal Attraction", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 40842, name = "Saber Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41001, name = "Silencing Shriek", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Illidari Council", abilities = {
                    { spellId = 41481, name = "Flamestrike", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 41482, name = "Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41541, name = "Vanish", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41455, name = "Circle of Healing", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 41472, name = "Divine Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41485, name = "Deadly Poison", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Illidan Stormrage", abilities = {
                    { spellId = 41032, name = "Shear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 40932, name = "Flame Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41083, name = "Shadow Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 41117, name = "Agonizing Flames", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 40585, name = "Dark Barrage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 39849, name = "Flame Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41126, name = "Eye Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 40506, name = "Draw Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 41078, name = "Shadow Prison", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 40683, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Sunwell Plateau",
            difficulties = { "25-Player" },
            bosses = {
                { name = "Kalecgos", abilities = {
                    { spellId = 44869, name = "Spectral Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45018, name = "Arcane Buffet", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 44878, name = "Frost Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 45037, name = "Agony Curse", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Brutallus", abilities = {
                    { spellId = 45150, name = "Meteor Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46394, name = "Burn", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 45185, name = "Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 44851, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Felmyst", abilities = {
                    { spellId = 45866, name = "Corrosion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 45855, name = "Gas Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45402, name = "Demonic Vapor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45848, name = "Encapsulate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45717, name = "Fog of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Eredar Twins", abilities = {
                    { spellId = 45248, name = "Blaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46771, name = "Flame Sear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45256, name = "Confounding Blow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45329, name = "Shadow Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 45347, name = "Dark Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45270, name = "Shadowfury", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "M'uru", abilities = {
                    { spellId = 45996, name = "Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45680, name = "Negative Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46177, name = "Shadow Spike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46228, name = "Void Zone", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46282, name = "Black Hole", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kil'jaeden", abilities = {
                    { spellId = 45641, name = "Fire Bloom", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 45680, name = "Soul Flay", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 45848, name = "Legion Lightning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 46605, name = "Sinister Reflection", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 45657, name = "Shadow Spike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46680, name = "Flame Dart", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 46589, name = "Darkness of a Thousand Souls", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Zul'Aman",
            difficulties = { "10-Player" },
            bosses = {
                { name = "Nalorakk", abilities = {
                    { spellId = 42384, name = "Brutal Swipe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 42395, name = "Mangle", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 42402, name = "Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 42398, name = "Deafening Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Akil'zon", abilities = {
                    { spellId = 43648, name = "Electrical Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43621, name = "Static Disruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43622, name = "Call Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Jan'alai", abilities = {
                    { spellId = 43140, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 43299, name = "Flame Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 42630, name = "Fire Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43144, name = "Hatch Eggs", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Halazzi", abilities = {
                    { spellId = 43303, name = "Saber Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43139, name = "Flame Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43150, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 43302, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Hex Lord Malacrass", abilities = {
                    { spellId = 43383, name = "Spirit Bolts", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 43501, name = "Siphon Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43431, name = "Drain Power", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Zul'jin", abilities = {
                    { spellId = 43093, name = "Grievous Throw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43095, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43150, name = "Claw Rage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43114, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 43120, name = "Flame Whirl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43147, name = "Feather Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 2: Wrath of the Lich King
------------------------------------------------------------------------
[2] = {
    name = "Wrath of the Lich King",
    dungeons = {
        {
            name = "Utgarde Keep",
            bosses = {
                { name = "Prince Keleseth", abilities = {
                    { spellId = 48400, name = "Frost Tomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59148, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Skarvald & Dalronn", abilities = {
                    { spellId = 43650, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 43649, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Ingvar the Plunderer", abilities = {
                    { spellId = 42723, name = "Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 42729, name = "Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 42708, name = "Dark Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 42748, name = "Shadow Axe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Nexus",
            bosses = {
                { name = "Grand Magus Telestra", abilities = {
                    { spellId = 47765, name = "Ice Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 47736, name = "Firebomb", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 47731, name = "Critter", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Anomalus", abilities = {
                    { spellId = 47751, name = "Spark", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 47748, name = "Rift Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 47731, name = "Arcane Attraction", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Keristrasza", abilities = {
                    { spellId = 48094, name = "Crystal Chains", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 50997, name = "Crystallize", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 48096, name = "Tail Sweep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 48179, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Azjol-Nerub",
            bosses = {
                { name = "Krik'thir the Gatewatcher", abilities = {
                    { spellId = 52592, name = "Curse of Fatigue", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 49808, name = "Mind Flay", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Hadronox", abilities = {
                    { spellId = 53030, name = "Web Grab", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 53035, name = "Acid Cloud", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59419, name = "Leech Poison", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Anub'arak", abilities = {
                    { spellId = 53472, name = "Pound", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 53520, name = "Carrion Beetles", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 53218, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Ahn'kahet: The Old Kingdom",
            bosses = {
                { name = "Elder Nadox", abilities = {
                    { spellId = 56748, name = "Brood Plague", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 56749, name = "Brood Rage", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Prince Taldaram", abilities = {
                    { spellId = 55931, name = "Conjure Flame Sphere", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 55959, name = "Embrace of the Vampyr", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Jedoga Shadowseeker", abilities = {
                    { spellId = 56926, name = "Thundershock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 60029, name = "Cyclone Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Herald Volazj", abilities = {
                    { spellId = 57496, name = "Insanity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 57941, name = "Shadow Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 59978, name = "Mind Flay", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Drak'Tharon Keep",
            bosses = {
                { name = "Trollgore", abilities = {
                    { spellId = 49639, name = "Consume", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 49637, name = "Corpse Explode", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Novos the Summoner", abilities = {
                    { spellId = 59909, name = "Arcane Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 59854, name = "Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59855, name = "Frostbolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "King Dred", abilities = {
                    { spellId = 48920, name = "Grievous Bite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 22686, name = "Bellowing Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 48873, name = "Mangling Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Prophet Tharon'ja", abilities = {
                    { spellId = 49548, name = "Decay Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59963, name = "Lightning Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 49356, name = "Shadow Volley", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Violet Hold",
            bosses = {
                { name = "Cyanigosa", abilities = {
                    { spellId = 59373, name = "Arcane Vacuum", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 58694, name = "Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59370, name = "Uncontrollable Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Gundrak",
            bosses = {
                { name = "Slad'ran", abilities = {
                    { spellId = 55081, name = "Poison Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 54970, name = "Venom Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Moorabi", abilities = {
                    { spellId = 55098, name = "Ground Tremor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 55142, name = "Mojo Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 55036, name = "Transformation", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Gal'darah", abilities = {
                    { spellId = 59265, name = "Impaling Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59263, name = "Stampede", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59246, name = "Whirling Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Halls of Stone",
            bosses = {
                { name = "Krystallus", abilities = {
                    { spellId = 50810, name = "Shatter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 50840, name = "Ground Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sjonnir The Ironshaper", abilities = {
                    { spellId = 50834, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 59851, name = "Lightning Ring", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 50846, name = "Static Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Halls of Lightning",
            bosses = {
                { name = "General Bjarngrim", abilities = {
                    { spellId = 52029, name = "Mortal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59085, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ionar", abilities = {
                    { spellId = 52658, name = "Ball Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59800, name = "Static Overload", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Volkhan", abilities = {
                    { spellId = 59529, name = "Shattering Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 52237, name = "Heat", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Loken", abilities = {
                    { spellId = 52942, name = "Lightning Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59835, name = "Arc Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59836, name = "Pulsing Shockwave", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "The Oculus",
            bosses = {
                { name = "Drakos the Interrogator", abilities = {
                    { spellId = 51849, name = "Thundering Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59371, name = "Magic Pull", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ley-Guardian Eregos", abilities = {
                    { spellId = 51162, name = "Arcane Barrage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 51170, name = "Planar Shift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 51149, name = "Enraged Assault", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Utgarde Pinnacle",
            bosses = {
                { name = "Svala Sorrowgrave", abilities = {
                    { spellId = 48276, name = "Ritual of the Sword", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59730, name = "Sinister Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gortok Palehoof", abilities = {
                    { spellId = 48261, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59268, name = "Withering Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 48256, name = "Arcing Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Skadi the Ruthless", abilities = {
                    { spellId = 59331, name = "Crush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59334, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59322, name = "Poisoned Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "King Ymiron", abilities = {
                    { spellId = 59301, name = "Bane", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 48294, name = "Dark Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 59302, name = "Fetid Rot", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 48291, name = "Screams of the Dead", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Culling of Stratholme",
            bosses = {
                { name = "Meathook", abilities = {
                    { spellId = 52696, name = "Disease Expulsion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 58849, name = "Constricting Chains", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 52399, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Salramm the Fleshcrafter", abilities = {
                    { spellId = 58845, name = "Steal Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 58971, name = "Curse of Twisted Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 52781, name = "Explode Ghoul", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Chrono-Lord Epoch", abilities = {
                    { spellId = 52766, name = "Time Warp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 58848, name = "Time Stop", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 52772, name = "Wounding Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mal'Ganis", abilities = {
                    { spellId = 58852, name = "Carrion Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 52723, name = "Sleep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 58850, name = "Mind Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 52721, name = "Vampiric Touch", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Trial of the Champion",
            bosses = {
                { name = "The Black Knight", abilities = {
                    { spellId = 67781, name = "Desecration", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 67729, name = "Death's Respite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 67886, name = "Ghoul Explode", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Forge of Souls",
            bosses = {
                { name = "Bronjahm", abilities = {
                    { spellId = 68872, name = "Soul Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 68838, name = "Corrupt Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Devourer of Souls", abilities = {
                    { spellId = 68861, name = "Mirrored Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69048, name = "Unleashed Souls", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 68863, name = "Phantom Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 69057, name = "Well of Souls", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Pit of Saron",
            bosses = {
                { name = "Forgemaster Garfrost", abilities = {
                    { spellId = 70381, name = "Deep Freeze", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 68789, name = "Throw Saronite", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ick and Krick", abilities = {
                    { spellId = 69012, name = "Pursuit", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69015, name = "Toxic Waste", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 68987, name = "Explosive Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Scourgelord Tyrannus", abilities = {
                    { spellId = 69629, name = "Forceful Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69172, name = "Overlord's Brand", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69167, name = "Unholy Power", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Halls of Reflection",
            bosses = {
                { name = "Falric", abilities = {
                    { spellId = 72426, name = "Defiling Horror", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72435, name = "Impending Despair", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72452, name = "Quivering Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Marwyn", abilities = {
                    { spellId = 72436, name = "Corrupted Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72422, name = "Well of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72453, name = "Obliterate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72360, name = "Shared Suffering", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Naxxramas (10/25)",
            difficulties = { "10-Player", "25-Player" },
            bosses = {
                { name = "Anub'Rekhan", abilities = {
                    { spellId = 28785, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28786, name = "Locust Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grand Widow Faerlina", abilities = {
                    { spellId = 28796, name = "Poison Bolt Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28794, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28798, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Maexxna", abilities = {
                    { spellId = 28622, name = "Web Wrap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 29484, name = "Web Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28747, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Patchwerk", abilities = {
                    { spellId = 28308, name = "Hateful Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28131, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 26662, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Grobbulus", abilities = {
                    { spellId = 28157, name = "Mutating Injection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 28240, name = "Poison Cloud", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28169, name = "Slime Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Thaddius", abilities = {
                    { spellId = 28089, name = "Polarity Shift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28167, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Sapphiron", abilities = {
                    { spellId = 28524, name = "Frost Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28542, name = "Life Drain", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 28522, name = "Icebolt", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kel'Thuzad", abilities = {
                    { spellId = 27808, name = "Frost Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 27819, name = "Detonate Mana", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 27814, name = "Frost Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 27831, name = "Shadow Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 28410, name = "Chains of Kel'Thuzad", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Obsidian Sanctum",
            difficulties = { "10-Player", "25-Player" },
            bosses = {
                { name = "Sartharion", abilities = {
                    { spellId = 56908, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 58956, name = "Flame Tsunami", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 57579, name = "Lava Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 61632, name = "Tail Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Eye of Eternity",
            difficulties = { "10-Player", "25-Player" },
            bosses = {
                { name = "Malygos", abilities = {
                    { spellId = 56272, name = "Arcane Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 56438, name = "Arcane Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 56505, name = "Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 57407, name = "Surge of Power", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 57429, name = "Static Field", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Vault of Archavon",
            difficulties = { "10-Player", "25-Player" },
            bosses = {
                { name = "Archavon the Stone Watcher", abilities = {
                    { spellId = 58678, name = "Rock Shards", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 58960, name = "Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 58663, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Emalon the Storm Watcher", abilities = {
                    { spellId = 64213, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 64218, name = "Overcharge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64216, name = "Lightning Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Koralon the Flame Watcher", abilities = {
                    { spellId = 67329, name = "Burning Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 66665, name = "Flaming Cinder", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66725, name = "Meteor Fists", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Toravon the Ice Watcher", abilities = {
                    { spellId = 72034, name = "Whiteout", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 72091, name = "Frozen Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72104, name = "Freezing Ground", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Ulduar",
            difficulties = { "10-Player", "25-Player" },
            bosses = {
                { name = "Flame Leviathan", abilities = {
                    { spellId = 62374, name = "Pursued", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 62475, name = "Flame Vents", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62297, name = "Battering Ram", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ignis the Furnace Master", abilities = {
                    { spellId = 62488, name = "Activate Construct", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62680, name = "Flame Jets", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62717, name = "Slag Pot", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62548, name = "Scorch", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Razorscale", abilities = {
                    { spellId = 64021, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 64733, name = "Devouring Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64771, name = "Fuse Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "XT-002 Deconstructor", abilities = {
                    { spellId = 62776, name = "Tympanic Tantrum", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 63024, name = "Gravity Bomb", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 63018, name = "Light Bomb", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 62775, name = "Heart Phase", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Assembly of Iron", abilities = {
                    { spellId = 61888, name = "Overload", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 61903, name = "Fusion Punch", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 62269, name = "Rune of Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 63483, name = "Lightning Whirl", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 61869, name = "Shield of Runes", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Kologarn", abilities = {
                    { spellId = 64003, name = "Focused Eyebeam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 63355, name = "Crunch Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 64290, name = "Stone Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64292, name = "Shockwave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hodir", abilities = {
                    { spellId = 61968, name = "Flash Freeze", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 62469, name = "Freeze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62038, name = "Biting Cold", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 61969, name = "Frozen Blows", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Thorim", abilities = {
                    { spellId = 62042, name = "Stormhammer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62130, name = "Unbalancing Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62279, name = "Lightning Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62017, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Freya", abilities = {
                    { spellId = 62623, name = "Sunbeam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62589, name = "Nature Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62437, name = "Ground Tremor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 62451, name = "Unstable Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mimiron", abilities = {
                    { spellId = 63631, name = "Shock Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 63636, name = "Napalm Shell", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 63274, name = "P3Wx2 Laser Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64529, name = "Plasma Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 62997, name = "Rocket Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64444, name = "Boom Bot", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "General Vezax", abilities = {
                    { spellId = 62662, name = "Searing Flames", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 63276, name = "Mark of the Faceless", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 63420, name = "Shadow Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 63322, name = "Saronite Vapors", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Yogg-Saron", abilities = {
                    { spellId = 63138, name = "Sara's Fervor", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 63830, name = "Malady of the Mind", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 63802, name = "Brain Link", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 64163, name = "Lunatic Gaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64059, name = "Induce Madness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64189, name = "Deafening Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Algalon the Observer", abilities = {
                    { spellId = 64584, name = "Cosmic Smash", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 64412, name = "Phase Punch", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 64443, name = "Big Bang", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 65108, name = "Quantum Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 64122, name = "Black Hole", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Trial of the Crusader",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Northrend Beasts", abilities = {
                    { spellId = 66331, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66794, name = "Ferocious Butt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66883, name = "Staggering Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66869, name = "Burning Bile", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 66823, name = "Paralytic Toxin", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 66862, name = "Slime Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 67477, name = "Arctic Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 67345, name = "Massive Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66683, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Lord Jaraxxus", abilities = {
                    { spellId = 66532, name = "Fel Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 66528, name = "Fel Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66197, name = "Legion Flame", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 66258, name = "Infernal Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66269, name = "Nether Portal", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 67049, name = "Incinerate Flesh", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 66237, name = "Touch of Jaraxxus", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Faction Champions", abilities = {
                    { spellId = 65816, name = "Bladestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 65542, name = "Psychic Scream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 65801, name = "Heroism", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Twin Val'kyr", abilities = {
                    { spellId = 66046, name = "Twin's Pact (Light)", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 65875, name = "Twin's Pact (Dark)", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 65767, name = "Light Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66058, name = "Dark Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 65950, name = "Touch of Light", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66001, name = "Touch of Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Anub'arak", abilities = {
                    { spellId = 66012, name = "Freezing Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 65919, name = "Penetrating Cold", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 66118, name = "Leeching Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 66134, name = "Shadow Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 65920, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 65917, name = "Submerge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Icecrown Citadel",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Lord Marrowgar", abilities = {
                    { spellId = 69057, name = "Bone Spike Graveyard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69076, name = "Bone Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69055, name = "Saber Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70823, name = "Coldflame", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lady Deathwhisper", abilities = {
                    { spellId = 71001, name = "Death and Decay", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 71289, name = "Dominate Mind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72491, name = "Frostbolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 71204, name = "Touch of Insignificance", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 70842, name = "Mana Barrier", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Deathbringer Saurfang", abilities = {
                    { spellId = 72293, name = "Mark of the Fallen Champion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 72385, name = "Boiling Blood", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72410, name = "Rune of Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 72737, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 72202, name = "Blood Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Festergut", abilities = {
                    { spellId = 69195, name = "Pungent Blight", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 69279, name = "Gas Spore", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69291, name = "Inhale Blight", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69240, name = "Vile Gas", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72219, name = "Gastric Bloat", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Rotface", abilities = {
                    { spellId = 69508, name = "Slime Spray", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 69674, name = "Mutated Infection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 69839, name = "Unstable Ooze Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Professor Putricide", abilities = {
                    { spellId = 70341, name = "Slime Puddle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70351, name = "Unstable Experiment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70672, name = "Gaseous Bloat", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 71255, name = "Choking Gas Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72855, name = "Unbound Plague", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 72451, name = "Mutated Plague", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Blood Prince Council", abilities = {
                    { spellId = 71405, name = "Shadow Lance", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 72040, name = "Kinetic Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72999, name = "Shadow Prison", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 72039, name = "Empowered Shock Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Blood-Queen Lana'thel", abilities = {
                    { spellId = 71340, name = "Pact of the Darkfallen", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 71265, name = "Swarming Shadows", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 73070, name = "Incite Terror", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 71726, name = "Bloodbolt Whirl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70877, name = "Vampiric Bite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70952, name = "Bloodbolt Splash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Valithria Dreamwalker", abilities = {
                    { spellId = 71179, name = "Lay Waste", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70633, name = "Gut Spray", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 71086, name = "Mana Void", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sindragosa", abilities = {
                    { spellId = 69762, name = "Unchained Magic", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 70117, name = "Icy Grip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 71047, name = "Blistering Cold", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70157, name = "Ice Tomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69766, name = "Instability", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 70126, name = "Frost Beacon", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 70084, name = "Mystic Buffet", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Lich King", abilities = {
                    { spellId = 70541, name = "Infest", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72762, name = "Defile", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69409, name = "Soul Reaper", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 68981, name = "Remorseless Winter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 72350, name = "Fury of Frostmourne", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69200, name = "Raging Spirit", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 73539, name = "Shadow Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 70498, name = "Vile Spirits", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 69037, name = "Necrotic Plague", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 73529, name = "Harvest Soul", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "The Ruby Sanctum",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Halion", abilities = {
                    { spellId = 74806, name = "Meteor Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74562, name = "Fiery Combustion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 74792, name = "Soul Consumption", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 75876, name = "Twilight Cutter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74525, name = "Flame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 74526, name = "Dark Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 74531, name = "Tail Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 3: Cataclysm
------------------------------------------------------------------------
[3] = {
    name = "Cataclysm",
    dungeons = {
        {
            name = "Blackrock Caverns",
            bosses = {
                { name = "Rom'ogg Bonecrusher", abilities = {
                    { spellId = 75272, name = "Quake", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 75539, name = "Skullcracker", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 75543, name = "Chains of Woe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ascendant Lord Obsidius", abilities = {
                    { spellId = 76185, name = "Thunderclap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 76188, name = "Transformation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 76186, name = "Stone Blow", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Throne of the Tides",
            bosses = {
                { name = "Lady Naz'jar", abilities = {
                    { spellId = 75683, name = "Shock Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 75690, name = "Fungal Spores", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 75700, name = "Geyser", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ozumat", abilities = {
                    { spellId = 76170, name = "Blight of Ozumat", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Stonecore",
            bosses = {
                { name = "Ozruk", abilities = {
                    { spellId = 78807, name = "Shatter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 78903, name = "Ground Slam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 92426, name = "Paralyze", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "High Priestess Azil", abilities = {
                    { spellId = 79050, name = "Gravity Well", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 79249, name = "Force Grip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 79251, name = "Seismic Shard", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Vortex Pinnacle",
            bosses = {
                { name = "Grand Vizier Ertan", abilities = {
                    { spellId = 86292, name = "Cyclone Shield", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 86340, name = "Storm's Edge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Asaad", abilities = {
                    { spellId = 87553, name = "Static Cling", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 86911, name = "Unstable Grounding Field", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 87618, name = "Chain Lightning", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Lost City of the Tol'vir",
            bosses = {
                { name = "General Husam", abilities = {
                    { spellId = 83112, name = "Shockwave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 83454, name = "Hammer Fist", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Siamat", abilities = {
                    { spellId = 84982, name = "Storm Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 83051, name = "Cloud Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 84587, name = "Wailing Winds", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Halls of Origination",
            bosses = {
                { name = "Temple Guardian Anhuur", abilities = {
                    { spellId = 75322, name = "Divine Reckoning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74938, name = "Shield of Light", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Earthrager Ptah", abilities = {
                    { spellId = 75547, name = "Flame Bolt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 83650, name = "Earth Spike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rajh", abilities = {
                    { spellId = 73872, name = "Sun Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 73874, name = "Inferno Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 76355, name = "Blessing of the Sun", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Grim Batol",
            bosses = {
                { name = "General Umbriss", abilities = {
                    { spellId = 74846, name = "Ground Siege", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74634, name = "Blitz", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74853, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Forgemaster Throngus", abilities = {
                    { spellId = 76507, name = "Impaling Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74976, name = "Disorienting Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 74908, name = "Mighty Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Drahga Shadowburner", abilities = {
                    { spellId = 75238, name = "Burning Shadowbolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 75245, name = "Invocation of Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Erudax", abilities = {
                    { spellId = 75664, name = "Enfeebling Blow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 75861, name = "Binding Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 75694, name = "Shadow Gale", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "End Time",
            bosses = {
                { name = "Echo of Sylvanas", abilities = {
                    { spellId = 101397, name = "Shriek of the Highborne", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100865, name = "Wracking Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 101401, name = "Black Arrow", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Murozond", abilities = {
                    { spellId = 102569, name = "Temporal Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 101591, name = "Infinite Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 102668, name = "Distortion Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Well of Eternity",
            bosses = {
                { name = "Peroth'arn", abilities = {
                    { spellId = 104905, name = "Fel Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105521, name = "Fel Decay", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Queen Azshara", abilities = {
                    { spellId = 102478, name = "Ice Fling", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103241, name = "Total Obedience", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Mannoroth", abilities = {
                    { spellId = 104820, name = "Fel Firestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105041, name = "Nether Portal", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 104648, name = "Felblade", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Hour of Twilight",
            bosses = {
                { name = "Arcurion", abilities = {
                    { spellId = 102480, name = "Icy Boulder", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 102582, name = "Chains of Frost", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103171, name = "Hand of Frost", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Asira Dawnslayer", abilities = {
                    { spellId = 103558, name = "Choking Smoke Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 102726, name = "Mark of Silence", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 103419, name = "Blade Barrier", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Archbishop Benedictus", abilities = {
                    { spellId = 103600, name = "Righteous Shear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103755, name = "Twilight Shear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103768, name = "Wave of Twilight", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Blackwing Descent",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Magmaw", abilities = {
                    { spellId = 78068, name = "Pillar of Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 89773, name = "Mangle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 78941, name = "Parasitic Infection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 77690, name = "Lava Spew", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Omnotron Defense System", abilities = {
                    { spellId = 79710, name = "Arcane Annihilator", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 79888, name = "Lightning Conductor", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 79501, name = "Acquiring Target", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 79629, name = "Power Generator", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 79023, name = "Incineration Security Measure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 80161, name = "Chemical Cloud", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 79624, name = "Power Conversion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 79912, name = "Static Shock", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Chimaeron", abilities = {
                    { spellId = 82848, name = "Massacre", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 82881, name = "Break", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 82935, name = "Caustic Slime", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 82890, name = "Mortality", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 88853, name = "Double Attack", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Atramedes", abilities = {
                    { spellId = 77612, name = "Modulation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 77672, name = "Searing Flame", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 78353, name = "Sonar Pulse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 78075, name = "Sonic Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 77840, name = "Roaring Flame Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Maloriak", abilities = {
                    { spellId = 77569, name = "Release Aberrations", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 78225, name = "Acid Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 77896, name = "Remedy", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 77699, name = "Flash Freeze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 77786, name = "Scorching Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 78194, name = "Magma Jets", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nefarian", abilities = {
                    { spellId = 78621, name = "Electrocute", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 77826, name = "Shadowflame Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 81007, name = "Shadowblaze Spark", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 79339, name = "Tail Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 79353, name = "Dominion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Bastion of Twilight",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Halfus Wyrmbreaker", abilities = {
                    { spellId = 83703, name = "Furious Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 83908, name = "Shadow Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 83710, name = "Berserk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Theralion and Valiona", abilities = {
                    { spellId = 86408, name = "Theralion's Dazzling Destruction", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 86622, name = "Engulfing Magic", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 86013, name = "Twilight Meteorite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 86369, name = "Blackout", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 86840, name = "Devouring Flames", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 92898, name = "Deep Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ascendant Council", abilities = {
                    { spellId = 82660, name = "Burning Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 82762, name = "Waterlogged", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 83067, name = "Thundershock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 83565, name = "Quake", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 84913, name = "Lava Seed", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 82285, name = "Elemental Stasis", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Cho'gall", abilities = {
                    { spellId = 81628, name = "Conversion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 81713, name = "Flame's Orders", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 81761, name = "Shadow's Orders", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 82414, name = "Darkened Creations", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 82524, name = "Fury of Cho'gall", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 82630, name = "Corruption of the Old God", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Sinestra", abilities = {
                    { spellId = 89421, name = "Wrack", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 92852, name = "Twilight Extinction", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 90045, name = "Indomitable", cleuEvent = "SPELL_AURA_APPLIED" },
                    difficulties = { "10-Player Heroic", "25-Player Heroic" },
                }},
            },
        },
        {
            name = "Throne of the Four Winds",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Conclave of Wind", abilities = {
                    { spellId = 86111, name = "Wind Chill", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 86082, name = "Permafrost", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 85483, name = "Wind Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 84645, name = "Slicing Gale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 86307, name = "Lightning Rod", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Al'Akir", abilities = {
                    { spellId = 87770, name = "Wind Burst", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 87474, name = "Electrocute", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 87856, name = "Squall Line", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 88427, name = "Stormling", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 89588, name = "Lightning Clouds", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Firelands",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic" },
            bosses = {
                { name = "Beth'tilac", abilities = {
                    { spellId = 99052, name = "Smoldering Devastation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99506, name = "Widow's Kiss", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 99990, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Lord Rhyolith", abilities = {
                    { spellId = 98552, name = "Heated Volcano", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 98493, name = "Drink Magma", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 98255, name = "Molten Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Alysrazor", abilities = {
                    { spellId = 99844, name = "Blazing Claw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99432, name = "Burnout", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 99816, name = "Fiery Tornado", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100744, name = "Firestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shannox", abilities = {
                    { spellId = 99837, name = "Crystal Prison Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99840, name = "Immolation Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100002, name = "Hurl Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100415, name = "Rage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Baleroc", abilities = {
                    { spellId = 99352, name = "Decimating Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99256, name = "Torment", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 99516, name = "Inferno Blade", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 99353, name = "Decimation Blade", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 99515, name = "Countdown", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Majordomo Staghelm", abilities = {
                    { spellId = 98450, name = "Searing Seeds", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 98476, name = "Burning Orbs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 98535, name = "Leaping Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 98379, name = "Flame Scythe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ragnaros", abilities = {
                    { spellId = 98710, name = "Sulfuras Smash", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 98953, name = "Magma Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99171, name = "Wrath of Ragnaros", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99172, name = "Hand of Ragnaros", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100460, name = "Living Meteor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 99317, name = "Engulfing Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100646, name = "Dreadflame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 100479, name = "Breadth of Frost", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Dragon Soul",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic", "LFR" },
            bosses = {
                { name = "Morchok", abilities = {
                    { spellId = 103414, name = "Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103851, name = "Resonating Crystal", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103821, name = "Earthen Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 103785, name = "Black Blood of the Earth", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Warlord Zon'ozz", abilities = {
                    { spellId = 103434, name = "Disrupting Shadows", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 104322, name = "Focused Anger", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 104031, name = "Void of the Unmaking", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 104543, name = "Psychic Drain", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Yor'sahj the Unsleeping", abilities = {
                    { spellId = 105573, name = "Void Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 105420, name = "Deep Corruption", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 104849, name = "Searing Blood", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105530, name = "Mana Void", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hagara the Stormbinder", abilities = {
                    { spellId = 105256, name = "Focused Assault", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105316, name = "Ice Lance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105409, name = "Water Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 105289, name = "Shattered Ice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105367, name = "Lightning Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105269, name = "Frozen Tempest", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ultraxion", abilities = {
                    { spellId = 105925, name = "Fading Light", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 106108, name = "Hour of Twilight", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106371, name = "Twilight Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105984, name = "Timeloop", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Warmaster Blackhorn", abilities = {
                    { spellId = 107567, name = "Devastate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 107558, name = "Degeneration", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 108046, name = "Shockwave", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 108040, name = "Disrupting Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 107518, name = "Twilight Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Spine of Deathwing", abilities = {
                    { spellId = 105490, name = "Fiery Grip", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 105845, name = "Nuclear Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 105777, name = "Seal Armor Breach", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106199, name = "Blood Corruption: Death", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Madness of Deathwing", abilities = {
                    { spellId = 105651, name = "Assault Aspect", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106794, name = "Shrapnel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105858, name = "Cataclysm", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 106775, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 109632, name = "Corrupted Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Baradin Hold",
            difficulties = { "10-Player", "25-Player" },
            bosses = {
                { name = "Argaloth", abilities = {
                    { spellId = 88942, name = "Meteor Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 88954, name = "Consuming Darkness", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 88972, name = "Fel Firestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Occu'thar", abilities = {
                    { spellId = 96913, name = "Searing Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 96884, name = "Focused Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 96891, name = "Eyes of Occu'thar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Alizabal", abilities = {
                    { spellId = 105067, name = "Seething Hate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 105784, name = "Blade Dance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106248, name = "Skewer", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 4: Mists of Pandaria
------------------------------------------------------------------------
[4] = {
    name = "Mists of Pandaria",
    dungeons = {
        {
            name = "Temple of the Jade Serpent",
            bosses = {
                { name = "Wise Mari", abilities = {
                    { spellId = 106653, name = "Wash Away", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106612, name = "Hydrolance", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Liu Flameheart", abilities = {
                    { spellId = 106823, name = "Serpent Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106841, name = "Jade Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 107110, name = "Jade Serpent Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sha of Doubt", abilities = {
                    { spellId = 106113, name = "Touch of Nothingness", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 106736, name = "Bounds of Reality", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Stormstout Brewery",
            bosses = {
                { name = "Ook-Ook", abilities = {
                    { spellId = 106651, name = "Going Bananas", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106807, name = "Ground Pound", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hoptallus", abilities = {
                    { spellId = 112944, name = "Furlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 112992, name = "Carrot Breath", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Yan-Zhu the Uncasked", abilities = {
                    { spellId = 114451, name = "Brew Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 106546, name = "Carbonation", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Shado-Pan Monastery",
            bosses = {
                { name = "Gu Cloudstrike", abilities = {
                    { spellId = 102573, name = "Lightning Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 106923, name = "Invoke Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Master Snowdrift", abilities = {
                    { spellId = 106434, name = "Fists of Fury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106853, name = "Tornado Kick", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sha of Violence", abilities = {
                    { spellId = 106872, name = "Sha Spike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106871, name = "Disorienting Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106870, name = "Enrage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Taran Zhu", abilities = {
                    { spellId = 112932, name = "Ring of Malice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 107087, name = "Hatred", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 112929, name = "Rising Hate", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Gate of the Setting Sun",
            bosses = {
                { name = "Saboteur Kip'tilak", abilities = {
                    { spellId = 107268, name = "Sabotage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116297, name = "World in Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Striker Ga'dok", abilities = {
                    { spellId = 107047, name = "Prey Time!", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 106934, name = "Strafing Run", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Commander Ri'mok", abilities = {
                    { spellId = 107120, name = "Viscous Fluid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 107121, name = "Frenzied Assault", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Raigonn", abilities = {
                    { spellId = 107268, name = "Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 111600, name = "Fixate", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Mogu'shan Palace",
            bosses = {
                { name = "Trial of the King", abilities = {
                    { spellId = 119684, name = "Ground Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 119922, name = "Conflagrate", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Gekkan", abilities = {
                    { spellId = 118963, name = "Reckless Inspiration", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Xin the Weaponmaster", abilities = {
                    { spellId = 119684, name = "Ground Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 119311, name = "Blade Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 120160, name = "Death From Above!", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Siege of Niuzao Temple",
            bosses = {
                { name = "Vizier Jin'bak", abilities = {
                    { spellId = 119990, name = "Sap Residue", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 120002, name = "Detonate", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Commander Vo'jak", abilities = {
                    { spellId = 120779, name = "Rising Speed", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 119538, name = "Thousand Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "General Pa'valak", abilities = {
                    { spellId = 124283, name = "Blade Rush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 119875, name = "Tempest", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Wing Leader Ner'onok", abilities = {
                    { spellId = 121284, name = "Hurl Brick", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 121447, name = "Quick-Dry Resin", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 119719, name = "Caustic Pitch", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Mogu'shan Vaults",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic", "LFR" },
            bosses = {
                { name = "The Stone Guard", abilities = {
                    { spellId = 116038, name = "Jasper Chains", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 115861, name = "Cobalt Mine", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116018, name = "Epicenter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116235, name = "Amethyst Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 115842, name = "Overload", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Feng the Accursed", abilities = {
                    { spellId = 116018, name = "Epicenter", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 116157, name = "Lightning Fists", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116295, name = "Wildfire Spark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 116784, name = "Wildfire Infusion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116417, name = "Arcane Resonance", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 116364, name = "Arcane Velocity", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gara'jal the Spiritbinder", abilities = {
                    { spellId = 116161, name = "Crossed Over", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 116272, name = "Banishment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 122151, name = "Voodoo Doll", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 117752, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Spirit Kings", abilities = {
                    { spellId = 117697, name = "Shield of Darkness", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 117961, name = "Impervious Shield", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 118047, name = "Pillage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 118162, name = "Rain of Arrows", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 117837, name = "Maddening Shout", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Elegon", abilities = {
                    { spellId = 117960, name = "Celestial Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 117949, name = "Total Annihilation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116994, name = "Unstable Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 117878, name = "Draw Power", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Will of the Emperor", abilities = {
                    { spellId = 116779, name = "Devastating Combo", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116835, name = "Devastating Arc", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 116969, name = "Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 117485, name = "Energizing Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Heart of Fear",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic", "LFR" },
            bosses = {
                { name = "Imperial Vizier Zor'lok", abilities = {
                    { spellId = 122740, name = "Exhale", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 122706, name = "Noise Cancelling", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 122761, name = "Attenuation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 123812, name = "Pheromones of Zeal", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 122713, name = "Convert", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Blade Lord Ta'yak", abilities = {
                    { spellId = 122854, name = "Tempest Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 123175, name = "Wind Step", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 122839, name = "Unseen Strike", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 123814, name = "Storm Unleashed", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Garalon", abilities = {
                    { spellId = 122735, name = "Crush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 123081, name = "Pheromones", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 122786, name = "Broken Leg", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 123120, name = "Furious Swipe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Wind Lord Mel'jarak", abilities = {
                    { spellId = 122064, name = "Corrosive Resin", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 121881, name = "Wind Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 122125, name = "Rain of Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Amber-Shaper Un'sok", abilities = {
                    { spellId = 121949, name = "Parasitic Growth", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 122370, name = "Reshape Life", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 121994, name = "Amber Scalpel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 122402, name = "Fling", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grand Empress Shek'zeer", abilities = {
                    { spellId = 123788, name = "Cry of Terror", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 124077, name = "Dread Screech", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 123735, name = "Dissonance Field", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 124862, name = "Visions of Demise", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Terrace of Endless Spring",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic", "LFR" },
            bosses = {
                { name = "Protectors of the Endless", abilities = {
                    { spellId = 117309, name = "Lightning Prison", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 118077, name = "Corrupted Waters", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 117986, name = "Defiled Ground", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tsulong", abilities = {
                    { spellId = 122752, name = "Shadow Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 122768, name = "Nightmares", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 122789, name = "Sunbeam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lei Shi", abilities = {
                    { spellId = 123121, name = "Spray", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 123244, name = "Hide", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 123461, name = "Get Away!", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Sha of Fear", abilities = {
                    { spellId = 119414, name = "Breath of Fear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 119593, name = "Cackle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 119888, name = "Ominous Cackle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 120455, name = "Huddle in Terror", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Throne of Thunder",
            difficulties = { "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic", "LFR" },
            bosses = {
                { name = "Jin'rokh the Breaker", abilities = {
                    { spellId = 137313, name = "Lightning Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137162, name = "Static Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137530, name = "Focused Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137371, name = "Thundering Throw", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Horridon", abilities = {
                    { spellId = 136587, name = "Double Swipe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136740, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136769, name = "Dire Call", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136767, name = "Triple Puncture", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Council of Elders", abilities = {
                    { spellId = 136992, name = "Biting Cold", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 137085, name = "Possessed", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 136860, name = "Quicksand", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136903, name = "Frigid Assault", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Tortos", abilities = {
                    { spellId = 134920, name = "Quake Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 133939, name = "Furious Stone Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 134476, name = "Rockfall", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136431, name = "Shell Concussion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Megaera", abilities = {
                    { spellId = 139822, name = "Cinders", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 139840, name = "Arctic Freeze", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 139839, name = "Rot Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 137727, name = "Rampage", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ji-Kun", abilities = {
                    { spellId = 134366, name = "Talon Rake", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 134380, name = "Down Draft", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 138923, name = "Quills", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 134370, name = "Caw", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Durumu the Forgotten", abilities = {
                    { spellId = 133765, name = "Hard Stare", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 133767, name = "Lingering Gaze", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 133775, name = "Life Drain", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 136932, name = "Force of Will", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 133795, name = "Disintegration Beam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Primordius", abilities = {
                    { spellId = 136037, name = "Primordial Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136050, name = "Malformed Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 136218, name = "Acidic Spines", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136228, name = "Volatile Pathogen", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Dark Animus", abilities = {
                    { spellId = 138569, name = "Explosive Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136954, name = "Matter Swap", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 138659, name = "Touch of the Animus", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 138609, name = "Interrupting Jolt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 138644, name = "Anima Font", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Iron Qon", abilities = {
                    { spellId = 134647, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136192, name = "Lightning Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136520, name = "Freeze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 134691, name = "Throw Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137221, name = "Fist Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Twin Consorts", abilities = {
                    { spellId = 137440, name = "Flames of Passion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137408, name = "Fan of Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136722, name = "Cosmic Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137491, name = "Crashing Star", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137531, name = "Ice Comet", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lei Shen", abilities = {
                    { spellId = 135150, name = "Crashing Thunder", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 135695, name = "Thunderstruck", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136543, name = "Ball Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 135091, name = "Decapitate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 136850, name = "Lightning Whip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 136478, name = "Fusion Slash", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 136889, name = "Violent Gale Winds", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 137045, name = "Overwhelming Power", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Ra-den", abilities = {
                    { spellId = 138321, name = "Material of Creation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 138329, name = "Unstable Vita", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 138333, name = "Vita Sensitivity", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 138334, name = "Fatal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    difficulties = { "10-Player Heroic", "25-Player Heroic" },
                }},
            },
        },
        {
            name = "Siege of Orgrimmar",
            difficulties = { "Flexible", "10-Player Normal", "10-Player Heroic", "25-Player Normal", "25-Player Heroic", "LFR" },
            bosses = {
                { name = "Immerseus", abilities = {
                    { spellId = 143295, name = "Sha Bolt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143309, name = "Swirl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143411, name = "Sha Splash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143436, name = "Corrosive Blast", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "The Fallen Protectors", abilities = {
                    { spellId = 143019, name = "Corrupted Brew", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143023, name = "Clash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143840, name = "Mark of Anguish", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 143491, name = "Calamity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143007, name = "Vengeful Strikes", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Norushen", abilities = {
                    { spellId = 146124, name = "Self Doubt", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 144514, name = "Lingering Corruption", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 145216, name = "Burst of Anger", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sha of Pride", abilities = {
                    { spellId = 144358, name = "Wounded Pride", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 144400, name = "Mark of Arrogance", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 144359, name = "Self-Reflection", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144832, name = "Projection", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 145320, name = "Unleashed", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Galakras", abilities = {
                    { spellId = 146757, name = "Flames of Galakrond", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 147068, name = "Pulsing Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Iron Juggernaut", abilities = {
                    { spellId = 144459, name = "Laser Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144485, name = "Scatter Laser", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144467, name = "Explosive Tar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144218, name = "Mortar Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144498, name = "Seismic Activity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144296, name = "Demolisher Cannons", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kor'kron Dark Shaman", abilities = {
                    { spellId = 144005, name = "Froststorm Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143990, name = "Foul Stream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144070, name = "Ashen Wall", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143973, name = "Falling Ash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144089, name = "Toxic Mist", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "General Nazgrim", abilities = {
                    { spellId = 143872, name = "Ravager", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143589, name = "Banner", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143536, name = "Bonecracker", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 143503, name = "Execute", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143494, name = "Sundering Blow", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Malkorok", abilities = {
                    { spellId = 142879, name = "Ancient Miasma", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 142913, name = "Seismic Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 142986, name = "Arcing Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143199, name = "Blood Rage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 142990, name = "Breath of Y'Shaarj", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Spoils of Pandaria", abilities = {
                    { spellId = 145712, name = "Unstable Spark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 145288, name = "Matter Scramble", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Thok the Bloodthirsty", abilities = {
                    { spellId = 143766, name = "Deafening Screech", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143780, name = "Acid Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143773, name = "Freezing Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143783, name = "Scorching Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143343, name = "Tail Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Siegecrafter Blackfuse", abilities = {
                    { spellId = 143385, name = "Electrostatic Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 143265, name = "Launch Sawblade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143856, name = "Overcharge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144208, name = "Death from Above", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 143867, name = "Magnetic Crush", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Paragons of the Klaxxi", abilities = {
                    { spellId = 142671, name = "Injection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 143339, name = "Aim", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 142232, name = "Fiery Edge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 142564, name = "Toxic Injection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 143275, name = "Hurl Amber", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Garrosh Hellscream", abilities = {
                    { spellId = 144616, name = "Desecrate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144969, name = "Whirling Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144985, name = "Gripping Despair", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 145065, name = "Touch of Y'Shaarj", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 144758, name = "Annihilate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 145183, name = "Empowered Whirling Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 145171, name = "Empowered Desecrate", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 5: Warlords of Draenor
------------------------------------------------------------------------
[5] = {
    name = "Warlords of Draenor",
    dungeons = {
        {
            name = "Bloodmaul Slag Mines",
            bosses = {
                { name = "Magmolatus", abilities = {
                    { spellId = 150076, name = "Magma Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 150045, name = "Rough Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 150078, name = "Lava Spit", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Slave Watcher Crushto", abilities = {
                    { spellId = 150801, name = "Wild Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 150753, name = "Crushing Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 150807, name = "Earth Crush", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Roltall", abilities = {
                    { spellId = 150776, name = "Heat Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 150784, name = "Burning Slag", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gug'rokk", abilities = {
                    { spellId = 150677, name = "Molten Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 150678, name = "Magma Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 150757, name = "Unstable Slag", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Iron Docks",
            bosses = {
                { name = "Fleshrender Nok'gar", abilities = {
                    { spellId = 164632, name = "Barbed Arrow Barrage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 164426, name = "Reckless Provocation", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grimrail Enforcers", abilities = {
                    { spellId = 163665, name = "Sanguine Sphere", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 163689, name = "Lava Barrage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 163705, name = "Lava Sweep", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Oshir", abilities = {
                    { spellId = 162415, name = "Feeding Frenzy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162383, name = "Breakout", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 178126, name = "Primal Assault", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Skulloc", abilities = {
                    { spellId = 168227, name = "Cannon Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 168401, name = "Gronn Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 168348, name = "Rapid Fire", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Auchindoun",
            bosses = {
                { name = "Vigilant Kaathar", abilities = {
                    { spellId = 153006, name = "Sanctified Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153396, name = "Hallowed Ground", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154527, name = "Consecrated Light", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Soulbinder Nyami", abilities = {
                    { spellId = 154442, name = "Soul Vessel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153007, name = "Mind Spike", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 156751, name = "Torn Spirits", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Azzakel", abilities = {
                    { spellId = 153764, name = "Curtain of Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153392, name = "Fel Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153234, name = "Fel Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153240, name = "Malevolence", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Teron'gor", abilities = {
                    { spellId = 156857, name = "Rain of Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 156921, name = "Chaos Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 156963, name = "Seed of Malevolence", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 169179, name = "Demonic Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Skyreach",
            bosses = {
                { name = "Ranjit", abilities = {
                    { spellId = 153535, name = "Four Winds", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153544, name = "Fan of Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153564, name = "Windwall", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Araknath", abilities = {
                    { spellId = 154135, name = "Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154043, name = "Smash", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Rukhran", abilities = {
                    { spellId = 153757, name = "Quills", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153679, name = "Screech", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153827, name = "Solar Breath", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "High Sage Viryx", abilities = {
                    { spellId = 153954, name = "Lens Flare", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154043, name = "Solar Burst", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 153623, name = "Cast Down", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Everbloom",
            bosses = {
                { name = "Witherbark", abilities = {
                    { spellId = 164275, name = "Parched Gasp", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 164294, name = "Unchecked Growth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 164357, name = "Agitated Water", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ancient Protectors", abilities = {
                    { spellId = 168082, name = "Torrential Fury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 168041, name = "Rapid Tides", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 167977, name = "Bramble Patch", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Archmage Sol", abilities = {
                    { spellId = 166492, name = "Parasitic Growth", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 166473, name = "Fireball", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 166726, name = "Frost Bomb", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 166383, name = "Arcane Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Yalnu", abilities = {
                    { spellId = 169108, name = "Colossal Blow", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 169179, name = "Entanglement", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 169120, name = "Genesis", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Grimrail Depot",
            bosses = {
                { name = "Rocketspark and Borka", abilities = {
                    { spellId = 163534, name = "Lava Wreath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 164218, name = "Mad Dash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nitrogg Thundertower", abilities = {
                    { spellId = 163550, name = "Blackrock Mortar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 164185, name = "Suppressive Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Skylord Tovra", abilities = {
                    { spellId = 164636, name = "Freezing Snare", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 164648, name = "Spinning Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 164632, name = "Thunderous Breath", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Shadowmoon Burial Grounds",
            bosses = {
                { name = "Sadana Bloodfury", abilities = {
                    { spellId = 153153, name = "Daggerfall", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153240, name = "Dark Eclipse", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 164974, name = "Whispers of the Dark Star", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nhallish", abilities = {
                    { spellId = 152792, name = "Soul Steal", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 152801, name = "Void Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 153623, name = "Void Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Bonemaw", abilities = {
                    { spellId = 153804, name = "Inhale", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 153692, name = "Necrotic Pitch", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154175, name = "Body Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ner'zhul", abilities = {
                    { spellId = 154442, name = "Malevolence", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 162696, name = "Omen of Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154350, name = "Ritual of Bones", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Upper Blackrock Spire",
            bosses = {
                { name = "Orebender Gor'ashan", abilities = {
                    { spellId = 154435, name = "Thunder Cacophony", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154294, name = "Lodestone Spike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156203, name = "Power Conduit", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Kyrak", abilities = {
                    { spellId = 161235, name = "Debilitating Fixation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162406, name = "Vileblood Serum", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Commander Tharbek", abilities = {
                    { spellId = 162497, name = "Iron Reaver", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155037, name = "Imbued Iron Axe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ragewing the Untamed", abilities = {
                    { spellId = 155605, name = "Engulfing Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 155057, name = "Burning Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 155051, name = "Swirling Winds", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Warlord Zaela", abilities = {
                    { spellId = 155721, name = "Black Iron Cyclone", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155726, name = "Destructive Smite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155864, name = "Burning Breath", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Highmaul",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Kargath Bladefist", abilities = {
                    { spellId = 159113, name = "Impale", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 159250, name = "Berserker Rush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 159947, name = "Chain Hurl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 159410, name = "Blade Dance", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Butcher", abilities = {
                    { spellId = 156147, name = "The Cleaver", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156171, name = "The Tenderizer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156157, name = "Bounding Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156152, name = "Gushing Wounds", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 156598, name = "Frenzy", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Brackenspore", abilities = {
                    { spellId = 163241, name = "Necrotic Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 159219, name = "Infesting Spores", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 159220, name = "Creeping Moss", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 160013, name = "Decay", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tectus", abilities = {
                    { spellId = 162288, name = "Crystalline Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162346, name = "Tectonic Upheaval", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162475, name = "The Living Mountain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162892, name = "Earthen Pillar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Twin Ogron", abilities = {
                    { spellId = 155569, name = "Pulverize", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 158385, name = "Shield Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 157943, name = "Enfeebling Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 158134, name = "Whirlwind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 158093, name = "Double Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ko'ragh", abilities = {
                    { spellId = 161242, name = "Caustic Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162185, name = "Expel Magic: Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162186, name = "Expel Magic: Arcane", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 161328, name = "Expel Magic: Frost", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 162184, name = "Expel Magic: Shadow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 161612, name = "Suppression Field", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Imperator Mar'gok", abilities = {
                    { spellId = 156238, name = "Arcane Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156467, name = "Destructive Resonance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 158563, name = "Force Nova", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 157349, name = "Mark of Chaos", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 156471, name = "Branded", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 158012, name = "Intermission: Transition", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Blackrock Foundry",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Gruul", abilities = {
                    { spellId = 155080, name = "Inferno Slice", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 155301, name = "Overhead Smash", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 155326, name = "Petrifying Slam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 173192, name = "Cave In", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155539, name = "Shatter", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Oregorger", abilities = {
                    { spellId = 156203, name = "Retched Blackrock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155897, name = "Acid Torrent", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 155898, name = "Rolling Fury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156374, name = "Explosive Shard", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hans'gar and Franzok", abilities = {
                    { spellId = 153470, name = "Body Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 157139, name = "Shattered Vertebrae", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 156938, name = "Disrupting Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 153762, name = "Crippling Suplex", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Beastlord Darmac", abilities = {
                    { spellId = 154960, name = "Pin Down", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155222, name = "Tantrum", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155030, name = "Rend and Tear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 154989, name = "Superheated Shrapnel", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Flamebender Ka'graz", abilities = {
                    { spellId = 155277, name = "Lava Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155314, name = "Molten Torrent", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 155318, name = "Blazing Radiance", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 155493, name = "Firestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Operator Thogar", abilities = {
                    { spellId = 155921, name = "Prototype Pulse Grenade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155864, name = "Enkindle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156554, name = "Moving Train", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Blast Furnace", abilities = {
                    { spellId = 155225, name = "Melt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155223, name = "Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156934, name = "Rupture", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 155743, name = "Heat", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Kromog", abilities = {
                    { spellId = 156766, name = "Warped Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 157060, name = "Rune of Crushing Earth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156704, name = "Slam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 157054, name = "Thundering Blows", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156852, name = "Fists of Stone", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 157659, name = "Rune of Grasping Earth", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Iron Maidens", abilities = {
                    { spellId = 158010, name = "Blade Dash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156631, name = "Rapid Fire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 158692, name = "Blood Ritual", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 159724, name = "Penetrating Shot", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 158078, name = "Convulsive Shadows", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Blackhand", abilities = {
                    { spellId = 156096, name = "Marked for Death", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 155992, name = "Demolition", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156928, name = "Massive Shattering Smash", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 156425, name = "Impaling Throw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 157000, name = "Attach Slag Bombs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 156401, name = "Slag Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Hellfire Citadel",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Hellfire Assault", abilities = {
                    { spellId = 184369, name = "Howling Axe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 180945, name = "Felfire Volley", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Iron Reaver", abilities = {
                    { spellId = 179889, name = "Artillery", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 179897, name = "Blitz", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 182055, name = "Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 182280, name = "Pounding", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 179893, name = "Immolation", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Kormrok", abilities = {
                    { spellId = 181305, name = "Swat", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 181307, name = "Pound", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 181296, name = "Foul Crush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 181292, name = "Explosive Runes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 180244, name = "Grasping Hands", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hellfire High Council", abilities = {
                    { spellId = 184358, name = "Reap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 184476, name = "Mark of the Necromancer", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 184681, name = "Fel Rage", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 184360, name = "Wailing Horror", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Kilrogg Deadeye", abilities = {
                    { spellId = 180199, name = "Heart Seeker", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 181488, name = "Vision of Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 184067, name = "Death Throes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 180389, name = "Shred Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Gorefiend", abilities = {
                    { spellId = 179995, name = "Shared Fate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 179867, name = "Touch of Doom", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 181973, name = "Feast of Souls", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 182601, name = "Shadow of Death", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 179909, name = "Surging Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shadow-Lord Iskar", abilities = {
                    { spellId = 181912, name = "Fel Incineration", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 185345, name = "Phantasmal Winds", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 181753, name = "Fel Chakram", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 179219, name = "Phantasmal Fel Bomb", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Socrethar the Eternal", abilities = {
                    { spellId = 182051, name = "Felblaze Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 181288, name = "Exert Dominance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 184124, name = "Apocalypse", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 180008, name = "Volatile Fel Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tyrant Velhari", abilities = {
                    { spellId = 180526, name = "Annihilating Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 182459, name = "Edict of Condemnation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 180608, name = "Touch of Harm", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 179986, name = "Font of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 180040, name = "Despoiled Ground", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fel Lord Zakuun", abilities = {
                    { spellId = 179428, name = "Seed of Destruction", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 181508, name = "Cavitation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 179407, name = "Disembodied", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 181653, name = "Fel Crystal", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Xhul'horac", abilities = {
                    { spellId = 186490, name = "Fel Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 186407, name = "Void Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 186271, name = "Felsinged", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 186073, name = "Void Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 186134, name = "Empowered Chains of Fel", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mannoroth", abilities = {
                    { spellId = 181557, name = "Massive Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 181354, name = "Glaive Thrust", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 181275, name = "Curse of the Legion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 181597, name = "Mannoroth's Gaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 182006, name = "Empowered Felseeker", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 181099, name = "Mark of Doom", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Archimonde", abilities = {
                    { spellId = 189895, name = "Shadowfel Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 182879, name = "Doomfire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 183864, name = "Shadow Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 183828, name = "Death Brand", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 184265, name = "Wrought Chaos", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 183817, name = "Nether Banish", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 187255, name = "Rain of Chaos", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 185590, name = "Demonic Feedback", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 6: Legion
------------------------------------------------------------------------
[6] = {
    name = "Legion",
    dungeons = {
        {
            name = "Eye of Azshara",
            bosses = {
                { name = "Warlord Parjesh", abilities = {
                    { spellId = 192094, name = "Impaling Spear", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 192135, name = "Crashing Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197064, name = "Throw Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lady Hatecoil", abilities = {
                    { spellId = 193698, name = "Curse of the Witch", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 193712, name = "Focused Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197324, name = "Static Nova", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Serpentrix", abilities = {
                    { spellId = 191797, name = "Poison Spit", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 191848, name = "Toxic Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 192050, name = "Submerge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "King Deepbeard", abilities = {
                    { spellId = 193093, name = "Ground Slam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 193018, name = "Gaseous Bubbles", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 193152, name = "Quake", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Wrath of Azshara", abilities = {
                    { spellId = 192706, name = "Arcane Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 192675, name = "Mystic Tornado", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 192985, name = "Tidal Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197365, name = "Massive Deluge", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Darkheart Thicket",
            bosses = {
                { name = "Archdruid Glaidalis", abilities = {
                    { spellId = 198379, name = "Primal Rampage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 196346, name = "Grievous Tear", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 198376, name = "Nightfall", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Oakheart", abilities = {
                    { spellId = 204574, name = "Crushing Grip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 204611, name = "Strangling Roots", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 204667, name = "Nightmare Breath", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Dresaron", abilities = {
                    { spellId = 199389, name = "Earthshaking Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 199345, name = "Down Draft", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 191325, name = "Breath of Corruption", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Shade of Xavius", abilities = {
                    { spellId = 200182, name = "Festering Rip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 200050, name = "Nightmare Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 200289, name = "Growing Paranoia", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 200243, name = "Feed on the Weak", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Halls of Valor",
            bosses = {
                { name = "Hymdall", abilities = {
                    { spellId = 193092, name = "Bloodletting Sweep", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 188114, name = "Horn of Valor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 193235, name = "Dancing Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hyrja", abilities = {
                    { spellId = 192048, name = "Expel Light", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 191976, name = "Arcing Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 192018, name = "Shield of Light", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Fenryr", abilities = {
                    { spellId = 196543, name = "Ravenous Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 196512, name = "Claw Frenzy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197556, name = "Scent of Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "God-King Skovald", abilities = {
                    { spellId = 193659, name = "Felblaze Rush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 193826, name = "Ragnarok", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 193702, name = "Savage Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Odyn", abilities = {
                    { spellId = 198077, name = "Shatter Spears", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197961, name = "Runic Brand", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 198263, name = "Radiant Tempest", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 198088, name = "Glowing Fragment", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Neltharion's Lair",
            bosses = {
                { name = "Rokmora", abilities = {
                    { spellId = 188169, name = "Shatter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 192800, name = "Razor Shards", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ularogg Cragshaper", abilities = {
                    { spellId = 198496, name = "Bellow of the Deeps", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 198564, name = "Strike of the Mountain", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Naraxas", abilities = {
                    { spellId = 199176, name = "Spiked Tongue", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 205549, name = "Rancid Maw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 199246, name = "Toxic Retch", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Dargrul the Underking", abilities = {
                    { spellId = 200732, name = "Molten Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 200551, name = "Landslide", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 200700, name = "Magma Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 200404, name = "Magma Breaker", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Maw of Souls",
            bosses = {
                { name = "Ymiron, the Fallen King", abilities = {
                    { spellId = 193211, name = "Dark Slash", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 193364, name = "Screams of the Dead", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 193566, name = "Bane", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Harbaron", abilities = {
                    { spellId = 194216, name = "Cosmic Scythe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 194325, name = "Fragment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 194668, name = "Nether Rip", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Helya", abilities = {
                    { spellId = 197264, name = "Taint of the Sea", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 196947, name = "Torrent", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 227233, name = "Corrupted Bellow", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 185539, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Vault of the Wardens",
            bosses = {
                { name = "Tirathon Saltheril", abilities = {
                    { spellId = 191823, name = "Furious Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 191941, name = "Darkstrikes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 191853, name = "Hatred", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Inquisitor Tormentorum", abilities = {
                    { spellId = 199917, name = "Shadow Sweep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 200898, name = "Sap Soul", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Ash'Golm", abilities = {
                    { spellId = 192519, name = "Lava", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 192520, name = "Smoldering", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 192527, name = "Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Glazer", abilities = {
                    { spellId = 194945, name = "Lingering Gaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 194943, name = "Pulse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 202046, name = "Beam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Cordana Felsong", abilities = {
                    { spellId = 197541, name = "Detonating Moonglaive", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197333, name = "Fel Glaive", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 213583, name = "Creeping Doom", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197422, name = "Deepening Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Black Rook Hold",
            bosses = {
                { name = "The Amalgam of Souls", abilities = {
                    { spellId = 194956, name = "Reap Soul", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 196587, name = "Soul Echoes", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 194966, name = "Swirling Scythe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Illysanna Ravencrest", abilities = {
                    { spellId = 197418, name = "Dark Rush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197546, name = "Brutal Glaive", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197696, name = "Eye Beams", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Smashspite the Hateful", abilities = {
                    { spellId = 198073, name = "Earthshaking Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 198079, name = "Hateful Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 198245, name = "Brutal Haymaker", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lord Kur'talos Ravencrest", abilities = {
                    { spellId = 198820, name = "Dark Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 198641, name = "Whirling Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 198635, name = "Unerring Shear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 199143, name = "Cloud of Hypnosis", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 198833, name = "Shadow Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "The Arcway",
            bosses = {
                { name = "Ivanyr", abilities = {
                    { spellId = 196562, name = "Nether Link", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 196392, name = "Overcharge Mana", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 196805, name = "Volatile Magic", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Corstilax", abilities = {
                    { spellId = 196068, name = "Suppression Protocol", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 195804, name = "Quarantine", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 196115, name = "Cleansing Force", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "General Xakal", abilities = {
                    { spellId = 197776, name = "Fel Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 197810, name = "Wicked Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 220443, name = "Shadow Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Advisor Vandros", abilities = {
                    { spellId = 203176, name = "Accelerating Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 203882, name = "Chrono Shift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 220871, name = "Force Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Court of Stars",
            bosses = {
                { name = "Patrol Captain Gerdo", abilities = {
                    { spellId = 207278, name = "Arcane Lockdown", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 207261, name = "Resonant Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 224333, name = "Signal Beacon", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Talixae Flamewreath", abilities = {
                    { spellId = 207906, name = "Burning Intensity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 207981, name = "Withering Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 211457, name = "Infernal Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Advisor Melandrus", abilities = {
                    { spellId = 209602, name = "Blade Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 209676, name = "Piercing Gale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 209628, name = "Slicing Maelstrom", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Cathedral of Eternal Night",
            bosses = {
                { name = "Agronox", abilities = {
                    { spellId = 236524, name = "Fulminating Lashers", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 236527, name = "Timber Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Thrashbite the Scornful", abilities = {
                    { spellId = 237726, name = "Scornful Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 237781, name = "Pulverizing Cudgel", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Domatrax", abilities = {
                    { spellId = 236543, name = "Felsoul Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 236544, name = "Chaotic Energy", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mephistroth", abilities = {
                    { spellId = 233206, name = "Carrion Swarm", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 234107, name = "Shadow Fade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 233155, name = "Dark Solitude", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Seat of the Triumvirate",
            bosses = {
                { name = "Zuraal the Ascended", abilities = {
                    { spellId = 244653, name = "Void Sludge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245510, name = "Coalesced Void", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Saprish", abilities = {
                    { spellId = 247246, name = "Shadow Blitz", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 247245, name = "Umbral Flanking", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Viceroy Nezhar", abilities = {
                    { spellId = 244751, name = "Entropic Force", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244916, name = "Dark Bulwark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 244588, name = "Howling Dark", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "L'ura", abilities = {
                    { spellId = 245164, name = "Fragment of Despair", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245289, name = "Naaru's Lament", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245040, name = "Backlash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "The Emerald Nightmare",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Nythendra", abilities = {
                    { spellId = 203096, name = "Rot", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 202977, name = "Infested Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 203045, name = "Infested Ground", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 205070, name = "Volatile Rot", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 202978, name = "Heart of the Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Elerethe Renferal", abilities = {
                    { spellId = 210547, name = "Dark Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 215443, name = "Raking Talons", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 215582, name = "Razor Wing", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 210864, name = "Web of Pain", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 212707, name = "Gathering Clouds", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Il'gynoth, Heart of Corruption", abilities = {
                    { spellId = 208929, name = "Spew Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 210099, name = "Fixate", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 209471, name = "Nightmare Explosion", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 208689, name = "Cursed Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 215128, name = "Dark Reconstitution", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Ursoc", abilities = {
                    { spellId = 198108, name = "Overwhelm", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 197943, name = "Rend Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 205611, name = "Miasma", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 198006, name = "Focused Gaze", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 197969, name = "Roaring Cacophony", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dragons of Nightmare", abilities = {
                    { spellId = 204767, name = "Volatile Infection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 205300, name = "Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 204078, name = "Shadow Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 203770, name = "Mark of Ysondre", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Cenarius", abilities = {
                    { spellId = 210279, name = "Creeping Nightmares", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 211471, name = "Scorned Touch", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 211368, name = "Desiccating Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 214884, name = "Nightmare Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 212726, name = "Spear of Nightmares", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Xavius", abilities = {
                    { spellId = 206651, name = "Darkening Soul", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 211802, name = "Nightmare Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 205588, name = "Corruption: Descent into Madness", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 209158, name = "Bonds of Terror", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 226194, name = "Writhing Deep", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Trial of Valor",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Odyn", abilities = {
                    { spellId = 228918, name = "Stormforged Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 227807, name = "Storm of Justice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 228683, name = "Cleansing Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 229584, name = "Runic Brand", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 228162, name = "Shatter Spears", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Guarm", abilities = {
                    { spellId = 227514, name = "Flaming Slobber", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 227539, name = "Frost Lick", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 228248, name = "Shadow Lick", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 227816, name = "Guardian's Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 228201, name = "Multi-Headed", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Helya", abilities = {
                    { spellId = 227967, name = "Bilewater Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 228032, name = "Orb of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 228565, name = "Corrupted Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 228054, name = "Taint of the Sea", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 232488, name = "Dark Waters", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Nighthold",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Skorpyron", abilities = {
                    { spellId = 204275, name = "Arcanoslash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 204459, name = "Focused Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 204471, name = "Shockwave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 204284, name = "Broken Shard", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Chronomatic Anomaly", abilities = {
                    { spellId = 206609, name = "Time Release", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 206607, name = "Chronometric Particles", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 207871, name = "Passage of Time", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 212099, name = "Temporal Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Trilliax", abilities = {
                    { spellId = 206788, name = "Arcane Seepage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 206641, name = "Arcane Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 208910, name = "Arcing Bonds", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 207328, name = "Toxic Slice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 206820, name = "Annihilation", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Spellblade Aluriel", abilities = {
                    { spellId = 212492, name = "Annihilate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 212647, name = "Mark of Frost", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 212736, name = "Pool of Frost", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 213278, name = "Searing Brand", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Star Augur Etraeus", abilities = {
                    { spellId = 205984, name = "Icy Ejection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 206388, name = "Fel Ejection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 206965, name = "Void Ejection", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 206464, name = "Coronal Ejection", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 207439, name = "Grand Conjunction", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "High Botanist Tel'arn", abilities = {
                    { spellId = 218304, name = "Parasitic Fetter", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 218342, name = "Toxic Spores", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 218438, name = "Call of Night", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 218774, name = "Controlled Chaos", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 219049, name = "Solar Collapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tichondrius", abilities = {
                    { spellId = 206480, name = "Carrion Plague", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 216040, name = "Feast of Blood", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 208230, name = "Echoes of the Void", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 213534, name = "Brand of Argus", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Krosus", abilities = {
                    { spellId = 205368, name = "Orb of Destruction", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 205370, name = "Fel Beam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 206677, name = "Burning Pitch", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 205420, name = "Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grand Magistrix Elisande", abilities = {
                    { spellId = 209615, name = "Arcanetic Ring", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 209244, name = "Spanning Singularity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 211261, name = "Permeliative Torment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 209166, name = "Ablation", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 209973, name = "Ablating Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gul'dan", abilities = {
                    { spellId = 206219, name = "Liquid Hellfire", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 206939, name = "Well of Souls", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 206222, name = "Bonds of Fel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 206840, name = "Empowered Bonds of Fel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 211152, name = "Empowered Eye of Gul'dan", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 206744, name = "Flames of Sargeras", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 167819, name = "Storm of the Destroyer", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Tomb of Sargeras",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Goroth", abilities = {
                    { spellId = 231363, name = "Burning Armor", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 233062, name = "Infernal Spike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 233279, name = "Shattering Star", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 232061, name = "Infernal Burning", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Demonic Inquisition", abilities = {
                    { spellId = 233426, name = "Bone Saw", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 233983, name = "Echoing Anguish", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 233441, name = "Calcified Quills", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 248713, name = "Suffocating Dark", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Harjatan", abilities = {
                    { spellId = 231854, name = "Unchecked Rage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 232061, name = "Draw In", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 231770, name = "Frigid Blows", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 232174, name = "Frosty Discharge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sisters of the Moon", abilities = {
                    { spellId = 236305, name = "Twilight Glaive", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 236519, name = "Moon Burn", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 236697, name = "Embraced by the Moon", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 236712, name = "Lunar Beacon", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Mistress Sassz'ine", abilities = {
                    { spellId = 230959, name = "Hydra Shot", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 230358, name = "Thundering Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 232722, name = "Slicing Tornado", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 232754, name = "Consuming Hunger", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Desolate Host", abilities = {
                    { spellId = 235989, name = "Tormented Cries", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 236361, name = "Spirit Chains", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 236459, name = "Soulbind", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 236542, name = "Sundering Doom", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 236544, name = "Doomed Sundering", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Maiden of Vigilance", abilities = {
                    { spellId = 235267, name = "Infusion", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 248812, name = "Blowback", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 235028, name = "Fel Hammer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 241635, name = "Hammer of Creation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 241636, name = "Hammer of Obliteration", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fallen Avatar", abilities = {
                    { spellId = 234059, name = "Unbound Chaos", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 239132, name = "Rupture Realities", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 234057, name = "Shadowy Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 236604, name = "Dark Mark", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Kil'jaeden", abilities = {
                    { spellId = 239932, name = "Felclaws", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 236378, name = "Shadow Reflection: Erupting", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 236710, name = "Shadow Reflection: Wailing", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 234295, name = "Armageddon", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 238430, name = "Bursting Dreadflame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 240910, name = "Darkness of a Thousand Souls", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Antorus, the Burning Throne",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Garothi Worldbreaker", abilities = {
                    { spellId = 244761, name = "Annihilation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 246220, name = "Decimation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244969, name = "Eradication", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 240277, name = "Fel Bombardment", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Felhounds of Sargeras", abilities = {
                    { spellId = 244056, name = "Molten Touch", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244768, name = "Desolate Gaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 251445, name = "Burning Maw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244057, name = "Enflamed", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Antoran High Command", abilities = {
                    { spellId = 244625, name = "Fusillade", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 244910, name = "Felshield Emitter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245161, name = "Psychic Assault", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 244172, name = "Summon Reinforcements", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Portal Keeper Hasabel", abilities = {
                    { spellId = 244016, name = "Reality Tear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244000, name = "Collapsing World", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 245118, name = "Felstorm Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244949, name = "Everburning Flames", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Eonar the Life-Binder", abilities = {
                    { spellId = 248861, name = "Spear of Doom", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 249121, name = "Final Doom", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Imonar the Soulhunter", abilities = {
                    { spellId = 247367, name = "Shock Lance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 248070, name = "Empowered Pulse Grenade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 247641, name = "Stasis Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 247687, name = "Sever", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kin'garoth", abilities = {
                    { spellId = 246833, name = "Ruiner", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 246840, name = "Decimation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 254919, name = "Forging Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 246779, name = "Apocalypse Protocol", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Varimathras", abilities = {
                    { spellId = 243961, name = "Misery", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 244042, name = "Marked Prey", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 243999, name = "Shadow Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 243960, name = "Dark Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244005, name = "Necrotic Embrace", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Coven of Shivarra", abilities = {
                    { spellId = 245518, name = "Fiery Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245586, name = "Chilled Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 245627, name = "Shadow Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245671, name = "Orb of Frost", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 246329, name = "Storm of Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Aggramar", abilities = {
                    { spellId = 244291, name = "Foe Breaker", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 245458, name = "Flame Rend", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 245301, name = "Taeshalach Technique", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 245983, name = "Flare", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 244693, name = "Blazing Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Argus the Unmaker", abilities = {
                    { spellId = 248165, name = "Cone of Death", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 248499, name = "Sweeping Scythe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 248396, name = "Soulblight", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 251570, name = "Soulburst", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 251571, name = "Soulbomb", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 256544, name = "Tortured Rage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 252516, name = "End of All Things", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 7: Battle for Azeroth
------------------------------------------------------------------------
[7] = {
    name = "Battle for Azeroth",
    dungeons = {
        {
            name = "Atal'Dazar",
            bosses = {
                { name = "Priestess Alun'za", abilities = {
                    { spellId = 255558, name = "Tainted Blood", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 255577, name = "Transfusion", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 255579, name = "Gilded Claws", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vol'kaal", abilities = {
                    { spellId = 250258, name = "Toxic Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 250036, name = "Reanimation Totem", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 250585, name = "Toxic Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rezan", abilities = {
                    { spellId = 255371, name = "Terrifying Visage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 255434, name = "Serrated Teeth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 255421, name = "Devour", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Yazma", abilities = {
                    { spellId = 249919, name = "Wracking Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 250096, name = "Soulrend", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 249923, name = "Skewer", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Freehold",
            bosses = {
                { name = "Skycap'n Kragg", abilities = {
                    { spellId = 256016, name = "Revitalizing Brew", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 256106, name = "Azerite Powder Shot", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 256005, name = "Dive Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Council o' Captains", abilities = {
                    { spellId = 256589, name = "Barrel Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 258338, name = "Blackout Barrel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 258352, name = "Grapeshot", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ring of Booty", abilities = {
                    { spellId = 256358, name = "Shark Tornado", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 256363, name = "Ripper Punch", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Harlan Sweete", abilities = {
                    { spellId = 257278, name = "Cannon Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257316, name = "Swiftwind Saber", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257402, name = "Loaded Dice: All Hands!", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "King's Rest",
            bosses = {
                { name = "The Golden Serpent", abilities = {
                    { spellId = 265773, name = "Spit Gold", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 265781, name = "Lucre's Call", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mchimba the Embalmer", abilities = {
                    { spellId = 267618, name = "Drain Fluids", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 267626, name = "Entomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267702, name = "Burn Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Council of Tribes", abilities = {
                    { spellId = 266951, name = "Barrel Through", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267273, name = "Poison Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 266231, name = "Severing Axe", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dazar, The First King", abilities = {
                    { spellId = 268932, name = "Quaking Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 268586, name = "Blade Combo", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 269369, name = "Deathly Roar", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "The MOTHERLODE!!",
            bosses = {
                { name = "Coin-Operated Crowd Pummeler", abilities = {
                    { spellId = 256493, name = "Blazing Azerite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257337, name = "Shocking Claw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 262347, name = "Static Pulse", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Azerokk", abilities = {
                    { spellId = 258622, name = "Resonant Quake", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 271698, name = "Azerite Infusion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257593, name = "Call Earthrager", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rixxa Fluxflame", abilities = {
                    { spellId = 259940, name = "Propellant Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 259853, name = "Chemical Burn", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 260669, name = "Azerite Catalyst", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mogul Razdunk", abilities = {
                    { spellId = 260189, name = "Configuration: Drill", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 260280, name = "Gatling Gun", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 271456, name = "Micro Missiles", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 260811, name = "Homing Missile", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Temple of Sethraliss",
            bosses = {
                { name = "Adderis and Aspix", abilities = {
                    { spellId = 263371, name = "Conduction", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 263573, name = "Cyclone Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 263914, name = "Lightning Shield", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Merektha", abilities = {
                    { spellId = 263958, name = "A Knot of Snakes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 263927, name = "Noxious Breath", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Galvazzt", abilities = {
                    { spellId = 266923, name = "Galvanize", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 263365, name = "Consume Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Avatar of Sethraliss", abilities = {
                    { spellId = 269970, name = "Plague", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 268013, name = "Flame Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 274642, name = "Jaws of the Serpent", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Waycrest Manor",
            bosses = {
                { name = "Heartsbane Triad", abilities = {
                    { spellId = 260773, name = "Unstable Runic Mark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 260703, name = "Unstable Hex", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 260741, name = "Jagged Nettles", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 260907, name = "Soul Manipulation", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Soulbound Goliath", abilities = {
                    { spellId = 260508, name = "Soul Thorns", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 260512, name = "Soul Harvest", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 260541, name = "Crush", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Raal the Gluttonous", abilities = {
                    { spellId = 264923, name = "Tenderize", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 264931, name = "Consume All", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 264694, name = "Rotten Expulsion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lord and Lady Waycrest", abilities = {
                    { spellId = 261438, name = "Wasting Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 261440, name = "Virulent Pathogen", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 268278, name = "Wracking Chord", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 261447, name = "Discordant Cadenza", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Gorak Tul", abilities = {
                    { spellId = 266181, name = "Darkened Lightning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 266225, name = "Death Lens", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 266198, name = "Alchemical Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Tol Dagor",
            bosses = {
                { name = "The Sand Queen", abilities = {
                    { spellId = 257495, name = "Sandstorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257092, name = "Upheaval", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Jes Howlis", abilities = {
                    { spellId = 257785, name = "Flashing Daggers", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257791, name = "Howling Fear", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Knight Captain Valyri", abilities = {
                    { spellId = 256955, name = "Cinderflame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 256083, name = "Cross Ignition", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Overseer Korgus", abilities = {
                    { spellId = 256038, name = "Azerite Rounds: Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 256044, name = "Deadeye", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 256101, name = "Explosive Burst", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 263345, name = "Cross Ignition", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Siege of Boralus",
            bosses = {
                { name = "Chopper Redhook", abilities = {
                    { spellId = 257585, name = "Meat Hook", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257584, name = "Heavy Hitter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 272471, name = "On the Hook", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dread Captain Lockwood", abilities = {
                    { spellId = 268230, name = "Gut Shot", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 268260, name = "Broadside", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 268443, name = "Dread Volley", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hadal Darkfathom", abilities = {
                    { spellId = 257862, name = "Tidal Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 257882, name = "Break Water", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 261563, name = "Crashing Tide", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Viq'Goth", abilities = {
                    { spellId = 270590, name = "Call of the Deep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 274991, name = "Putrid Waters", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 269456, name = "Demolishing Terror", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Underrot",
            bosses = {
                { name = "Elder Leaxa", abilities = {
                    { spellId = 260894, name = "Creeping Rot", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 260685, name = "Taint of G'huun", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 264603, name = "Blood Mirror", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Cragmaw the Infested", abilities = {
                    { spellId = 260793, name = "Indigestion", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 260455, name = "Tantrum", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 260333, name = "Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sporecaller Zancha", abilities = {
                    { spellId = 259718, name = "Upheaval", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 259830, name = "Festering Harvest", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 259732, name = "Festering Shockwave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Unbound Abomination", abilities = {
                    { spellId = 269843, name = "Vile Expulsion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 269310, name = "Putrid Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 269411, name = "Rotting Regurgitation", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Shrine of the Storm",
            bosses = {
                { name = "Aqu'sirr", abilities = {
                    { spellId = 264560, name = "Choking Brine", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 264101, name = "Surging Rush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 264166, name = "Undertow", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tidesage Council", abilities = {
                    { spellId = 267818, name = "Slicing Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 267899, name = "Hindering Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267956, name = "Swiftness Ward", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Lord Stormsong", abilities = {
                    { spellId = 268347, name = "Void Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 269131, name = "Ancient Mindbender", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 268214, name = "Carving Flesh", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vol'zith the Whisperer", abilities = {
                    { spellId = 267037, name = "Whispers of Power", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 267034, name = "Yawning Gate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 269399, name = "Tentacle Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Uldir",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Taloc", abilities = {
                    { spellId = 271224, name = "Plasma Discharge", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 271296, name = "Cudgel of Gore", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 275270, name = "Sanguine Static", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 271728, name = "Retrieve Cudgel", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "MOTHER", abilities = {
                    { spellId = 267787, name = "Sanitizing Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267795, name = "Wind Tunnel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267878, name = "Purifying Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 268198, name = "Uldir Defensive Beam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fetid Devourer", abilities = {
                    { spellId = 262292, name = "Rotting Regurgitation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 262313, name = "Malodorous Miasma", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 262277, name = "Shockwave Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Zek'voz, Herald of N'Zoth", abilities = {
                    { spellId = 265231, name = "Void Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 265530, name = "Surging Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 265646, name = "Will of the Corruptor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 265237, name = "Shatter", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267180, name = "Orb of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vectis", abilities = {
                    { spellId = 265129, name = "Omega Vector", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 265178, name = "Evolving Affliction", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 265212, name = "Gestate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 265217, name = "Liquefy", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Zul, Reborn", abilities = {
                    { spellId = 273365, name = "Dark Revelation", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 273434, name = "Locus of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 274358, name = "Rupturing Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 274168, name = "Pool of Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mythrax the Unraveler", abilities = {
                    { spellId = 272407, name = "Oblivion Sphere", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 274113, name = "Imminent Ruin", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 272115, name = "Obliteration Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 272536, name = "Imminent Ruin", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "G'huun", abilities = {
                    { spellId = 263482, name = "Reorigination Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 270373, name = "Wave of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 267409, name = "Dark Bargain", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 270428, name = "Malignant Growth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 263235, name = "Blood Feast", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Battle of Dazar'alor",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Champion of the Light", abilities = {
                    { spellId = 283572, name = "Sacred Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 283598, name = "Wave of Light", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 283628, name = "Divine Burst", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 284468, name = "Seal of Retribution", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grong", abilities = {
                    { spellId = 282543, name = "Bestial Throw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 282555, name = "Tantrum", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285875, name = "Rending Bite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285660, name = "Megatomic Seeker Missile", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Jadefire Masters", abilities = {
                    { spellId = 282037, name = "Rising Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285632, name = "Stalking", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 286379, name = "Magma Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285428, name = "Dragon's Breath", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Opulence", abilities = {
                    { spellId = 283507, name = "Volatile Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 287037, name = "Liquid Gold", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 283610, name = "Spirits of Gold", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285014, name = "Coin Shower", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Conclave of the Chosen", abilities = {
                    { spellId = 282079, name = "Loa's Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285878, name = "Paku's Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 286811, name = "Akunda's Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 282636, name = "Kimbul's Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "King Rastakhan", abilities = {
                    { spellId = 284831, name = "Scorching Detonation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 285195, name = "Plague of Toads", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 284662, name = "Seal of Purification", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285349, name = "Death's Door", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 288449, name = "Death Rift", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mekkatorque", abilities = {
                    { spellId = 282182, name = "Buster Cannon", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 287891, name = "Signal Exploding Sheep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 282153, name = "Anti-Tampering Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 286646, name = "Gigavolt Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Stormwall Blockade", abilities = {
                    { spellId = 284361, name = "Sea Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 284362, name = "Storm's Wail", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 284405, name = "Tempting Sirens", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lady Jaina Proudmoore", abilities = {
                    { spellId = 285253, name = "Ice Shard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 287365, name = "Searing Pitch", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285177, name = "Frozen Solid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 287626, name = "Grasp of Frost", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 287490, name = "Glacial Ray", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 289220, name = "Heart of Frost", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Crucible of Storms",
            difficulties = { "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "The Restless Cabal", abilities = {
                    { spellId = 282384, name = "Shear Mind", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 282432, name = "Crushing Doubt", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 282561, name = "Dark Herald", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 282738, name = "Promises of Power", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Uu'nat, Harbinger of the Void", abilities = {
                    { spellId = 284804, name = "Insatiable Torment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285185, name = "Void Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285367, name = "Piercing Gaze of N'Zoth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 285638, name = "Gift of N'Zoth: Obscurity", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "The Eternal Palace",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Abyssal Commander Sivara", abilities = {
                    { spellId = 295704, name = "Overflow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 294726, name = "Toxic Brand", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 294711, name = "Frost Mark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 295332, name = "Crushing Reverberation", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Blackwater Behemoth", abilities = {
                    { spellId = 292127, name = "Darkest Depths", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 292167, name = "Toxic Spine", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 292138, name = "Radiant Biomass", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Radiance of Azshara", abilities = {
                    { spellId = 295920, name = "Ancient Tempest", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 296566, name = "Tide Fist", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 296428, name = "Arcane Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lady Ashvane", abilities = {
                    { spellId = 296725, name = "Barnacle Bash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 296752, name = "Cutting Coral", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 297333, name = "Briny Bubble", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 296942, name = "Rippling Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Orgozoa", abilities = {
                    { spellId = 298156, name = "Desensitizing Sting", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 298242, name = "Incubation Fluid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 305057, name = "Massive Incubator", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Queen's Court", abilities = {
                    { spellId = 296851, name = "Zealous Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 297564, name = "Suffering", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 300545, name = "Mighty Rupture", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Za'qul, Harbinger of Ny'alotha", abilities = {
                    { spellId = 292963, name = "Crushing Grasp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 295495, name = "Mind Tether", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 295327, name = "Manifest Nightmares", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 303819, name = "Delirium Realm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Queen Azshara", abilities = {
                    { spellId = 297907, name = "Painful Memories", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 300428, name = "Arcane Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 298569, name = "Drain Ancient Ward", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 303981, name = "Nether Portal", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 298756, name = "Serene", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Ny'alotha, the Waking City",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Wrathion", abilities = {
                    { spellId = 306735, name = "Incineration", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 306289, name = "Creeping Madness", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 306163, name = "Burning Cataclysm", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 305978, name = "Searing Breath", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Maut", abilities = {
                    { spellId = 305663, name = "Shadow Wounds", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 306005, name = "Devour Magic", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 307805, name = "Black Wings", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 314993, name = "Stygian Annihilation", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "The Prophet Skitra", abilities = {
                    { spellId = 307937, name = "Shred Psyche", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 307950, name = "Shadow Shock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 309652, name = "Illusionary Projection", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dark Inquisitor Xanesh", abilities = {
                    { spellId = 311551, name = "Abyssal Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 312406, name = "Void Ritual", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 306311, name = "Soul Flay", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "The Hivemind", abilities = {
                    { spellId = 313652, name = "Acid Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 313461, name = "Volatile Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 313460, name = "Nullification", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Shad'har the Insatiable", abilities = {
                    { spellId = 312099, name = "Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 306928, name = "Crush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 306929, name = "Dissolve", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 307471, name = "Entropic Buildup", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Drest'agath", abilities = {
                    { spellId = 310277, name = "Void Glare", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 310309, name = "Mutterings of Insanity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 310358, name = "Entropic Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vexiona", abilities = {
                    { spellId = 307343, name = "Shadow Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 307019, name = "Void Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 307317, name = "Twilight Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 307421, name = "Annihilation", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Ra-den the Despoiled", abilities = {
                    { spellId = 306819, name = "Void Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 306732, name = "Decaying Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 310003, name = "Void Collapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 306257, name = "Unstable Vita", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Il'gynoth, Corruption Reborn", abilities = {
                    { spellId = 309961, name = "Eye of N'Zoth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 310322, name = "Morass of Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 311159, name = "Cursed Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Carapace of N'Zoth", abilities = {
                    { spellId = 307061, name = "Madness Bomb", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 306973, name = "Infinite Void", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 306984, name = "Insanity Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 315947, name = "Breed Madness", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "N'Zoth the Corruptor", abilities = {
                    { spellId = 310184, name = "Paranoia", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 317112, name = "Anguish", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 313400, name = "Corrupted Mind", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 316711, name = "Mindgrasp", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 313793, name = "Flames of Insanity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 310042, name = "Evoke Anguish", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 8: Shadowlands
------------------------------------------------------------------------
[8] = {
    name = "Shadowlands",
    dungeons = {
        {
            name = "The Necrotic Wake",
            bosses = {
                { name = "Blightbone", abilities = {
                    { spellId = 320596, name = "Heaving Retch", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 320637, name = "Fetid Gas", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320655, name = "Crunch", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Amarth, The Harvester", abilities = {
                    { spellId = 320170, name = "Necrotic Bolt", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 321226, name = "Land of the Dead", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 333488, name = "Necrotic Breath", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Surgeon Stitchflesh", abilities = {
                    { spellId = 334476, name = "Mutilate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320200, name = "Stitchneedle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320366, name = "Embalming Ichor", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Nalthor the Rimebinder", abilities = {
                    { spellId = 320788, name = "Frozen Binds", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 321894, name = "Comet Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320772, name = "Dark Exile", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323730, name = "Icebound Aegis", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Plaguefall",
            bosses = {
                { name = "Globgrog", abilities = {
                    { spellId = 324667, name = "Beckon Slime", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 324527, name = "Plaguestomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 326242, name = "Slime Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Doctor Ickus", abilities = {
                    { spellId = 329110, name = "Slime Injection", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 329217, name = "Slime Lunge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 330404, name = "Virulent Explosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Domina Venomblade", abilities = {
                    { spellId = 325552, name = "Cytotoxic Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 325245, name = "Shadow Ambush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 328395, name = "Brood Assassins", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Margrave Stradama", abilities = {
                    { spellId = 322232, name = "Infectious Rain", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 322358, name = "Plaguebound Devoted", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 322492, name = "Touch of Slime", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 325369, name = "Malignant Spawn", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Mists of Tirna Scithe",
            bosses = {
                { name = "Ingra Maloch", abilities = {
                    { spellId = 323137, name = "Embrace Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323177, name = "Repulsive Visage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 321005, name = "Spirit Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Mistcaller", abilities = {
                    { spellId = 321834, name = "Dodge Ball", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 336759, name = "Freeze Tag", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 321828, name = "Patty Cake", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tred'ova", abilities = {
                    { spellId = 322614, name = "Mind Link", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 322450, name = "Consumption", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 326281, name = "Acid Expulsion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Halls of Atonement",
            bosses = {
                { name = "Halkias, the Sin-Stained Goliath", abilities = {
                    { spellId = 322711, name = "Refracted Sinlight", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 322943, name = "Heave Debris", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 322936, name = "Crumbling Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Echelon", abilities = {
                    { spellId = 319703, name = "Blood Torrent", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 319941, name = "Curse of Stone", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 319733, name = "Stone Shattering Leap", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "High Adjudicator Aleez", abilities = {
                    { spellId = 323538, name = "Bolt of Power", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 323650, name = "Volley of Power", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323552, name = "Anima Fountain", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lord Chamberlain", abilities = {
                    { spellId = 329171, name = "Telekinetic Toss", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323437, name = "Stigma of Pride", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 329113, name = "Ritual of Woe", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 323236, name = "Door of Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Theater of Pain",
            bosses = {
                { name = "An Affront of Challengers", abilities = {
                    { spellId = 320248, name = "Searing Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320180, name = "Noxious Spores", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320069, name = "Necromantic Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Gorechop", abilities = {
                    { spellId = 318406, name = "Tenderize", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323515, name = "Hateful Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323681, name = "Dark Devastation", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Xav the Unfallen", abilities = {
                    { spellId = 317231, name = "Crushing Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320729, name = "Massive Cleave", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 320644, name = "Oppressive Banner", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kul'tharok", abilities = {
                    { spellId = 319521, name = "Draw Soul", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 319626, name = "Phantasmal Parasite", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 319669, name = "Grasping Hands", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mordretha, the Endless Empress", abilities = {
                    { spellId = 323608, name = "Dark Devastation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 324079, name = "Reaping Scythe", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323825, name = "Grasping Rift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323831, name = "Death Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "De Other Side",
            bosses = {
                { name = "Hakkar the Soulflayer", abilities = {
                    { spellId = 322736, name = "Blood Barrier", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 322746, name = "Corrupted Blood", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 323064, name = "Blood Nova", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Manastorms", abilities = {
                    { spellId = 320232, name = "Shadowfury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320147, name = "Buzz-Saw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 320171, name = "Echo Finger Laser X-treme", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Dealer Xy'exa", abilities = {
                    { spellId = 320232, name = "Arcane Lightning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 321066, name = "Displacement Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323687, name = "Arcane Vulnerability", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Mueh'zala", abilities = {
                    { spellId = 325258, name = "Soulcrusher", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 325725, name = "Cosmic Artifice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 327427, name = "Shattered Dominion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 326171, name = "Master of Death", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Spires of Ascension",
            bosses = {
                { name = "Kin-Tara", abilities = {
                    { spellId = 320966, name = "Overhead Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 324368, name = "Attenuated Barrage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 321009, name = "Charged Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ventunax", abilities = {
                    { spellId = 324205, name = "Dark Stride", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323943, name = "Shadowhirl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 324427, name = "Dark Bolt", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Oryphrion", abilities = {
                    { spellId = 323195, name = "Purifying Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 323831, name = "Empyreal Ordnance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 324608, name = "Charged Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Devos, Paragon of Doubt", abilities = {
                    { spellId = 322818, name = "Lost Confidence", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 322999, name = "Abyssal Detonation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323137, name = "Run Through", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 322943, name = "Archon's Bastion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Sanguine Depths",
            bosses = {
                { name = "Kryxis the Voracious", abilities = {
                    { spellId = 319654, name = "Hungering Drain", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 319685, name = "Vicious Headbutt", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 319713, name = "Severing Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Executor Tarvold", abilities = {
                    { spellId = 322554, name = "Castigate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 322429, name = "Sintouched Anima", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Grand Proctor Beryllia", abilities = {
                    { spellId = 325360, name = "Rite of Supremacy", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 325254, name = "Iron Spikes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 325382, name = "Agonize", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "General Kaal", abilities = {
                    { spellId = 323810, name = "Wicked Rush", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 322903, name = "Piercing Blur", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 323845, name = "Gloom Squall", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Castle Nathria",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Shriekwing", abilities = {
                    { spellId = 328857, name = "Exsanguinating Bite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 330711, name = "Earsplitting Shriek", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 340324, name = "Sanguine Ichor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 329370, name = "Deadly Descent", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Huntsman Altimor", abilities = {
                    { spellId = 334945, name = "Sinseeker", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 334852, name = "Petrifying Howl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 334797, name = "Rip Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 335114, name = "Shades of Bargast", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sun King's Salvation", abilities = {
                    { spellId = 325877, name = "Blazing Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 328479, name = "Eyes of the Ember Court", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 329518, name = "Smoldering Remnants", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Artificer Xy'mox", abilities = {
                    { spellId = 325236, name = "Glyph of Destruction", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 326271, name = "Stasis Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 327902, name = "Fixate", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 328437, name = "Seed of Extinction", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Hungering Destroyer", abilities = {
                    { spellId = 329298, name = "Gluttonous Miasma", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 329455, name = "Desolate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 334522, name = "Consume", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 329774, name = "Expunge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Lady Inerva Darkvein", abilities = {
                    { spellId = 325936, name = "Shared Cognition", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 325382, name = "Warped Desires", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 324983, name = "Change of Heart", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 332664, name = "Concentrated Anima", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Council of Blood", abilities = {
                    { spellId = 327052, name = "Danse Macabre", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 330848, name = "Wrong Moves", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 327773, name = "Drain Essence", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 346690, name = "Castellan's Cadre", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sludgefist", abilities = {
                    { spellId = 332318, name = "Destructive Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 332687, name = "Chain Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 335293, name = "Hateful Gaze", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 335361, name = "Stonequake", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Stone Legion Generals", abilities = {
                    { spellId = 333387, name = "Wicked Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 334498, name = "Seismic Upheaval", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 339690, name = "Crystalize", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 334765, name = "Heart Rend", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sire Denathrius", abilities = {
                    { spellId = 326851, name = "Blood Price", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 327796, name = "Night Hunter", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 329951, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 328276, name = "March of the Penitent", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 332585, name = "Hand of Destruction", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 335873, name = "Rancor", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Sanctum of Domination",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "The Tarragrue", abilities = {
                    { spellId = 347283, name = "Predator's Howl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 346985, name = "Overpower", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 347668, name = "Hungering Mist", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Eye of the Jailer", abilities = {
                    { spellId = 350816, name = "Annihilating Glare", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 349979, name = "Dragging Chains", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 348074, name = "Assailing Lance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 350763, name = "Spreading Misery", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Nine", abilities = {
                    { spellId = 350202, name = "Unending Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 350475, name = "Pierce Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 350542, name = "Fragments of Destiny", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Remnant of Ner'zhul", abilities = {
                    { spellId = 350073, name = "Malevolence", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 349890, name = "Suffering", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 350469, name = "Orbs of Torment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 354634, name = "Grasp of Malice", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Soulrender Dormazain", abilities = {
                    { spellId = 350615, name = "Torment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 350648, name = "Brand of Torment", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 350422, name = "Tormented Eruptions", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 351779, name = "Rendered Soul", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Painsmith Raznal", abilities = {
                    { spellId = 355568, name = "Shadowsteel Embers", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 348508, name = "Flameclasp Trap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 355778, name = "Forge Weapon", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 355540, name = "Spiked Balls", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Guardian of the First Ones", abilities = {
                    { spellId = 352538, name = "Purging Protocol", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 352394, name = "Threat Neutralization", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 352589, name = "Disintegration", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 352833, name = "Obliterate", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Fatescribe Roh-Kalo", abilities = {
                    { spellId = 350568, name = "Call of Eternity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 353162, name = "Invoke Destiny", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 354964, name = "Twist Fate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 350819, name = "Fated Conjunction", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kel'Thuzad", abilities = {
                    { spellId = 352530, name = "Howling Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 346530, name = "Shadow Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 348071, name = "Frost Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 352051, name = "Glacial Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 354289, name = "Obey or Suffer", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sylvanas Windrunner", abilities = {
                    { spellId = 349458, name = "Domination Chains", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 347704, name = "Veil of Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 348109, name = "Banshee Wail", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 353929, name = "Banshee's Heartseeker", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 353935, name = "Raze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 354147, name = "Wailing Arrow", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Sepulcher of the First Ones",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Vigilant Guardian", abilities = {
                    { spellId = 360458, name = "Exposed Core", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 360162, name = "Pneumatic Impact", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 359610, name = "Deresolved", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Skolex, the Insatiable Ravener", abilities = {
                    { spellId = 359976, name = "Ravening Burrow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 359979, name = "Riftmaw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 360451, name = "Rend", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Artificer Xy'mox", abilities = {
                    { spellId = 362801, name = "Glyph of Relocation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 362803, name = "Dimensional Tear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 363413, name = "Forerunner Rings", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Halondrus the Reclaimer", abilities = {
                    { spellId = 360115, name = "Reclaim", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 361309, name = "Lightshatter Beam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 360906, name = "Earthbreaker Missiles", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Anduin Wrynn", abilities = {
                    { spellId = 361989, name = "Befouled Barrier", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 362405, name = "Blasphemy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 365295, name = "Wicked Star", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 361815, name = "Domination Word: Pain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 362862, name = "Kingsmourne Hungers", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Lords of Dread", abilities = {
                    { spellId = 360146, name = "Fearful Trepidation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 360012, name = "Cloud of Carrion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 360300, name = "Infiltration of Dread", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 361914, name = "Anguishing Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rygelon", abilities = {
                    { spellId = 362206, name = "Celestial Collapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 361548, name = "Dark Eclipse", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 361745, name = "Corrupted Wound", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Jailer", abilities = {
                    { spellId = 362028, name = "Martyrdom", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 363332, name = "Torment", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 362631, name = "Domination", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 366284, name = "Desolation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 365150, name = "Chains of Anguish", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 360281, name = "Rune of Damnation", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 9: Dragonflight
------------------------------------------------------------------------
[9] = {
    name = "Dragonflight",
    dungeons = {
        {
            name = "Ruby Life Pools",
            bosses = {
                { name = "Melidrussa Chillworn", abilities = {
                    { spellId = 372851, name = "Chillstorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 372858, name = "Frost Overload", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 373680, name = "Awaken Whelps", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kokia Blazehoof", abilities = {
                    { spellId = 372107, name = "Blazebound Firestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 372863, name = "Ritual of Blazebinding", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 373017, name = "Molten Boulder", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kyrakka and Erkhart Stormvein", abilities = {
                    { spellId = 381512, name = "Roaring Firebreath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 381517, name = "Winds of Change", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 381525, name = "Stormslam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 381862, name = "Infernocore", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "The Nokhud Offensive",
            bosses = {
                { name = "Granyth", abilities = {
                    { spellId = 386916, name = "Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 385017, name = "Tectonic Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Raging Tempest", abilities = {
                    { spellId = 384620, name = "Electrical Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 384686, name = "Lightning Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 384808, name = "Energy Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Teera and Maruuk", abilities = {
                    { spellId = 382836, name = "Gale Arrow", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 382670, name = "Frightful Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 386063, name = "Brutalize", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Balakar Khan", abilities = {
                    { spellId = 375937, name = "Rending Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376644, name = "Iron Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376725, name = "Upheaval", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376864, name = "Static Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Azure Vault",
            bosses = {
                { name = "Leymor", abilities = {
                    { spellId = 374567, name = "Explosive Brand", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 374789, name = "Infused Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375591, name = "Erupting Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Azureblade", abilities = {
                    { spellId = 384132, name = "Overwhelming Energy", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 372222, name = "Arcane Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 385578, name = "Ancient Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Telash Greywing", abilities = {
                    { spellId = 386781, name = "Absolute Zero", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 387151, name = "Frost Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 386910, name = "Icy Devastator", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Umbrelskul", abilities = {
                    { spellId = 384978, name = "Crystalline Roar", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 385399, name = "Crackling Vortex", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 385083, name = "Unleashed Destruction", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Algeth'ar Academy",
            bosses = {
                { name = "Vexamus", abilities = {
                    { spellId = 385958, name = "Arcane Fissure", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 386012, name = "Mana Bombs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 386073, name = "Arcane Expulsion", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Overgrown Ancient", abilities = {
                    { spellId = 388623, name = "Germinate", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 388544, name = "Barkbreaker", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 396716, name = "Branch Out", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Crawth", abilities = {
                    { spellId = 377034, name = "Savage Peck", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376997, name = "Firestorm", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 377004, name = "Deafening Screech", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Echo of Doragosa", abilities = {
                    { spellId = 389011, name = "Arcane Rift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 388984, name = "Overwhelming Power", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 374361, name = "Astral Breath", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Halls of Infusion",
            bosses = {
                { name = "Watcher Irideus", abilities = {
                    { spellId = 384351, name = "Power Overload", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 384524, name = "Titanic Fist", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 384014, name = "Static Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gulping Goliath", abilities = {
                    { spellId = 385531, name = "Gulp", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 385187, name = "Belly Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 374389, name = "Toxic Effluvia", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Khajin the Unyielding", abilities = {
                    { spellId = 386757, name = "Hailbombs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 386743, name = "Glacial Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 386559, name = "Frost Cyclone", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Primal Tsunami", abilities = {
                    { spellId = 387504, name = "Tempest's Fury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 387571, name = "Infused Globule", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 388882, name = "Focused Deluge", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Neltharus",
            bosses = {
                { name = "Chargath, Bane of Scales", abilities = {
                    { spellId = 375056, name = "Grounding Chain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 373424, name = "Fiery Focus", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375062, name = "Dragon Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Forgemaster Gorek", abilities = {
                    { spellId = 374534, name = "Might of the Forge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375449, name = "Forgestorm", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 374635, name = "Blazing Hammer", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Magmatusk", abilities = {
                    { spellId = 375890, name = "Magma Eruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375251, name = "Volatile Mutation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 381482, name = "Lava Spray", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Warlord Sargha", abilities = {
                    { spellId = 377018, name = "Magma Shield", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376780, name = "Burning Ember", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 391056, name = "Backdraft", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376875, name = "Dragon's Kiln", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Brackenhide Hollow",
            bosses = {
                { name = "Hackclaw's War-Band", abilities = {
                    { spellId = 378020, name = "Savage Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 378229, name = "Decayed Senses", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 381694, name = "Hextrick Totem", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Treemouth", abilities = {
                    { spellId = 382549, name = "Consume", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 383875, name = "Vine Whip", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 376934, name = "Grasping Vines", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Gutshot", abilities = {
                    { spellId = 384353, name = "Gut Shot", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 384577, name = "Meat Toss", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 384416, name = "Master's Call", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Decatriarch Wratheye", abilities = {
                    { spellId = 377864, name = "Decaying Strength", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 377950, name = "Withering Contagion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 373917, name = "Choking Rotcloud", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Uldaman: Legacy of Tyr",
            bosses = {
                { name = "The Lost Dwarves", abilities = {
                    { spellId = 369573, name = "Heavy Arrow", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 369602, name = "Fiery Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Bromach", abilities = {
                    { spellId = 382071, name = "Call of the Deep", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 369703, name = "Thundering Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 369811, name = "Quaking Totem", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sentinel Talondras", abilities = {
                    { spellId = 372718, name = "Crushing Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 372600, name = "Resonating Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 372652, name = "Titanic Empowerment", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Emberon", abilities = {
                    { spellId = 369110, name = "Purging Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 369029, name = "Searing Clap", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 369063, name = "Unstable Embers", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Chrono-Lord Deios", abilities = {
                    { spellId = 376325, name = "Rewind Timeflow", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 376049, name = "Wing Buffet", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375727, name = "Time Sink", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 376208, name = "Eternity Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Vault of the Incarnates",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Eranog", abilities = {
                    { spellId = 370648, name = "Collapsing Army", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 396094, name = "Incinerating Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 370615, name = "Molten Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 390715, name = "Flamerift", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Terros", abilities = {
                    { spellId = 381253, name = "Rock Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 383073, name = "Resonating Annihilation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 386352, name = "Concussive Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 382458, name = "Awakened Earth", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Primal Council", abilities = {
                    { spellId = 371624, name = "Conductive Mark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 386440, name = "Primal Blizzard", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 374038, name = "Meteor Axes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 371983, name = "Earthen Pillars", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sennarth, The Cold Breath", abilities = {
                    { spellId = 371976, name = "Chilling Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 372082, name = "Enveloping Webs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 371977, name = "Gossamer Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 372044, name = "Pervasive Cold", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Dathea, Ascended", abilities = {
                    { spellId = 391686, name = "Conductive Mark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 388302, name = "Raging Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 391382, name = "Crosswinds", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375580, name = "Zephyr Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Kurog Grimtotem", abilities = {
                    { spellId = 390548, name = "Erupting Bedrock", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 391019, name = "Frigid Torrent", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 374215, name = "Searing Carnage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 374023, name = "Thunder Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 374691, name = "Primal Barrier", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Broodkeeper Diurna", abilities = {
                    { spellId = 388716, name = "Broodkeeper's Fury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 380483, name = "Wildfire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375871, name = "Icy Shroud", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375809, name = "Mortal Stoneclaws", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 375829, name = "Chilling Tantrum", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Raszageth the Storm-Eater", abilities = {
                    { spellId = 377612, name = "Hurricane Wing", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 381615, name = "Static Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 385065, name = "Lightning Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 381251, name = "Volatile Current", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 388643, name = "Thunderous Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 377467, name = "Fulminating Charge", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "Aberrus, the Shadowed Crucible",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Kazzara, the Hellforged", abilities = {
                    { spellId = 406530, name = "Wings of Extinction", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 404743, name = "Hellsteel Carnage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 402420, name = "Dread Rift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 401319, name = "Infernal Heart", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "The Amalgamation Chamber", abilities = {
                    { spellId = 403459, name = "Umbral Detonation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 403101, name = "Swirling Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 405394, name = "Shadowflame Burst", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 405437, name = "Gloom Conflagration", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "The Forgotten Experiments", abilities = {
                    { spellId = 405392, name = "Rending Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 405375, name = "Unstable Essence", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 407552, name = "Massive Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 406358, name = "Temporal Anomaly", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Assault of the Zaqali", abilities = {
                    { spellId = 401258, name = "Magma Flow", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 409271, name = "Flaming Cudgel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 410516, name = "Volcanic Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rashok, the Elder", abilities = {
                    { spellId = 405821, name = "Searing Slam", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 405819, name = "Doom Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 407641, name = "Charged Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 405827, name = "Shadowlava Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Vigilant Steward, Zskarn", abilities = {
                    { spellId = 404010, name = "Blast Wave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 405736, name = "Dragonfire Traps", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 404942, name = "Tactical Destruction", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 405592, name = "Unstable Embers", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Magmorax", abilities = {
                    { spellId = 402994, name = "Lava Ejection", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 403671, name = "Blazing Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 404846, name = "Molten Spittle", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 408839, name = "Overpowering Stomp", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Echo of Neltharion", abilities = {
                    { spellId = 401998, name = "Calamitous Strike", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 402120, name = "Rushing Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 405433, name = "Shadow Claw", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 407917, name = "Sunder Reality", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 403049, name = "Ebon Destruction", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Scalecommander Sarkareth", abilities = {
                    { spellId = 401330, name = "Burning Claws", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 401810, name = "Oppressing Howl", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 401383, name = "Scorching Bomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 404456, name = "Oblivion", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 403520, name = "Embrace of Nothingness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 401500, name = "Void Claws", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Amirdrassil, the Dream's Hope",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Gnarlroot", abilities = {
                    { spellId = 421898, name = "Controlled Burn", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 422026, name = "Dreadfire Barrage", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 421972, name = "Shadowflame Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424352, name = "Uprooted Agony", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Igira the Cruel", abilities = {
                    { spellId = 414888, name = "Blistering Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 416996, name = "Twisting Blade", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 414425, name = "Heart Stopper", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424456, name = "Marked for Torment", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Volcoross", abilities = {
                    { spellId = 421431, name = "Flood of the Firelands", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 420933, name = "Coiling Flames", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 421672, name = "Scorchtail Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Council of Dreams", abilities = {
                    { spellId = 421029, name = "Barreling Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 420525, name = "Song of the Dragon", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421024, name = "Polymorph Bomb", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Larodar, Keeper of the Flame", abilities = {
                    { spellId = 417653, name = "Scorching Roots", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421316, name = "Raging Inferno", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 417634, name = "Furious Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 425025, name = "Flash Fire", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Nymue, Weaver of the Cycle", abilities = {
                    { spellId = 420846, name = "Continuum", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421527, name = "Weaver's Burden", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 420554, name = "Surging Growth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 426519, name = "Full Bloom", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Smolderon", abilities = {
                    { spellId = 421455, name = "Brand of Damnation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 421407, name = "Overheated", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 422691, name = "World in Flames", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421858, name = "Lava Geysers", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Tindral Sageswift, Seer of the Flame", abilities = {
                    { spellId = 422115, name = "Blazing Mushroom", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421636, name = "Fiery Growth", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 424495, name = "Falling Star", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 420540, name = "Mass Entanglement", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424580, name = "Supernova", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Fyrakk the Blazing", abilities = {
                    { spellId = 417431, name = "Fyr'alath's Bite", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 417443, name = "Fyr'alath's Mark", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 421937, name = "Dream Rend", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 422518, name = "Shadowflame Devastation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 422524, name = "Blaze", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 428971, name = "Apocalypse Roar", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 10: The War Within
------------------------------------------------------------------------
[10] = {
    name = "The War Within",
    dungeons = {
        {
            name = "The Rookery",
            bosses = {
                { name = "Kyrioss", abilities = {
                    { spellId = 424148, name = "Lightning Torrent", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424368, name = "Crashing Thunder", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424205, name = "Wild Lightning", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Stormguard Gorren", abilities = {
                    { spellId = 424737, name = "Chaotic Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424958, name = "Dark Gravity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424966, name = "Void Rift", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Voidstone Monstrosity", abilities = {
                    { spellId = 425394, name = "Void Shell", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 425413, name = "Null Upheaval", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 425974, name = "Oblivion Wave", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "The Stonevault",
            bosses = {
                { name = "E.D.N.A.", abilities = {
                    { spellId = 424879, name = "Seismic Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424888, name = "Drill Combo", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424903, name = "Earth Shatterer", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Skarmorak", abilities = {
                    { spellId = 423200, name = "Void Discharge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 423246, name = "Crystalline Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 423313, name = "Unstable Crash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Master Machinists", abilities = {
                    { spellId = 428202, name = "Blazing Crescendo", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 428709, name = "Exhaust Vents", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 428120, name = "Molten Metal", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Void Speaker Eirich", abilities = {
                    { spellId = 427329, name = "Entropic Reckoning", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 427157, name = "Unbridled Void", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 427382, name = "Void Corruption", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
            },
        },
        {
            name = "City of Threads",
            bosses = {
                { name = "Orator Krix'vizk", abilities = {
                    { spellId = 434137, name = "Terrorize", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 434083, name = "Shadow Volley", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 434151, name = "Chains of Oppression", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fangs of the Queen", abilities = {
                    { spellId = 440218, name = "Ice Sickles", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440468, name = "Shade Slash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 434089, name = "Knife Throw", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Coaglamation", abilities = {
                    { spellId = 441216, name = "Blood Surge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 441218, name = "Viscous Darkness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 442285, name = "Dark Pulse", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Izo, the Grand Splicer", abilities = {
                    { spellId = 439401, name = "Splice", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 439621, name = "Tremor Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 438860, name = "Umbral Weave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 439646, name = "Process of Elimination", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Ara-Kara, City of Echoes",
            bosses = {
                { name = "Avanoxx", abilities = {
                    { spellId = 438473, name = "Toxic Rupture", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 438476, name = "Gossamer Onslaught", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 438477, name = "Voracious Bite", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Anub'zekt", abilities = {
                    { spellId = 433740, name = "Impale", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 433677, name = "Burrow Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 433766, name = "Ceaseless Swarm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Ki'katal the Harvester", abilities = {
                    { spellId = 432031, name = "Grasping Blood", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 432117, name = "Venom Volley", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 432130, name = "Cultivated Poisons", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Darkflame Cleft",
            bosses = {
                { name = "Ol' Waxbeard", abilities = {
                    { spellId = 421067, name = "Reckless Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421638, name = "Rock Buster", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Blazikon", abilities = {
                    { spellId = 422700, name = "Dousing Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 422577, name = "Wicklighter Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 422150, name = "Enkindling Inferno", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Darkness", abilities = {
                    { spellId = 428266, name = "Eternal Darkness", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 427176, name = "Call Darkspawn", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 422806, name = "Smothering Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Priory of the Sacred Flame",
            bosses = {
                { name = "Captain Dailcry", abilities = {
                    { spellId = 447439, name = "Battle Cry", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 447272, name = "Pierce Armor", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424419, name = "Hurl Spear", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Baron Braunpyke", abilities = {
                    { spellId = 444681, name = "Vindictive Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 444745, name = "Burning Light", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 445739, name = "Castigator's Shield", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Prioress Murrpray", abilities = {
                    { spellId = 447967, name = "Holy Smite", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 447443, name = "Inner Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 447468, name = "Holy Flame", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Dawnbreaker",
            bosses = {
                { name = "Speaker Shadowcrown", abilities = {
                    { spellId = 449734, name = "Obsidian Blast", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 449736, name = "Darkness Comes", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 451102, name = "Shadow Shroud", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Anub'ikkaj", abilities = {
                    { spellId = 452127, name = "Terrifying Slam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 451098, name = "Dark Orb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 452099, name = "Burrow Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rasha'nan", abilities = {
                    { spellId = 453212, name = "Acid Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 453271, name = "Rolling Acid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 453345, name = "Erosive Spray", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "Cinderbrew Meadery",
            bosses = {
                { name = "Brew Master Aldryr", abilities = {
                    { spellId = 440134, name = "Blazing Belch", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440200, name = "Keg Smash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440267, name = "Happy Hour", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "I'pa", abilities = {
                    { spellId = 440553, name = "Spouting Stout", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440612, name = "Brew Storm", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Benk Buzzbee", abilities = {
                    { spellId = 440820, name = "Bee-Haw!", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440851, name = "Honey Splash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440903, name = "Swarm!", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Goldie Baronbottom", abilities = {
                    { spellId = 441210, name = "Spread the Love!", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 441277, name = "Cash Cannon", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 441340, name = "Burning Bounty", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "Nerub-ar Palace",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Ulgrax the Devourer", abilities = {
                    { spellId = 434776, name = "Venomous Lash", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 434803, name = "Digestive Acid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 435136, name = "Carnivorous Contest", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 435138, name = "Hungering Bellows", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "The Bloodbound Horror", abilities = {
                    { spellId = 444363, name = "Gruesome Disgorge", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 445936, name = "Bloodcurdle", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 443612, name = "Crimson Rain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 442530, name = "Spewing Hemorrhage", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sikran, Captain of the Sureki", abilities = {
                    { spellId = 439559, name = "Decimate", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 433517, name = "Phase Blades", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 439511, name = "Rain of Arrows", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Rasha'nan", abilities = {
                    { spellId = 439789, name = "Rolling Acid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 439811, name = "Expelling Webs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 454989, name = "Spinneret's Strands", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 439784, name = "Erosive Spray", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Broodtwister Ovi'nax", abilities = {
                    { spellId = 442432, name = "Ingest Black Blood", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 441362, name = "Volatile Concoction", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 442257, name = "Experimental Dosage", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Nexus-Princess Ky'veza", abilities = {
                    { spellId = 437620, name = "Twilight Massacre", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 436867, name = "Nether Rift", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 440377, name = "Void Shredders", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 437343, name = "Assassination", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Silken Court", abilities = {
                    { spellId = 438218, name = "Piercing Strike", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 438677, name = "Venomous Rain", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 441782, name = "Cataclysmic Entropy", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 440504, name = "Shatter Existence", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Queen Ansurek", abilities = {
                    { spellId = 437592, name = "Reactive Toxin", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 439299, name = "Silken Tomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 443325, name = "Infest", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 445422, name = "Liquefy", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 438974, name = "Royal Condemnation", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 443726, name = "Gorge", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Liberation of Undermine",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Vexie and the Geargrinders", abilities = {
                    { spellId = 466615, name = "Protective Plating", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 459453, name = "Blaze of Glory", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 471403, name = "Unrelenting CAR-nage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 459627, name = "Tank Buster", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 460603, name = "Mechanical Breakdown", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 459666, name = "Spew Oil", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Stix Bunkjunker", abilities = {
                    { spellId = 465863, name = "Demolish", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 465878, name = "Junkyard Jam", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 466042, name = "Scrap Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 466101, name = "Overflow", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Rik Reverb", abilities = {
                    { spellId = 466860, name = "Sound Check", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 466874, name = "Amplification", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 466921, name = "Echoing Chords", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 467002, name = "Resonance", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "One-Armed Bandit", abilities = {
                    { spellId = 461536, name = "Pay-Line", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 461893, name = "The Big Hit", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 462242, name = "Foul Exhaust", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 461870, name = "Overload!", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 462652, name = "Withering Flames", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 463607, name = "Rig the Game!", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Mug'Zee, Heads of Security", abilities = {
                    { spellId = 463487, name = "Molten Gold Knuckles", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 463522, name = "Double Whammy Shot", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 463881, name = "Earthshaker Gaols", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 464023, name = "Frostshatter Spears", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 464115, name = "Elemental Calamity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 463743, name = "Unstable Crawler Mines", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Cauldron of Carnage", abilities = {
                    { spellId = 464708, name = "Blastburn Roarcannon", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 464766, name = "Scrapbomb", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 464823, name = "Eruption Stomp", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 464891, name = "Molten Pool", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 465103, name = "Thunderdrum Salvo", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 465174, name = "Lightning Bash", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Sprocketmonger Lockenstock", abilities = {
                    { spellId = 468533, name = "Pyro Party Pack", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 468601, name = "Sonic Ba-Boom", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 468647, name = "Wire Transfer", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 468712, name = "Foot-Blasters", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 468890, name = "Voidsplosion", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 468544, name = "Gravi-Gunk", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Chrome King Gallywix", abilities = {
                    { spellId = 469513, name = "Scatterblast Canisters", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 469607, name = "Big Bad Buncha Bombs", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 469744, name = "Sapper's Satchel", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 469823, name = "Total Destruction!!!", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 470011, name = "Giga Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 470108, name = "Gallybux Finale Blast", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 469901, name = "1500-Pound Dud", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
},

------------------------------------------------------------------------
-- EXPANSION 11: Midnight
------------------------------------------------------------------------
[11] = {
    name = "Midnight",
    dungeons = {
        {
            name = "Priory of the Sacred Flame",
            bosses = {
                { name = "Captain Dailcry", abilities = {
                    { spellId = 447439, name = "Battle Cry", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 447272, name = "Pierce Armor", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Baron Braunpyke", abilities = {
                    { spellId = 444681, name = "Vindictive Wrath", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 444745, name = "Burning Light", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Prioress Murrpray", abilities = {
                    { spellId = 447967, name = "Holy Smite", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 447443, name = "Inner Fire", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "The Rookery",
            bosses = {
                { name = "Kyrioss", abilities = {
                    { spellId = 424148, name = "Lightning Torrent", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424368, name = "Crashing Thunder", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Stormguard Gorren", abilities = {
                    { spellId = 424737, name = "Chaotic Corruption", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 424958, name = "Dark Gravity", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Voidstone Monstrosity", abilities = {
                    { spellId = 425394, name = "Void Shell", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 425413, name = "Null Upheaval", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "Darkflame Cleft",
            bosses = {
                { name = "Ol' Waxbeard", abilities = {
                    { spellId = 421067, name = "Reckless Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 421638, name = "Rock Buster", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Blazikon", abilities = {
                    { spellId = 422700, name = "Dousing Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 422577, name = "Wicklighter Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "The Darkness", abilities = {
                    { spellId = 428266, name = "Eternal Darkness", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 427176, name = "Call Darkspawn", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
    },
    raids = {
        {
            name = "The Dreamrift",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Chimaerus, the Undreamt God", abilities = {
                    { spellId = 480112, name = "Nightmare Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 480205, name = "Devouring Dream", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 480318, name = "Corrupted Feathers", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 480401, name = "Rift Collapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 480510, name = "Undreamt Terror", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
        {
            name = "The Voidspire",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Imperator Averzian", abilities = {
                    { spellId = 481103, name = "Abyssal Claim", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 481207, name = "Void Grid", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 481315, name = "Umbral Collapse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 481422, name = "Domination Pulse", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Vorasius", abilities = {
                    { spellId = 481601, name = "Ravenous Maw", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 481710, name = "Consume Essence", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 481805, name = "Hatchling Frenzy", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 481903, name = "Void Regurgitation", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
                { name = "Fallen-King Salhadaar", abilities = {
                    { spellId = 482110, name = "Corrupted Decree", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 482215, name = "Royal Cleave", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 482308, name = "Shattered Crown", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 482412, name = "Dark Majesty", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Vaelgor and Ezzorak", abilities = {
                    { spellId = 482601, name = "Twin Void Breath", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 482715, name = "Nullzone Tether", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 482810, name = "Twisted Resonance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 482905, name = "Draconic Upheaval", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 483012, name = "Void Convergence", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Lightblinded Vanguard", abilities = {
                    { spellId = 483201, name = "Blinding Radiance", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 483310, name = "Aura Overload", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 483405, name = "Zealous Charge", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 483511, name = "Purifying Flames", cleuEvent = "SPELL_CAST_START" },
                }},
                { name = "Crown of the Cosmos", abilities = {
                    { spellId = 483701, name = "Cosmic Annihilation", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 483815, name = "Sentinel Barrage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 483910, name = "Void Eclipse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 484005, name = "Fleshy Monstrosity", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 484112, name = "The Emptiness", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 484210, name = "Alleria's Resolve", cleuEvent = "SPELL_CAST_SUCCESS" },
                }},
            },
        },
        {
            name = "March on Quel'Danas",
            difficulties = { "LFR", "Normal", "Heroic", "Mythic" },
            bosses = {
                { name = "Belo'ren, Child of Al'ar", abilities = {
                    { spellId = 484501, name = "Sunwell Ignition", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 484612, name = "Phoenix Rebirth", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 484705, name = "Blazing Plumage", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 484810, name = "Scorching Dive", cleuEvent = "SPELL_CAST_START" },
                    { spellId = 484903, name = "Light Infusion", cleuEvent = "SPELL_AURA_APPLIED" },
                }},
                { name = "Midnight Falls", abilities = {
                    { spellId = 485101, name = "Dark Naaru Pulse", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 485215, name = "Eclipsing Shadows", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 485310, name = "Void Corruption", cleuEvent = "SPELL_AURA_APPLIED" },
                    { spellId = 485408, name = "Memory of Alleria", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 485512, name = "Sunwell's Fury", cleuEvent = "SPELL_CAST_SUCCESS" },
                    { spellId = 485605, name = "L'ura's Torment", cleuEvent = "SPELL_CAST_START" },
                }},
            },
        },
    },
},

    }, -- end expansions
} -- end SoundboardDynamicData
