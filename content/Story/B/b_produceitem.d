
func void b_produceitem(var int productamount,var int productinstance,var string productname,var int rawamount,var int rawinstance)
{
	var string msg;
	var string prefix;
	if(rawamount > 0)
	{
		Npc_RemoveInvItems(hero,rawinstance,rawamount);
	};
	if(productamount > 0)
	{
		CreateInvItems(hero,productinstance,productamount);
	};
	if(hero.aivar[33] == AIV_AM_ORE)
	{
		msg = ConcatStrings(productname,NAME_SMITH_ORE_DONE);
		mob_ore_reduceore(productamount);
	}
	else if(hero.aivar[33] == AIV_AM_MELTER)
	{
		msg = ConcatStrings(productname,NAME_SMITH_MELTER_DONE);
		ai_createiteminslot(self,"ZS_RIGHTHAND",rawinstance);
		AI_PlayAni(self,"T_BSMELTER_MELT_1");
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_createiteminslot(self,"ZS_RIGHTHAND",productinstance);
		AI_PlayAni(self,"T_BSMELTER_MELT_2");
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_FIRE)
	{
		msg = ConcatStrings(productname,NAME_SMITH_FIRE_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_BSFIRE_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_BSFIRE_RANDOM_2");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_ANVIL)
	{
		msg = ConcatStrings(productname,NAME_SMITH_ANVIL_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_BSANVIL_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_BSANVIL_RANDOM_2");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_COOL)
	{
		msg = ConcatStrings(productname,NAME_SMITH_COOL_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_BSCOOL_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_BSCOOL_RANDOM_2");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_SHARP)
	{
		msg = ConcatStrings(productname,NAME_SMITH_SHARP_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_BSSHARP_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_BSSHARP_RANDOM_2");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_LAB)
	{
		msg = ConcatStrings(productname,NAME_LAB_DONE);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4701);
		AI_PlayAni(self,"T_LAB_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_CAULDRON)
	{
		msg = ConcatStrings(productname,NAME_CAULDRON_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_CAULDRON_DROP_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_PlayAni(self,"T_CAULDRON_DROP_2");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_CAULDRON_FILL_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_PlayAni(self,"T_CAULDRON_FILL_2");
	}
	else if(hero.aivar[33] == AIV_AM_WOOD)
	{
		msg = ConcatStrings(productname,NAME_WOOD_DONE);
		mob_wood_reducewood(productamount);
	}
	else if(hero.aivar[33] == AIV_AM_BOW)
	{
		msg = ConcatStrings(productname,NAME_BOW_DONE);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4679);
		AI_PlayAni(self,"T_BOGENMACHER_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_RUNEMAKER)
	{
		msg = ConcatStrings(productname,NAME_RUNEMAKER_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_RMAKER_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_RMAKER_RANDOM_2");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_RUNEMELTER)
	{
		msg = ConcatStrings(productname,NAME_RUNEMELTER_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",rawinstance);
		AI_PlayAni(self,"T_RMELTER_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",productinstance);
		AI_PlayAni(self,"T_RMELTER_RANDOM_2");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_STOMPER)
	{
		msg = ConcatStrings(productname,NAME_STOMPER_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",4698);
		AI_PlayAni(self,"T_HERB_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
	}
	else if(hero.aivar[33] == AIV_AM_FLETCHER)
	{
		printdebugmobsi("MOB_fletcher Produce");
		msg = ConcatStrings(productname,NAME_FLETCHER_DONE);
		ai_createiteminslot(self,"ZS_LEFTHAND",4678);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4677);
		AI_PlayAni(self,"T_SCHNITZER_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	};
	if(productamount > 1)
	{
		prefix = IntToString(productamount);
		prefix = ConcatStrings(prefix," ");
		msg = ConcatStrings(prefix,msg);
	};
	ai_printscreen(self,msg,-1,_YPOS_MESSAGE_PRODUCE,FONT_OLD_SMALL,_TIME_MESSAGE_PRODUCE,TEXT_COLOR_WHITE);
};

func void b_produceitem2(var int productamount,var int productinstance,var string productname,var int rawamount1,var int rawinstance1,var int rawamount2,var int rawinstance2)
{
	if(rawamount2 > 0)
	{
		Npc_RemoveInvItems(hero,rawinstance2,rawamount2);
	};
	b_produceitem(productamount,productinstance,productname,rawamount1,rawinstance1);
};

func void b_produceitem3(var int productamount,var int productinstance,var string productname,var int rawamount1,var int rawinstance1,var int rawamount2,var int rawinstance2,var int rawamount3,var int rawinstance3)
{
	if(rawamount3 > 0)
	{
		Npc_RemoveInvItems(hero,rawinstance3,rawamount3);
	};
	b_produceitem2(productamount,productinstance,productname,rawamount1,rawinstance1,rawamount2,rawinstance2);
};

