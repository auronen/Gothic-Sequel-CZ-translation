
const int TA_IT_NONE = 0;
const int TA_IT_APPLE = 1;
const int TA_IT_LOAF = 2;
const int TA_IT_CHEESE = 3;
const int TA_IT_BEER = 4;
const int TA_IT_MEAT = 5;
const int TA_IT_SOUP = 6;
const int TA_IT_MEATBUGSOUP = 7;
const int TA_IT_JOINT = 8;
const int TA_IT_BOOZE = 9;
const int TA_IT_WINE = 10;
const int TA_IT_SMALLTALK_ACTIVE = 11;
const int TA_IT_SMALLTALK_PASSIVE = 12;
const int TA_IT_SMALLTALK = 13;
const int TA_IT_FORCEDSMALLTALK = 14;

func void B_InitArmor()
{
	var C_Item myarmor;
	PrintDebugNpc(PD_TA_DETAIL,"B_InitArmor");
	myarmor = Npc_GetEquippedArmor(self);
	if(Hlp_IsItem(myarmor,grd_armor_l))
	{
		AI_PlayAni(self,"T_STAND_2_LGUARD");
	}
	else if(Hlp_IsItem(myarmor,grd_armor_h) || Hlp_IsItem(myarmor,grd_armor_m))
	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
	};
};

func void B_PlayArmor()
{
	var int guardreaktion;
	var C_Item myarmor;
	PrintDebugNpc(PD_TA_DETAIL,"B_PlayArmor");
	guardreaktion = Hlp_Random(100);
	myarmor = Npc_GetEquippedArmor(self);
	if(Hlp_IsItem(myarmor,grd_armor_l))
	{
		if(guardreaktion >= 90)
		{
			AI_PlayAni(self,"T_LGUARD_2_STAND");
			AI_PlayAni(self,"T_STAND_2_LGUARD");
		}
		else if(guardreaktion >= 80)
		{
			AI_PlayAni(self,"T_LGUARD_SCRATCH");
		}
		else if(guardreaktion >= 70)
		{
			AI_PlayAni(self,"T_LGUARD_STRETCH");
		}
		else if(guardreaktion >= 60)
		{
			AI_PlayAni(self,"T_LGUARD_CHANGELEG");
		};
	}
	else if(Hlp_IsItem(myarmor,grd_armor_h) || Hlp_IsItem(myarmor,grd_armor_m))
	{
		guardreaktion = Hlp_Random(100);
		if(guardreaktion >= 95)
		{
			AI_PlayAni(self,"T_HGUARD_2_STAND");
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		}
		else if(guardreaktion >= 90)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
	};
};

func void B_ExitArmor()
{
	var C_Item myarmor;
	PrintDebugNpc(PD_TA_DETAIL,"B_ExitArmor");
	myarmor = Npc_GetEquippedArmor(self);
	if(Hlp_IsItem(myarmor,grd_armor_l))
	{
		AI_PlayAni(self,"T_LGUARD_2_STAND");
	}
	else if(Hlp_IsItem(myarmor,grd_armor_h) || Hlp_IsItem(myarmor,grd_armor_m))
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
};

