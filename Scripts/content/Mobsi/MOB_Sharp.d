//#################################################################################
//#################################################################################
//
//	Mobsi SHARP - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_HasBasics ()
{
	if 	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_SHARP)		// richtiges MOBSI?
	{
		PrintDebugMobsi	("MOB_Sharp_HasBasics...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_HasBasics...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Shortsword
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Shortsword ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Swordblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Shortsword
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Shortsword...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Shortsword...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Longsword
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Longsword ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Swordblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Longsword
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Longsword...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Longsword...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Broadsword
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Broadsword ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Swordblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Broadsword
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Broadsword...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Broadsword...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Bastardsword
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Bastardsword ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Swordblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Bastardsword
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Bastardsword...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Bastardsword...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_2HSword
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_2HSword ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_2HSwordblade)					// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_2HSword
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_2HSword...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_2HSword...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_OrcSword
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_OrcSword ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Blood2HSwordblade)				// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2)		// Talent vorhanden?
	&&	Knows_OrcSword
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_OrcSword...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_OrcSword...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Hatchet
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Hatchet ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Axeblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Hatchet
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Hatchet...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Hatchet...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Battleaxe
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Battleaxe ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Axeblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Battleaxe
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Battleaxe...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Battleaxe...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_DoublebladedAxe
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_DoublebladedAxe ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_2HAxeblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_DoublebladedAxe
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_DoublebladedAxe...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_DoublebladedAxe...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_BerserkAxe
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_BerserkAxe ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_2HAxeblade)						// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_BerserkAxe
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_BerserkAxe...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_BerserkAxe...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_OrcAxe
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_OrcAxe ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Blood2HAxeblade)				// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2)		// Talent vorhanden?
	&&	Knows_OrcAxe
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_OrcAxe...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_OrcAxe...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_IronClub
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_IronClub ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Stump)							// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Ironclub
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_IronClub...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_IronClub...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Mace
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Mace ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Stump)							// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Mace
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Mace...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Mace...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Morningstar
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Morningstar ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Stump)							// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Morningstar
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Morningstar...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Morningstar...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_Warhammer
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_Warhammer ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_2HStump)							// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 1)		// Talent vorhanden?
	&&	Knows_Warhammer
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Warhammer...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_Warhammer...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce_OrcHammer
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce_OrcHammer ()
{
	if 	MOB_Sharp_HasBasics()
	&&	Npc_HasItems(hero, ItMi_Blood2HStump)					// Rohstoff vorhanden?
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) >= 2)		// Talent vorhanden?
	&&	Knows_OrcHammer
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_OrcHammer...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce_OrcHammer...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_CanProduce
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_Sharp_CanProduce ()
{
	if 	MOB_Sharp_CanProduce_Shortsword()
	||	MOB_Sharp_CanProduce_Longsword()
	||	MOB_Sharp_CanProduce_Broadsword()
	||	MOB_Sharp_CanProduce_Bastardsword()
	||	MOB_Sharp_CanProduce_2HSword()
	||	MOB_Sharp_CanProduce_OrcSword()
	||	MOB_Sharp_CanProduce_Hatchet()
	||	MOB_Sharp_CanProduce_Battleaxe()
	||	MOB_Sharp_CanProduce_DoublebladedAxe()
	||	MOB_Sharp_CanProduce_BerserkAxe()
	||	MOB_Sharp_CanProduce_OrcAxe()
	||	MOB_Sharp_CanProduce_IronClub()
	||	MOB_Sharp_CanProduce_Mace()
	||	MOB_Sharp_CanProduce_Morningstar()
	||	MOB_Sharp_CanProduce_Warhammer()
	||	MOB_Sharp_CanProduce_OrcHammer()
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_Sharp_CanProduce...FALSE");
		return			FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	MOB_Sharp_GetCantString
///////////////////////////////////////////////////////////////////////////////////
func string	MOB_Sharp_GetCantString ()
{
	if	(Npc_GetTalentSkill(self, NPC_TALENT_SMITH) < 1)
	{
		return	_STR_MESSAGE_MOBSI_SHARP_TAL;
	}
	else
	{
		return	_STR_MESSAGE_MOBSI_SHARP_MAT;
	};
};












//#################################################################################
//#################################################################################
//
//	Mobsi SHARP - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_SHARP_CONDITION ()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_SHARP;

	if	Npc_IsPlayer(self)
	{
		if	MOB_Sharp_CanProduce()
		{
			PrintDebugMobsi	("MOB_SHARP_CONDITION...TRUE");
			return 			TRUE;
		}
		else
		{
			PrintScreen		(MOB_Sharp_GetCantString(), -1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni		(self, "T_DONTKNOW");
			PrintDebugMobsi	("MOB_SHARP_CONDITION...FALSE");
			return			FALSE;
		};
	}
	else
	{
		PrintDebugMobsi		("MOB_SHARP_CONDITION...TRUE");
		return				TRUE;
	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_SHARP_S0 ()
{
	PrintDebugMobsi		("MOB_SHARP_S0");
};

func void MOB_SHARP_S1 ()
{
	PrintDebugMobsi		("MOB_SHARP_S1");

	if	Npc_IsPlayer(self)
	{
		PrintDebugMobsi	("...vom SC benutzt");
		PrintGlobals	(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;

		AI_ProcessInfos	(self);
	};
};









//#################################################################################
//#################################################################################
//
//	Mobsi SHARP - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Exit (c_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_Sharp_HasBasics;
	information		= MOB_Sharp_Exit_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func void MOB_Sharp_Exit_Info()
{
	AI_StopProcessInfos	(hero);
	hero.aivar[AIV_INVINCIBLE] = FALSE;

	//MOBSI-Abmeldung hier!
	AI_UseMob			(self, SCEMENAME_SHARP, -1);
	AI_RemoveItemFromSlot	(self, "ZS_LEFTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_Sharp_AutoExit ()
{
	PrintDebugMobsi			("MOB_Sharp_AutoExit");

	if	!MOB_Sharp_CanProduce()
	{
		MOB_Sharp_Exit_Info();
	};
};







//#################################################################################
//#################################################################################
//
//	Mobsi SHARP - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Shortsword
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Shortsword (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Shortsword;
	information		= MOB_Sharp_Shortsword_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Swordblade,
											NAME_Ore,
											NAME_Shortsword	);
};

func VOID MOB_Sharp_Shortsword_Info()
{
	B_ProduceItem		(	1,						// Anzahl Produkt
							ItMw_Shortsword,		// Produkt
							NAME_Shortsword,		// Produkt-Name
							1,						// Anzahl Rohstoff
							ItMi_Swordblade);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Longsword
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Longsword (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Longsword;
	information		= MOB_Sharp_Longsword_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Swordblade,
											NAME_Ore,
											NAME_Longsword	);
};

func VOID MOB_Sharp_Longsword_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Longsword,		// Produkt
							NAME_Longsword,		// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Swordblade);	// Art Rohstoff

	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Broadsword
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Broadsword (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Broadsword;
	information		= MOB_Sharp_Broadsword_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Swordblade,
											NAME_Ore,
											NAME_Broadsword	);
};

func VOID MOB_Sharp_Broadsword_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Broadsword,	// Produkt
							NAME_Broadsword,	// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Swordblade);	// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Bastardsword
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Bastardsword (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Bastardsword;
	information		= MOB_Sharp_Bastardsword_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Swordblade,
											NAME_Ore,
											NAME_Bastardsword	);
};

func VOID MOB_Sharp_Bastardsword_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Bastardsword,	// Produkt
							NAME_Bastardsword,	// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Swordblade);	// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	2HSword
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_2HSword (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_2HSword;
	information		= MOB_Sharp_2HSword_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HSwordblade,
											NAME_Ore,
											NAME_2HSword	);
};

func VOID MOB_Sharp_2HSword_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_2HSword,		// Produkt
							NAME_2HSword,		// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_2HSwordblade);	// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	OrcSword
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_OrcSword (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_OrcSword;
	information		= MOB_Sharp_OrcSword_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HSwordblade,
											NAME_BloodOre,
											NAME_OrcSword	);
};

func VOID MOB_Sharp_OrcSword_Info()
{
	B_ProduceItem		(	1,							// Anzahl Produkt
							ItMw_OrcSword,				// Produkt
							NAME_OrcSword,				// Produkt-Name
							1,							// Anzahl Rohstoff
							ItMi_Blood2HSwordblade);	// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Hatchet
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Hatchet (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Hatchet;
	information		= MOB_Sharp_Hatchet_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Axeblade,
											NAME_Ore,
											NAME_Hatchet	);
};

func VOID MOB_Sharp_Hatchet_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Hatchet,		// Produkt
							NAME_Hatchet,		// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Axeblade);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Battleaxe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Battleaxe (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Battleaxe;
	information		= MOB_Sharp_Battleaxe_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Axeblade,
											NAME_Ore,
											NAME_Battleaxe	);
};

