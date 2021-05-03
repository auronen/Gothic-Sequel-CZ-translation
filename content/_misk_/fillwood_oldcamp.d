
var int wood_ow_cave1_woodwolf_4;
var int wood_pt_wood;

func void fillwood_oldcamp()
{
};

func void fillwood_surface()
{
	WOOD_OW_CAVE1_WOODWOLF_4 = 500;
};

func void fillwood_portaltest()
{
	WOOD_PT_WOOD = 16;
};

func int mob_wood_iswoodavailable(var int amount)
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_CAVE1_WoodWOLF_4"))
	{
		if(WOOD_OW_CAVE1_WOODWOLF_4 >= amount)
		{
			return TRUE;
		};
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"Test1_2"))
	{
		if(WOOD_PT_WOOD >= amount)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	printdebugmobsi("MOB_Wood_IsWoodAvailable ...FALSE");
	return FALSE;
};

func void mob_wood_reducewood(var int amount)
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"OW_CAVE1_WoodWOLF_4"))
	{
		WOOD_OW_CAVE1_WOODWOLF_4 = WOOD_OW_CAVE1_WOODWOLF_4 - amount;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),"Test1_2"))
	{
		WOOD_PT_WOOD = WOOD_PT_WOOD - amount;
	};
	printdebugmobsi("MOB_Wood_ReduceWood...DONE");
};

