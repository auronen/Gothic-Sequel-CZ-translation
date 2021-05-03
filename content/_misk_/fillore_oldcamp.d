
var int ore_ow_cave1_orewolf_4;
var int ore_ow_cave1_orewolf_5;
var int ore_pt_ore;

func void fillore_oldcamp()
{
};

func void fillore_surface()
{
	ORE_OW_CAVE1_OREWOLF_4 = 200;
	ORE_OW_CAVE1_OREWOLF_5 = 200;
};

func void fillore_portaltest()
{
	ORE_PT_ORE = 16;
};

func int mob_ore_isoreavailable(var int amount)
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_CAVE1_OREWOLF_4"))
	{
		if(ORE_OW_CAVE1_OREWOLF_4 >= amount)
		{
			return TRUE;
		};
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_CAVE1_OREWOLF_5"))
	{
		if(ORE_OW_CAVE1_OREWOLF_5 >= amount)
		{
			return TRUE;
		};
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PT_ORE"))
	{
		if(ORE_PT_ORE >= amount)
		{
			return TRUE;
		};
	};
	printdebugmobsi("MOB_Ore_IsOreAvailable ...FALSE");
	return FALSE;
};

func void mob_ore_reduceore(var int amount)
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_CAVE1_OREWOLF_4"))
	{
		ORE_OW_CAVE1_OREWOLF_4 = ORE_OW_CAVE1_OREWOLF_4 - amount;
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_CAVE1_OREWOLF_5"))
	{
		ORE_OW_CAVE1_OREWOLF_5 = ORE_OW_CAVE1_OREWOLF_5 - amount;
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PT_ORE"))
	{
		ORE_PT_ORE = ORE_PT_ORE - amount;
	};
	printdebugmobsi("MOB_Ore_ReduceOre...DONE");
};