func VOID MOB_Sharp_Battleaxe_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Battleaxe,		// Produkt
							NAME_Battleaxe,		// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Axeblade);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	DoublebladedAxe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_DoublebladedAxe (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_DoublebladedAxe;
	information		= MOB_Sharp_DoublebladedAxe_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HAxeblade,
											NAME_Ore,
											NAME_DoublebladedAxe	);
};

func VOID MOB_Sharp_DoublebladedAxe_Info()
{
	B_ProduceItem		(	1,						// Anzahl Produkt
							ItMw_DoublebladedAxe,	// Produkt
							NAME_DoublebladedAxe,	// Produkt-Name
							1,						// Anzahl Rohstoff
							ItMi_2HAxeblade);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Berserkaxe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Berserkaxe (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Berserkaxe;
	information		= MOB_Sharp_Berserkaxe_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HAxeblade,
											NAME_Ore,
											NAME_BerserkAxe	);
};

func VOID MOB_Sharp_Berserkaxe_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_BerserkAxe,	// Produkt
							NAME_BerserkAxe,	// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_2HAxeblade);	// Art Rohstoff
	MOB_Sharp_AutoExit	();
};


///////////////////////////////////////////////////////////////////////////////////
//	OrcAxe
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_OrcAxe (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_OrcAxe;
	information		= MOB_Sharp_OrcAxe_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HAxeblade,
											NAME_BloodOre,
											NAME_OrcAxe	);
};