func void B_EatSmall(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_EatSmall");
	if((Npc_GetStateTime(self) >= self.aivar[11]) && (Hlp_Random(100) > 20))
	{
		AI_PlayAni(self,"T_FOOD_RANDOM_1");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_EatHuge(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_EatHuge");
	if(Npc_GetStateTime(self) >= self.aivar[11])
	{
		AI_PlayAni(self,"T_FOODHUGE_RANDOM_1");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_ThrowApple(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ThrowApple");
	if(Npc_GetStateTime(self) >= self.aivar[11])
	{
		AI_PlayAni(self,"T_FOOD_RANDOM_2");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_DrinkBottle(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_DrinkBottle");
	if((Npc_GetStateTime(self) >= self.aivar[11]) && (Hlp_Random(100) > 30))
	{
		AI_PlayAni(self,"T_POTION_RANDOM_1");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_WipeMouth(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_WipeMouth");
	if((Npc_GetStateTime(self) >= self.aivar[11]) && (Hlp_Random(100) > 50))
	{
		AI_PlayAni(self,"T_POTION_RANDOM_2");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_LookBottle(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_LookBottle");
	if(Npc_GetStateTime(self) >= self.aivar[11])
	{
		AI_PlayAni(self,"T_POTION_RANDOM_3");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_DrawJoint(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_DrawJoint");
	if(Npc_GetStateTime(self) >= self.aivar[11])
	{
		AI_PlayAni(self,"T_JOINT_RANDOM_1");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_EatMeat(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_EatMeat");
	if(Npc_GetStateTime(self) >= self.aivar[11])
	{
		AI_PlayAni(self,"T_MEAT_RANDOM_1");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void b_eatmeatbugsoup(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_EatMeatbugSoup");
	if((Npc_GetStateTime(self) >= self.aivar[11]) && (Hlp_Random(1) == 1))
	{
		AI_PlayAni(self,"T_RICE_RANDOM_1");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	}
	else
	{
		AI_PlayAni(self,"T_RICE_RANDOM_2");
		Npc_SetStateTime(self,0);
		self.aivar[11] = Hlp_Random(5) + 5;
	};
};

func void B_PlayItemRandoms(var C_Npc self)
{
	if(self.aivar[10] == TA_IT_APPLE)
	{
		B_EatSmall(self);
	};
	if(self.aivar[10] == TA_IT_LOAF)
	{
		B_EatHuge(self);
	};
	if(self.aivar[10] == TA_IT_CHEESE)
	{
		B_EatHuge(self);
	};
	if((self.aivar[10] == TA_IT_BEER) || (self.aivar[10] == TA_IT_BOOZE) || (self.aivar[10] == TA_IT_WINE))
	{
		B_DrinkBottle(self);
	};
	if(self.aivar[10] == TA_IT_JOINT)
	{
		B_DrawJoint(self);
	};
	if(self.aivar[10] == TA_IT_MEAT)
	{
		B_EatMeat(self);
	};
	if(self.aivar[10] == TA_IT_MEATBUGSOUP)
	{
		b_eatmeatbugsoup(self);
	};
	if(self.aivar[10] == TA_IT_APPLE)
	{
		B_ThrowApple(self);
	};
	if((self.aivar[10] == TA_IT_BEER) || (self.aivar[10] == TA_IT_BOOZE))
	{
		B_LookBottle(self);
	};
	if((self.aivar[10] == TA_IT_BEER) || (self.aivar[10] == TA_IT_BOOZE) || (self.aivar[10] == TA_IT_WINE))
	{
		B_WipeMouth(self);
	};
};

func void B_ChooseApple(var C_Npc self)
{
	var int int_randomizer;
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseApple");
	self.aivar[10] = TA_IT_APPLE;
	AI_PlayAni(self,"T_MOB_FOOD_1");
	ai_createiteminslot(self,"ZS_LEFTHAND",4264);
	AI_PlayAni(self,"T_MOB_FOOD_2");
	int_randomizer = Hlp_Random(20);
	if(int_randomizer < 10)
	{
		AI_PlayAni(self,"T_MOB_FOOD_RANDOM_1");
	}
	else
	{
		AI_PlayAni(self,"T_MOB_FOOD_RANDOM_2");
	};
	AI_PlayAni(self,"T_MOB_FOOD_3");
	AI_Wait(self,1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	self.aivar[11] = 1;
};

func void B_ChooseLoaf(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseLoaf");
	self.aivar[10] = TA_IT_LOAF;
	if(Npc_HasItems(self,itfo_loaf) == 0)
	{
		CreateInvItem(self,itfo_loaf);
	};
	AI_UseItemToState(self,itfo_loaf,0);
	self.aivar[11] = 1;
};

func void B_ChooseCheese(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseCheese");
	self.aivar[10] = TA_IT_CHEESE;
	if(Npc_HasItems(self,itfo_cheese) == 0)
	{
		CreateInvItem(self,itfo_cheese);
	};
	AI_UseItemToState(self,itfo_cheese,0);
	self.aivar[11] = 1;
};

func void B_ChooseBeer(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseBeer");
	self.aivar[10] = TA_IT_BEER;
	if(Npc_HasItems(self,itfo_beer) == 0)
	{
		CreateInvItem(self,itfo_beer);
	};
	AI_UseItemToState(self,itfo_beer,0);
	self.aivar[11] = 1;
};

func void B_ChooseMeat(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseMeat");
	self.aivar[10] = TA_IT_MEAT;
	if(Npc_HasItems(self,itfo_mutton) == 0)
	{
		CreateInvItem(self,itfo_mutton);
	};
	AI_UseItemToState(self,itfo_mutton,0);
	self.aivar[11] = 1;
};

func void B_ChooseSoup(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseSoup");
	self.aivar[10] = TA_IT_SOUP;
	if(Npc_HasItems(self,itfo_meatbugsoup) == 0)
	{
		CreateInvItem(self,itfo_meatbugsoup);
	};
	AI_UseItemToState(self,itfo_meatbugsoup,0);
	self.aivar[11] = 1;
};

func void b_choosemeatbugsoup(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseMeatbugsoup");
	self.aivar[10] = TA_IT_MEATBUGSOUP;
	if(Npc_HasItems(self,itfo_meatbugsoup) == 0)
	{
		CreateInvItem(self,itfo_meatbugsoup);
	};
	AI_UseItemToState(self,itfo_meatbugsoup,0);
	self.aivar[11] = 1;
};

func void B_ChooseJoint(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseJoint");
	self.aivar[10] = TA_IT_JOINT;
	if(Npc_HasItems(self,ItMiJoint_1) == 0)
	{
		CreateInvItem(self,ItMiJoint_1);
	};
	AI_UseItemToState(self,ItMiJoint_1,0);
	self.aivar[11] = 1;
};

func void B_ChooseBooze(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseBooze");
	self.aivar[10] = TA_IT_BOOZE;
	if(Npc_HasItems(self,itfo_booze) == 0)
	{
		CreateInvItem(self,itfo_booze);
	};
	AI_UseItemToState(self,itfo_booze,0);
	self.aivar[11] = 1;
};

func void B_ChooseWine(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ChooseWine");
	self.aivar[10] = TA_IT_WINE;
	if(Npc_HasItems(self,itfo_wine) == 0)
	{
		CreateInvItem(self,itfo_wine);
	};
	AI_UseItemToState(self,itfo_wine,0);
	self.aivar[11] = 1;
};

func void B_Pee(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_Pee");
	if(Wld_IsFPAvailable(self,"PEE"))
	{
		AI_Standup(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"PEE");
		AI_PlayAni(self,"T_PEE");
		AI_ContinueRoutine(self);
	};
};

func void B_Bored(var C_Npc self)
{
	var int choice;
	PrintDebugNpc(PD_TA_DETAIL,"B_Bored");
	choice = Hlp_Random(100);
	if(choice < 20)
	{
		AI_PlayAni(self,"T_BORINGKICK");
	}
	else if(choice < 30)
	{
		AI_PlayAni(self,"R_SCRATCHLSHOULDER");
	}
	else if(choice < 40)
	{
		AI_PlayAni(self,"R_SCRATCHRSHOULDER");
	}
	else if(choice < 60)
	{
		AI_PlayAni(self,"R_SCRATCHEGG");
	}
	else if(choice < 80)
	{
		AI_PlayAni(self,"R_SCRATCHHEAD");
	}
	else if(choice < 100)
	{
		AI_PlayAni(self,"R_LEGSHAKE");
	};
	AI_Wait(self,1);
};

func void B_ResetIterator(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ResetIterator");
	if(self.aivar[8] >= 5000)
	{
		self.aivar[8] = 0;
	};
	self.aivar[8] += 1;
};

func void B_ClearItem(var C_Npc self)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_ClearItem");
	if(self.aivar[10] == TA_IT_APPLE)
	{
		AI_UseItemToState(self,itfo_apple,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Apple");
	}
	else if(self.aivar[10] == TA_IT_LOAF)
	{
		AI_UseItemToState(self,itfo_loaf,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Loaf");
	}
	else if(self.aivar[10] == TA_IT_CHEESE)
	{
		AI_UseItemToState(self,itfo_cheese,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Cheese");
	}
	else if(self.aivar[10] == TA_IT_BEER)
	{
		AI_UseItemToState(self,itfo_beer,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Beer");
	}
	else if(self.aivar[10] == TA_IT_MEAT)
	{
		AI_UseItemToState(self,itfo_mutton,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Mutton");
	}
	else if(self.aivar[10] == TA_IT_SOUP)
	{
		AI_UseItemToState(self,itfo_meatbugsoup,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_MeatbugSoup");
	}
	else if(self.aivar[10] == TA_IT_MEATBUGSOUP)
	{
		AI_UseItemToState(self,itfo_meatbugsoup,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_MeatbugSoup");
	}
	else if(self.aivar[10] == TA_IT_JOINT)
	{
		AI_UseItemToState(self,ItMiJoint_1,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItMiJoint_1");
	}
	else if(self.aivar[10] == TA_IT_BOOZE)
	{
		AI_UseItemToState(self,itfo_booze,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Booze");
	}
	else if(self.aivar[10] == TA_IT_WINE)
	{
		AI_UseItemToState(self,itfo_wine,-1);
		PrintDebugNpc(PD_TA_DETAIL,"-ItFo_Wine");
	};
	self.aivar[10] = TA_IT_NONE;
};

func void B_StartUseMob(var C_Npc slf,var string mobname)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_StartUseMob");
	PrintDebugNpc(PD_TA_DETAIL,mobname);
	if(!C_BodyStateContains(slf,BS_MOBINTERACT) || C_BodyStateContains(slf,BS_MOBINTERACT_INTERRUPT))
	{
		PrintDebugNpc(PD_TA_DETAIL,"B_StartUseMob ... Kein Mobsi");
		PrintDebugNpc(PD_TA_DETAIL,mobname);
		AI_SetWalkMode(slf,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(slf),slf.wp) == 0)
		{
			PrintDebugNpc(PD_TA_DETAIL,"B_StartUseMob ... Nicht auf meinem WP");
			AI_GotoWP(slf,slf.wp);
		};
		AI_UseMob(slf,mobname,1);
	};
};

func void B_StopUseMob(var C_Npc slf,var string mobname)
{
	PrintDebugNpc(PD_TA_DETAIL,"B_StopUseMob");
	AI_UseMob(slf,mobname,-1);
	ai_removeitemfromslot(slf,"ZS_RIGHTHAND");
	ai_removeitemfromslot(slf,"ZS_LEFTHAND");
};