func VOID MOB_Sharp_OrcAxe_Info()
{
	B_ProduceItem		(	1,						// Anzahl Produkt
							ItMw_OrcAxe,			// Produkt
							NAME_OrcAxe,			// Produkt-Name
							1,						// Anzahl Rohstoff
							ItMi_Blood2HAxeblade);	// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Ironclub
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Ironclub (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Ironclub;
	information		= MOB_Sharp_Ironclub_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Stump,
											NAME_Ore,
											NAME_Ironclub	);
};

func VOID MOB_Sharp_Ironclub_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Ironclub,		// Produkt
							NAME_Ironclub,		// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Stump);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Mace
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Mace (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Mace;
	information		= MOB_Sharp_Mace_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Stump,
											NAME_Ore,
											NAME_Mace	);
};

func VOID MOB_Sharp_Mace_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Mace,			// Produkt
							NAME_Mace,			// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Stump);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Morningstar
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Morningstar (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Morningstar;
	information		= MOB_Sharp_Morningstar_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_Stump,
											NAME_Ore,
											NAME_Morningstar	);
};

func VOID MOB_Sharp_Morningstar_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Morningstar,	// Produkt
							NAME_Morningstar,	// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_Stump);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Warhammer
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Warhammer (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Warhammer;
	information		= MOB_Sharp_Warhammer_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HStump,
											NAME_Ore,
											NAME_Warhammer	);
};

func VOID MOB_Sharp_Warhammer_Info()
{
	B_ProduceItem		(	1,					// Anzahl Produkt
							ItMw_Warhammer,		// Produkt
							NAME_Warhammer,		// Produkt-Name
							1,					// Anzahl Rohstoff
							ItMi_2HStump);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};

///////////////////////////////////////////////////////////////////////////////////
//	Orchammer
///////////////////////////////////////////////////////////////////////////////////
instance MOB_Sharp_Orchammer (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_Sharp_CanProduce_Orchammer;
	information		= MOB_Sharp_Orchammer_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildSharpString(	NAME_2HStump,
											NAME_BloodOre,
											NAME_Orchammer	);
};

func VOID MOB_Sharp_Orchammer_Info()
{
	B_ProduceItem		(	1,						// Anzahl Produkt
							ItMw_Orchammer,			// Produkt
							NAME_Orchammer,			// Produkt-Name
							1,						// Anzahl Rohstoff
							ItMi_Blood2HStump);		// Art Rohstoff
	MOB_Sharp_AutoExit	();
};









